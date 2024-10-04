<?php

namespace App\Admin\Controllers;

use App\Models\Vet;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Carbon\Carbon;
use Encore\Admin\Facades\Admin;
use App\Models\Utils;
use App\Models\Location;


class VetController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Vet & Paravet Registration';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Vet());

        $grid->filter(function ($f) {
            $f->disableIdFilter();
            $f->like('category', 'Category')->select(['Vet' => 'Vet', 'Paravet' => 'Paravet']);
            $f->like('education', 'Education')->select(['None' => 'None', 'Primary' => 'Primary', 'Secondary' => 'Secondary', 'Tertiary' => 'Tertiary', 'Bachelor' => 'Bachelor', 'Masters' => 'Masters', 'PhD' => 'PhD', 'Diploma' => 'Diploma']);
            $f->between('created_at', 'Filter by date registered')->date();
        });

        //show a user only their records if they are not an admin
        if (!Admin::user()->inRoles(['administrator','ldf_admin'])) {
            $grid->model()->where('user_id', Admin::user()->id);
        }
        //disable batch actions
        $grid->disableBatchActions();

         //order of table
         $grid->model()->orderBy('id', 'desc');

         //disable action buttons appropriately
         Utils::disable_buttons('Vet', $grid);

        $grid->export(function ($export) {
        
            $export->originalValue(['status',]);
            $export->except(['created_at', 'updated_at','profile_picture',]);
           
        });
        $grid->column('profile_picture', __('Profile picture'))->display(function ($logo) {
            // Set a default logo path
            $defaultLogo = '/storage/assets/person.png';
        
            // Check if the logo exists and is readable
            $logoPath = $logo ? "/storage/$logo" : $defaultLogo;
            
            // Use the default logo if the specific logo is not readable
            if (!is_readable(public_path($logoPath))) {
                $logoPath = $defaultLogo;
            }
        
            return "<img src='$logoPath' style='width:55px; height:50px; border-radius:50%;'>";
        });

        $grid->column('created_at', __('Registered On'))->display(function ($x) {
            $c = Carbon::parse($x);
        if ($x == null) {
            return $x; 
        }
        return $c->format('d M, Y');
        });
     
        $grid->column('title', __('Title'));
        $grid->column('category', __('Category'));
        $grid->column('surname', __('Surname'));
        $grid->column('primary_phone_number', __('Primary phone number'));
        $grid->column('email', __('Email'));
        $grid->column('areas_of_operation', __('Areas of operation'));
        $grid->column('status', __('Status'))->display(function ($status) {
            if ($status == 'approved') {
                return "<span class='label label-success'>Approved</span>";
            } elseif ($status == 'rejected') {
                return "<span class='label label-danger'>Rejected</span>";
            } else {
                return "<span class='label label-warning'>Pending</span>";
            }
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
        $show = new Show(Vet::findOrFail($id));
        //delete notification after viewing the form
        Utils::delete_notification('Vet', $id);

        $vet = Vet::findorFail($id);
        return view('vets_profile', compact('vet'));

    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Vet());

        if($form->isCreating()){
            $form->hidden('status')->default('approved');
            $form->hidden('added_by')->default(Admin::user()->id);
        }

           //after saving the form, redirect to the table view
           $form->saved(function (Form $form) {
            admin_toastr('Record saved successfully', 'success');
            return redirect('/admin/vets');
        });


        //when saving the form, check that the available times are not overlapping and that the start time is before the end time for each day and that it has been entered
        $form->saving(function (Form $form) {
            $availableTimes = $form->availableTimes;
            $days = [];
            //check if null
            if (empty($availableTimes)) {
                admin_toastr('Please enter the available times', 'error');
                return back()->withInput();
            }
            foreach ($availableTimes as $time) {
                if (in_array($time['day'], $days)) {
                    admin_toastr('You have entered the same day more than once', 'error');
                    return back()->withInput();
                }
                $days[] = $time['day'];
                if ($time['start_time'] >= $time['end_time']) {
                    admin_toastr('The start time must be before the end time', 'error');
                    return back()->withInput();
                }
            
            }
        }); 

        $form->select('title', __('Title'))
        ->options([
            'Mr' => 'Mr',
            'Mrs' => 'Mrs',
            'Miss' => 'Miss',
            'Dr' => 'Dr',
            'Prof' => 'Prof',
        ])
        ->rules('required');
        $form->radio('category', __('Category'))->options(['Vet' => 'Vet', 'Paravet' => 'Paravet'])->rules('required')->default('Vet');
        $form->text('surname', __('Surname'))->rules('required');
        $form->text('given_name', __('Given name'))->rules('required');
        $form->radio('gender', __('Gender'))->options(['M'=> 'Male', 'F' => 'Female'])->rules('required');
        $form->date('date_of_birth', __('Date of birth'))->rules('required|before:today');
        $form->select('education', __('Highest level of education'))
            ->options([
                'None' => 'None',
                'Primary Education' => 'Primary Education',
                'Secondary Education' => 'Secondary Education',
                'Tertiary Education' => 'Tertiary Education',
                'Bachelor Degree' => 'BachelorS Degree',
                'Masters Degree' => 'Masters Degree',
                'PhD' => 'PhD',
                'Diploma' => 'Diploma',
            ]);
        $form->radio('marital_status', __('Marital status'))->options(['S'=> 'Single', 'M' => 'Married', 'D' => 'Divorced', 'W' => 'Widowed']);
        $form->text('group_or_practice', __('Group or practice'))->rules('required');
        $form->text('registration_number', __('Registration number'))->rules('required');
        $form->date('registration_date', __('Registration date'))->rules('required');
        $form->textarea('brief_profile', __('Brief profile'));
        $form->text('physical_address', __('Physical address'))->rules('required');
        $form->email('email', __('Email'))->rules('required');
        $form->text('primary_phone_number', __('Primary phone number'))->rules('required');
        $form->text('secondary_phone_number', __('Alternative phone number'));
        $form->text('postal_address', __('Postal address'));
        $form->textarea('services_offered', __('Services offered'))->rules('required');
        $form->select('areas_of_operation', __('District of operation'))->options(Location::pluck('name', 'name')->toArray())
        ->rules('required');
        //add available times
        $form->hasMany('availableTimes', 'Available times', function (Form\NestedForm $form) {
            $form->select('day', 'Day')->options([
                'Monday' => 'Monday',
                'Tuesday' => 'Tuesday',
                'Wednesday' => 'Wednesday',
                'Thursday' => 'Thursday',
                'Friday' => 'Friday',
                'Saturday' => 'Saturday',
                'Sunday' => 'Sunday',
            ])->rules('required');
            $form->time('start_time', 'Start time')->rules('required');
            $form->time('end_time', 'End time')->rules('required');
         
        });

        $form->file('certificate_of_registration', __('Certificate of registration'))->rules('mimes:pdf', ['mimes' => 'Only pdf files are allowed'],'size:1048')->required();
        $form->file('license', __('License'))->rules('mimes:pdf', ['mimes' => 'Only pdf files are allowed'],'size:1048')->required();
        $form->image('profile_picture', __('Profile picture'))->rules('mimes:jpeg,jpg,png', ['mimes' => 'Only jpeg, jpg and png files are allowed'],'size:1048');
        $form->hidden('user_id');

         //check if the user is an admin and show the status field
           if($form->isEditing())
         {
               if (Admin::user()->inRoles(['administrator','ldf_admin'])) {
             $form->radioCard('status', __('Status'))->options(['halted' => 'Halted', 'approved' => 'Approved', 'rejected' => 'Rejected'])->rules('required')
            ->when('in',['rejected','halted'], function (Form $form) {
                $form->textarea('rejection_reason', 'Rejection reason')->rules('required');
                                
            
             });
             }
            }

        $form->tools(function (Form\Tools $tools) {
          
            $tools->disableView();
           
        });

        return $form;
    }
}
