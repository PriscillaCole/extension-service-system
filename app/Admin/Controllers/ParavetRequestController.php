<?php

namespace App\Admin\Controllers;

use App\Models\ParavetRequest;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Facades\Admin;

class ParavetRequestController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'ParavetRequest';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ParavetRequest());

        $grid->column('user_id', __('Request by'))->display(function($userId){
            return \App\Models\User::find($userId)->name;
        });
        $grid->column('paravet_id', __('Paravet'))->display(function($paravetId){
            return \App\Models\Vet::find($paravetId)->surname;
        });
        $grid->column('location', __('Location'));
        $grid->column('status', __('Status'));
        $grid->column('date', __('Date'));
        $grid->column('time', __('Time'));
        $grid->column('created_at', __('Created at'));
   

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
        $show = new Show(ParavetRequest::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('user_id', __('User id'));
        $show->field('paravet_id', __('Paravet id'));
        $show->field('location', __('Location'));
        $show->field('status', __('Status'));
        $show->field('description', __('Description'));
        $show->field('date', __('Date'));
        $show->field('time', __('Time'));
        $show->field('rejected_reason', __('Rejected reason'));
   

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new ParavetRequest());

        $form->hidden('user_id', __('User id'))->value(Admin::user()->id);
        $form->text('location', __('Location'));
        $form->text('status', __('Status'))->default('pending');
        $form->textarea('description', __('Description'));
        $form->date('date', __('Date'))->default(date('Y-m-d'));
        $form->time('time', __('Time'))->default(date('H:i:s'));
        $form->text('rejected_reason', __('Rejected reason'));

        return $form;
    }
}
