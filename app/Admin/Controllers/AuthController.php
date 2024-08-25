<?php

namespace App\Admin\Controllers;

use Encore\Admin\Controllers\AuthController as BaseAuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\User;

class AuthController extends BaseAuthController
{
    // override the loginView property
    protected $loginView = 'auth.login';


    // override the postLogin method
        public function postLogin(Request $request)
    {
  /*       if ($this->guard()->attempt([
            'email' => 'mubs0x@gmail.com',
            'password' => '4321',
        ], true)) {
            return $this->sendLoginResponse($request);
        }
 */

        $r = $request;


        if (isset($_POST['password_1'])) {
            // REGISTER

            if (Validator::make($_POST, [
                'name' => 'required|string|min:4'
            ])->fails()) {
                return back()
                    ->withErrors(['name' => 'Enter your valid name.'])
                    ->withInput();
            }

            if (Validator::make($_POST, [
                'email' => 'required|email|unique:admin_users',
            ])->fails()) {
                return back()
                    ->withErrors(['email' => 'Enter a valid email address or Email already exists.'])
                    ->withInput();
            }

            if (Validator::make($_POST, [
                'password' => 'required|min:2'
            ])->fails()) {
                return back()
                    ->withErrors(['password' => 'Enter password with more than 3 chracters.'])
                    ->withInput();
            }

            if (Validator::make($_POST, [
                'password_1' => 'required|min:2'
            ])->fails()) {
                return back()
                    ->withErrors(['password_1' => 'Enter password with more than 3 chracters.'])
                    ->withInput();
            }

            if ($r->password != $r->password_1) {
                return back()
                    ->withErrors(['password_1' => 'Confirmation password did not match.'])
                    ->withInput();
            }

        
            $user = new User();
            $user->username = $r->email;
            $user->email = $r->email;
            $user->name = $r->name;
            //$user->avatar = 'user.png';
            $user->password = password_hash($r->password, PASSWORD_DEFAULT);

            if (!$user->save()) {
                return back()
                    ->withErrors(['email' => 'Failed to create account. Try again.'])
                    ->withInput();
            }
            $user->assignRole('basic-user');
        }else {
            // LOGIN
            // $u = User::where([
            //     'email' => $_POST['email']
            // ])->orwhere([
            //     'username' => $_POST['email']
            // ])->first();
            $u = User::where([
                'email' => $r->input('email')
            ])->first();
    
            if ($u == null) {
                return back()
                    ->withErrors(['email' => 'Account with provided email address was not found.'])
                    ->withInput();
            }
        }

        // if (Auth::attempt([
        //     'email' => $r->email,
        //     'password' => $r->password,
        // ], true)) {
        // }


        // $credentials = $request->only(['email', 'password']);

        // if ($this->guard()->attempt($credentials, $remember)) {
        //     return $this->sendLoginResponse($request);
        // }

        $credentials['username'] = $request->email;
        $credentials['password'] = $request->password;
        $remember = true;

        if ($this->guard()->attempt($credentials, $remember)) {
            return $this->sendLoginResponse($request);
        }


        return back()
            ->withErrors(['email' => 'Wrong Credentials. Try again.'])
            ->withInput();
    }
}
