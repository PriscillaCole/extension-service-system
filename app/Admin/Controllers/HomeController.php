<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Controllers\RatingController;
use App\Models\Dashboard;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Admin;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class HomeController extends Controller
{
   
    public function index(Content $content)
    {
        return $content
            ->title(__('Dashboard'))
            ->row(function (Row $row) {
                $row->column(12, function (Column $column) {
                    $column->append(Dashboard::cards());
                });
            })
           

            ->row(function (Row $row) {
                $row->column(6, function (Column $column) {
                    $column->append(Dashboard::userMetrics(request()));
                });
                $row->column(6, function (Column $column) {
                    $column->append(Dashboard::paravetRequests());
                });
            })

            ->row(function (Row $row) {
                $row->column(6, function (Column $column) {
                    $column->append(Dashboard::topRatedParavets());
                });
                $row->column(6, function (Column $column) {
                    $column->append(Dashboard::showHealthRecords());
                });
                
            });
    
    }

    public function ratings(Content $content)
    {
        $content
            ->title('Paravet Ratings');
        $content->row(function (Row $row) {
            $row->column(12, function (Column $column) {
                $column->append(RatingController::index());
            });
        });
        return $content;
    }

  

}
