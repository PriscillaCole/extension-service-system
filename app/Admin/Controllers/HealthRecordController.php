<?php

namespace App\Admin\Controllers;

use App\Models\HealthRecord;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class HealthRecordController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'HealthRecord';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new HealthRecord());

        //disable the id filter and filter by tag
        // $grid->filter(function ($f) {
        //     $f->disableIdFilter();
        //     $f->select('animal_id', 'Animal')->options(\App\Models\FarmAnimal::all()->pluck('tag_number', 'id'));
          
        // });

        //disable filter
        $grid->disableFilter();


        $grid->column('animal_id', __('Animal Tag Number '))->display(function ($animal_id) {
            $animal = \App\Models\FarmAnimal::find($animal_id)->tag_number;
            return "<a href='/farm-animals/$animal_id'>Tag-$animal</a>";
        });
        $grid->column('paravet_id', __('Paravet'))->display(function ($paravet_id) {
            $paravet = \App\Models\Vet::find($paravet_id)->surname;
            return "<a href='/vets/$paravet_id'>$paravet</a>";
        });
        $grid->column('visit_date', __('Visit date'));
      

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
        $show = new Show(HealthRecord::findOrFail($id));

        $healthRecords = HealthRecord::findorFail($id);
        return view('health_records', compact('healthRecords'));

    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new HealthRecord());

        

        $form->select('farmer_id', 'Farmer')->options(\App\Models\Farmer::all()->pluck('surname', 'id'))->attribute('id', 'farmer_id')->required();
        $form->select('farm_id', __('Farm'))->attribute('id', 'farm_id')->required();
        $form->select('animal_id', __('Animal'))->attribute('id', 'animal_id')->required();
        $form->select('paravet_id', __('Paravet'))->options(\App\Models\Vet::all()->pluck('surname', 'id'))->required();
        $form->date('visit_date', __('Visit date'))->default(date('Y-m-d'))->required();
      
        $form->divider('Health Metrics');
        $form->decimal('weight', __('Weight'));
        $form->decimal('body_temperature', __('Body temperature'));
        $form->number('heart_rate', __('Heart rate'));
        $form->number('respiratory_rate', __('Respiratory rate'));

        $form->divider('Physical Examination');
        $form->decimal('body_condition_score', __('Body condition score'));
        $form->textarea('skin_condition', __('Skin condition'))->help('Observations about the skin, such as lesions, parasites, or abnormalities.');
        $form->textarea('mucous_membranes', __('Mucous membranes'))->help('Observations about the mucous membranes, such as color, moisture, or abnormalities.');
        $form->textarea('hoof_condition', __('Hoof condition'));

        $form->divider('Clinical Examination');
        $form->text('appetite', __('Appetite'));
        $form->textarea('behavior', __('Behavior'))->help('Observations about the animal\'s behavior, such as activity level, vocalizations, or interactions with other animals.');
        $form->textarea('gait_posture', __('Gait posture'))->help('Observations about the animal\'s gait and posture, such as lameness, stiffness, or abnormal movements.');
        $form->textarea('signs_of_pain', __('Signs of pain'));

        $form->divider('Laboratory Tests');
        $form->textarea('fecal_exam_results', __('Fecal exam results'));
        $form->textarea('blood_test_results', __('Blood test results'));
        $form->textarea('urine_test_results', __('Urine test results'));

        $form->divider('Treatments Administered');
        $form->textarea('medications', __('Medications'));
        $form->textarea('vaccinations', __('Vaccinations'));
        $form->textarea('procedures', __('Procedures'))->help('Any medical procedures performed, such as surgery, dental work, or diagnostic tests.');
        $form->textarea('follow_up_actions', __('Follow up actions'));

        $form->divider('General Observations');
        $form->select('overall_health_status', __('Overall health status'))->options
        (['healthy' => 'Healthy', 
        'sick' => 'Sick', 
        'injured' => 'Injured', 
        'recovering' => 'Recovering',
        'critical' => 'Critical',
        'quarantined' => 'Quarantined',
        'under_observation' => 'Under observation',
        'euathanized' => 'Euthanized',
        'unknown' => 'Unknown']);
        $form->textarea('environmental_factors', __('Environmental factors'));
        $form->textarea('notes', __('Notes'));

        

        //script to get animals per farm
        Admin::script("
            $(document).ready(function() {
                $('#farmer_id').change(function() {
                    var farmerId = $(this).val();
                    console.log(farmerId);
                    if (farmerId) {
                        $.ajax({
                            url: '/farmer-farms/' + farmerId,
                            type: 'GET',
                            success: function(data) {
                                $('#farm_id').empty().append('<option value=\"\">Select Farm</option>');
                                $.each(data, function(id, name) {
                                    $('#farm_id').append('<option value=\"' + id + '\">' + name + '</option>');
                                });
                            }
                        });
                    } else {
                        $('#farm_id').empty().append('<option value=\"\">Select Farm</option>');
                        $('#animal_id').empty().append('<option value=\"\">Select Animal</option>');
                    }
                });

                $('#farm_id').change(function() {
                    var farmId = $(this).val();
                    if (farmId) {
                        $.ajax({
                            url: '/farms-animals/' + farmId,
                            type: 'GET',
                            success: function(data) {
                            console.log(data);
                                $('#animal_id').empty().append('<option value=\"\">Select Animal</option>');
                                $.each(data, function(id, name) {
                                    $('#animal_id').append('<option value=\"' + id + '\">' + name + '</option>');
                                });
                            }
                                
                        });
                    } else {
                        $('#animal_id').empty().append('<option value=\"\">Select Animal</option>');
                    }
                        
                });
            });
        ");

        //ignore the farmer_id when submitting and farm_id
        $form->ignore('farmer_id');

        return $form;
       
    }

        public function getFarms($id)
    {
        $farms =\App\Models\Farm::where('owner_id', $id)->pluck('name', 'id');
        return response()->json($farms);
    }

    public function getAnimals($id)
    {
        $animals = \App\Models\FarmAnimal::where('farm_id', $id)->pluck('tag_number', 'id');
        return response()->json($animals);
    }


   
}
