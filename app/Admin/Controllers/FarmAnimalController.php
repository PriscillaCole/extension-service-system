<?php

namespace App\Admin\Controllers;

use App\Models\FarmAnimal;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Facades\Admin;

class FarmAnimalController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'FarmAnimal';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new FarmAnimal());

       
        $grid->column('farm_id', __('Farm'))->display(function ($farm_id) {
            $farm = \App\Models\Farm::find($farm_id)->name;
            return "<a href='/admin/farms/$farm_id'>$farm</a>";
        });
        $grid->column('type', __('Type'));
        $grid->column('tag_number', __('Tag number'));
        $grid->column('species', __('Species'));
        $grid->column('gender', __('Gender'));
        $grid->column('color', __('Color'));
        $grid->column('weight', __('Weight(kgs)'));
       
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
        $show = new Show(FarmAnimal::findOrFail($id));

        $show->field('farm_id', __('Farm'))-> as(function ($farm_id) {
            $farm = \App\Models\Farm::find($farm_id)->name;
            return "<a href='/farms/$farm_id'>$farm</a>";
        })->unescape();
        $show->field('type', __('Type'));
        $show->field('tag_number', __('Tag number'));
        $show->field('species', __('Species'));
        $show->field('gender', __('Gender'));
        $show->field('date_of_birth', __('Date of birth'));
        $show->field('color', __('Color'));
        $show->field('current_location', __('Current location'));
        $show->field('weight', __('Weight of animal(kgs)'));
        $show->field('body_condition_score', __('Body condition score'));
        $show->field('health_history', __('Health history'));
        $show->field('medications', __('Medications'));
        $show->field('vaccinations', __('Vaccinations'));
        $show->field('dietary_requirements', __('Dietary requirements'));
        $show->field('parentage', __('Parentage'));
        $show->field('behavioral_notes', __('Behavioral notes'));
        $show->field('handling_requirements', __('Handling requirements'));
        $show->field('management_notes', __('Management notes'));
        $show->field('feeding_schedule', __('Feeding schedule'));
      

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new FarmAnimal());

        $form->select('farmer_id', 'Farmer')->options(\App\Models\Farmer::all()->pluck('surname', 'id'))->attribute('id', 'farmer_id');
        $form->select('farm_id', __('Farm'))->attribute('id', 'farm_id');
        $form->text('type', __('Type'));
        $form->text('tag_number', __('Tag number'));
        $form->text('species', __('Species'));
        $form->radio('gender', __('Gender'))->options(['male'=> 'Male','female'=>'Female']);
        $form->date('date_of_birth', __('Date of birth'))->default(date('Y-m-d'));
        $form->text('color', __('Color/Markings'))->help('Description of the animal\'s color and markings');
        $form->text('current_location', __('Current location'))->help('Where the animal is currently located');
        $form->decimal('weight', __('Weight of animal(kgs)'));
        $form->number('body_condition_score', __('Body condition score'));
        $form->textarea('health_history', __('Health history'))->help('Any notable health events or conditions.');
        $form->textarea('medications', __('Medications'))->help('Any medications the animal is currently taking');
        $form->textarea('vaccinations', __('Vaccinations'))->help('Any vaccinations the animal has received and dates administered');
        $form->textarea('dietary_requirements', __('Dietary requirements'))->help('Special dietary needs or restrictions');
        $form->textarea('parentage', __('Parentage'))->help('If known, details about the animal\'s parents');
        $form->textarea('behavioral_notes', __('Behavioral notes'))->help('Description of the animal\'s behavior and temperament');
        $form->textarea('handling_requirements', __('Handling requirements'))->help('Any special instructions or requirements for handling the animal');
        $form->textarea('management_notes', __('Management notes'))->help('Any other relevant notes or observations');
        $form->textarea('feeding_schedule', __('Feeding schedule'))->help('Regular feeding times and types of feed');

        //script to get the farms per farmer

    Admin::script('
            $(document).ready(function() {
                $("#farmer_id").change(function() {
                    var farmerId = $(this).val();
                    console.log(farmerId);
                    
                    $.ajax({
                        url: "/farmers-farms/" + farmerId,
                        method: "GET",
                        success: function(data) {
                            var selectElement = $("#farm_id");
                            
                            selectElement.empty();
                            
                            for (var i = 0; i < data.length; i++) {
                                selectElement.append("<option value=\'" + data[i].id + "\'>" + data[i].text + "</option>");
                            }
                        }
                    });
                });
            });
        ');

        //when submitting ,ignore the farmer_id
        $form->ignore(['farmer_id']);


        return $form;
    }

    public function getFarms($id)
    {
        $farms = \App\Models\Farm::where('owner_id', $id)->get(['id', 'name as text']);

        return $farms;
    }
}
