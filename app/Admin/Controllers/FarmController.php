<?php

namespace App\Admin\Controllers;

use App\Models\Farm;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Facades\Admin;

class FarmController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Farm';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Farm());

        $grid->filter(function ($f) {
            $f->disableIdFilter();
            $f->like('name', 'Farm name');
            $f->between('created_at', 'Filter by date registered')->date();
        });

          //order of table
          $grid->model()->orderBy('id', 'desc');

        $grid->column('name', __('Name'));
        $grid->column('date_of_establishment', __('Date of establishment'));
        $grid->column('size', __('Size'));
        $grid->column('number_of_animals', __('Number of animals'));
        $grid->column('owner_id', __('Owner'))->display(function ($owner_id) {
            return \App\Models\Farmer::find($owner_id)->surname . ' ' . \App\Models\Farmer::find($owner_id)->given_name;
        });
        $grid->column('added_by', __('Added by'))->display(function ($added_by) {
            return \App\Models\User::find($added_by)->name ?? 'N/A';
        });
        $grid->column('created_at', __('Created at'))->display(function ($created_at) {
            return date('d-M-Y', strtotime($created_at));
        });
    

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Farm::findOrFail($id));

        
        $farm = Farm::findorFail($id);
        return view('farms_profile', compact('farm'));
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Farm());

        $form->select('owner_id', __('Owner'))
        ->options(\App\Models\Farmer::all()->mapWithKeys(function ($farmer) {
            return [$farmer->id => $farmer->surname . ' ' . $farmer->given_name];
        }))
        ->rules('required');
        $form->text('name', __('Name'));
         //  //add a get gps coordinate button
         $form->html('<button type="button" id="getLocationButton">' . __('Get GPS Coordinates') . '</button>');

         $form->text('coordinates', __('Location '))->attribute([
             'id' => 'coordinates',   
         ])->required();
      
         
         //script to get the gps coordinates
         Admin::script(<<<SCRIPT
             document.getElementById('getLocationButton').addEventListener('click', function() {
                 if ("geolocation" in navigator) {
                     navigator.geolocation.getCurrentPosition(function(position) {
                         document.getElementById('coordinates').value = position.coords.latitude + ', ' + position.coords.longitude;
                     });
                 } else {
                     alert('Geolocation is not supported by your browser.');
                 }
             });
         SCRIPT);

        $form->multipleSelect('livestock_type', __('Livestock type'))->options([
            'cattle' => 'Cattle',
            'sheep' => 'Sheep',
            'goats' => 'Goats',
            'poultry' => 'Poultry',
            'pigs' => 'Pigs',
            'rabbits' => 'Rabbits',
            'camel' => 'Camels',
            'others' => 'Others',
        ])->required();
        $form->multipleSelect('production_type', __('Production type'))->options([
            'milk' => 'Milk',
            'eggs' => 'Eggs',
            'meat' => 'Meat',
            'honey' => 'Honey',
            'wool' => 'Wool',
            'others' => 'Others',
        ])->required();
        $form->text('date_of_establishment', __('Date of establishment'))->required();
        $form->text('size', __('Land Size in acres'))->required();
        $form->number('number_of_animals', __('Number of animals'));
        $form->multipleSelect('farm_structures', __('Farm structures'))->options([
            'barn' => 'Barn',
            'silo' => 'Silo',
            'pen' => 'Pen',
            'chicken coop' => 'Chicken coop',
            'others' => 'Others',
        ])->required();
        $form->textarea('general_remarks', __('General remarks'));
        $form->file('profile_picture', __('Farm image'))->rules('mimes:jpeg,bmp,png');
        $form->hidden('added_by')->value(Admin::user()->id);

        return $form;
    }
}
