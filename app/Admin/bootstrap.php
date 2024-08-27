<?php

use Encore\Admin\Facades\Admin;
use Illuminate\Support\Facades\Auth;
use App\Models\Notification;
/**
 * Laravel-admin - admin builder based on Laravel.
 * @author z-song <https://github.com/z-song>
 *
 * Bootstraper for Admin.
 *
 * Here you can remove builtin form field:
 * Encore\Admin\Form::forget(['map', 'editor']);
 *
 * Or extend custom form field:
 * Encore\Admin\Form::extend('php', PHPEditor::class);
 *
 * Or require js and css assets:
 * Admin::css('/packages/prettydocs/css/styles.css');
 * Admin::js('/packages/prettydocs/js/main.js');
 *
 */

Encore\Admin\Form::forget(['map', 'editor','quill']);

// // jQuery UI 1.11.4 -->
// Admin::js('https://code.jquery.com/ui/1.11.4/jquery-ui.min.js');

// // Morris.js charts -->
// Admin::js('https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js');
// Admin::js('/adminlte/plugins/morris/morris.min.js');
// // Sparkline -->
// Admin::js('/adminlte/plugins/sparkline/jquery.sparkline.min.js');
// // jvectormap -->
// Admin::js('/adminlte/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js');
// Admin::js('/adminlte/plugins/jvectormap/jquery-jvectormap-world-mill-en.js');
// // jQuery Knob Chart -->
// Admin::js('/adminlte/plugins/knob/jquery.knob.js');
// // daterangepicker -->
// Admin::js('https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js');
// Admin::js('/adminlte/plugins/daterangepicker/daterangepicker.js');
// // Bootstrap WYSIHTML5 -->
// Admin::js('/adminlte/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js');
// // Slimscroll -->
// Admin::js('/adminlte/plugins/slimScroll/jquery.slimscroll.min.js');
// // FastClick -->
// Admin::js('/adminlte/plugins/fastclick/fastclick.js');


// // Font Awesome -->
// Admin::css('https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css');
// // Ionicons -->
// Admin::css('https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css');

// // iCheck -->
// Admin::css('/adminlte/plugins/iCheck/flat/blue.css');
// // Morris chart -->
// Admin::css('/adminlte/plugins/morris/morris.css');
// // jvectormap -->
// Admin::css('/adminlte/plugins/jvectormap/jquery-jvectormap-1.2.2.css');
// // Date Picker -->
// Admin::css('/adminlte/plugins/datepicker/datepicker3.css');
// // Daterange picker -->
// Admin::css('/adminlte/plugins/daterangepicker/daterangepicker-bs3.css');
// // bootstrap wysihtml5 - text editor -->
// Admin::css('/adminlte/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css');

Admin::navbar(function (\Encore\Admin\Widgets\Navbar $navbar) {
    $notifications = [];
    $user =  Auth::user();
    if ($user != null) {
        $notifications = Notification::get_notifications($user);
    }

    $navbar->right(view('notification_bell', ['notifications' => $notifications]));
    
});