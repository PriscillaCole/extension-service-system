<?php

namespace App\Admin\Actions\Farmer;

use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class Inspect extends RowAction
{
    public $name = 'Assign Agent';

    public function form()
    {
        $this->select('agent_id', 'select Agent')->options(\App\Models\User::getAgents()->pluck('name', 'id'));
    }

    public function handle(Model $model, Request $request)
    {
        $agent_id = $request->get('agent_id');
        $model->agent_id = $agent_id;
        $model->save();

        return $this->response()->success('Form Assigned to an agent')->refresh();
    }

}