
@extends('layouts.app')

@section('content')
<div class="container-fluid">
    <div class="row no-gutters" style="height: 100vh;">
        <!-- Image Column -->
        <div class="col-md-6 d-none d-md-block p-0">
            <img src="https://cdn.pixabay.com/photo/2020/09/01/17/19/goat-5535783_640.jpg" alt="Login Image" class="img-fluid h-100 w-100" style="object-fit: cover;">
        </div>

        <!-- Form Column -->
        <div class="col-md-6 d-flex justify-content-center align-items-center" style="background-color: #f8f9fa;">
            <div class="w-75">
                <div >
                    <div class="card-header text-center">{{ __('Login') }}</div>

                    <div class="card-body">
                        <form method="POST" action="{{ route('login') }}">
                            @csrf

                            <div class="mb-3">
                                <label for="email" class="form-label">{{ __('Email Address') }}</label>
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>

                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>

                            <div class="mb-3">
                                <label for="password" class="form-label">{{ __('Password') }}</label>
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="current-password">

                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>

                            <div class="mb-3 form-check">
                                <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>
                                <label class="form-check-label" for="remember">{{ __('Remember Me') }}</label>
                            </div>

                            <div class="mb-0">
                                <button type="submit" class="btn btn-primary w-100">
                                    {{ __('Login') }}
                                </button>
                                @if (Route::has('password.request'))
                                    <a class="btn btn-link d-block text-center mt-2" href="{{ route('password.request') }}">
                                        {{ __('Forgot Your Password?') }}
                                    </a>
                                @endif
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

