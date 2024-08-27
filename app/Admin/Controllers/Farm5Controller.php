<?php

namespace App\Admin\Controllers;

use App\Models\Farm;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Carbon\Carbon;
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
            $f->like('location', 'SubCounty');
            $f->like('production_type', 'Farm type');
            $f->between('created_at', 'Filter by date registered')->date();
        });

        if(Admin::user()->isRole('ldf_admin') || Admin::user()->isRole('administrator')) {
            $grid->model()->latest();
        }else {
            $grid->model()->where('owner_id', Admin::user()->id)->latest();
        }

        $grid->column('created_at', __('Registered On'))->display(function ($x) {
            $c = Carbon::parse($x);
        if ($x == null) {
            return $x;
        }
        return $c->format('d M, Y');
        });

        $grid->column('name', __('Name'));
        $grid->column('location', __('SubCounty'));
        $grid->column('production_type', __('Farm type'));
        $grid->column('date_of_establishment', __('Date of establishment'));
        $grid->column('breeds', __('Breeds'));
        

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
    
        $form->text('name', __('Farm name'))->rules('required');
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
        $form->text('location', __('SubCounty'))->rules('required');
        $form->text('breeds', __('Enter Breeds'));
        $form->text('production_type', __('Farm Type'))->rules('required')->help('e.g. Dairy, Beef, Eggs, etc.');
        $form->date('date_of_establishment', __('Date of establishment'))->default(date('Y-m-d'))->format('YYYY')->rules('required');
        $form->text('size', __('Land Size in acres'))->rules('required')->help('e.g. 10 acres, 20 acres, etc.');
        $form->number('number_of_animals', __('Animal density'))->rules('required')->help('e.g. 100 cows, 200 chickens, etc.');
        $form->text('farm_structures', __('Farm structures'))->help('e.g. Cowshed, chicken coop, etc.');
        $form->image('profile_picture', __('Farm image'));
        $form->hidden('added_by')->value(Admin::user()->id);

        return $form;
    }
}
