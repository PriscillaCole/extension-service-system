<?php

namespace App\Admin\Controllers;

use App\Admin\Actions\Farmer\ApproveOrDeny;
use App\Admin\Actions\Farmer\Inspect;
use App\Models\Farmer;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\Models\Utils;
use Encore\Admin\Facades\Admin;


class FarmerController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Farmer';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Farmer());
     
        $grid->filter(function ($f) {
            $f->disableIdFilter();
            $f->between('created_at', 'Filter by date')->date();
            $f->where(function ($query) {
                $query->where('surname', 'like', "%{$this->input}%")
                    ->orWhere('given_name', 'like', "%{$this->input}%")
                    ->orWhere('nin', 'like', "%{$this->input}%")
                    ->orWhere('primary_phone_number', 'like', "%{$this->input}%")
                    ->orWhere('secondary_phone_number', 'like', "%{$this->input}%");
            }, 'Search by name, nin, phone number');
            

        });

        $grid->export(function ($export) {
        
            $export->originalValue(['status',]);
            $export->except(['created_at', 'updated_at','profile_picture',]);
           
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
        
        $grid->column('surname', __('Surname'));
        $grid->column('given_name', __('Given name'));
        $grid->column('physical_address', __('Physical address'));
        $grid->column('marital_status', __('Marital status'))->display(function ($marital_status) {
            switch ($marital_status) {
                case 'S':
                    return 'Single';
                    break;
                case 'M':
                    return 'Married';
                    break;
                case 'D':
                    return 'Divorced';
                    break;
                case 'W':
                    return 'Widowed';
                    break;
                default:
                    return 'Unknown';
                    break;
            }
        });
        $grid->column('status', __('Status'))->display(function ($status) {
            switch ($status) {
                case 'active':
                    return "<span class='label label-success'>Active</span>";
                    break;
                default:
                    return 'Unknown';
                    break;
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
        $show = new Show(Farmer::findOrFail($id));
         //delete notification after viewing the form
         Utils::delete_notification('Farmer', $id);

         $farmer = Farmer::findorFail($id);
         return view('farmers_profile', compact('farmer'));
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Farmer());
        if($form->isCreating()){
            $form->hidden('status')->default('active');
           
        }
        $form->tools(function (Form\Tools $tools) {
          
            $tools->disableView();
           
        });
        //after saving the form, redirect to the table view
        $form->saved(function (Form $form) {
            admin_toastr('Record saved successfully', 'success');
            return redirect('/admin/farmers');
        });

        $form->text('surname', __('Surname'))->rules('required');
        $form->text('given_name', __('Given name'))->rules('required');
        $form->radio('gender', __('Gender'))->options(['M'=> 'Male', 'F' => 'Female'])->rules('required');
        $form->date('date_of_birth', __('Date of birth'))->rules('required|before:today');
        $form->text('nin', __('Nin'))->rules('required');
        $form->radio('marital_status', __('Marital status'))->options(['S'=> 'Single', 'M' => 'Married', 'D' => 'Divorced', 'W' => 'Widowed']);
        $form->text('primary_phone_number', __('Phone number'))->rules('required');
        $form->text('secondary_phone_number', __('Other phone number'));
        $form->email('email', __('Email address'));
        $form->text('physical_address', __('Physical address'))->rules('required');
        $form->text('cooperative_association', __('Cooperative/Association'));
        $form->radio('is_land_owner', __('Do you own land ?'))->options([true => 'Yes', false => 'No']);
        $form->select('production_scale', __('Production Type'))->options([
            'Small scale' => 'Small scale',
            'Medium scale' => 'Medium scale',
            'Large scale' => 'Large scale',
            'Commercial scale' => 'Commercial scale',
            'Other' => 'Other'
        ])->rules('required');
        $form->radio('access_to_credit', __('Have you ever gotten credit?'))->options([true=> 'Yes', false => 'No']);  
        $form->date('farming_experience', __('Which year did you start farming?'))->default(date('Y'))->format('YYYY')->rules('required');
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
            
        $form->image('profile_picture', __('Profile picture'))->rules('mimes:jpeg,jpg,png', ['mimes' => 'Only jpeg, jpg and png files are allowed'],'size:1048');
        $form->hidden('added_by')->default(Admin::user()->id);
        $form->hidden('user_id');
      
        return $form;
    }
}
