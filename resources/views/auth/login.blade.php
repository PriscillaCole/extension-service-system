@extends('auth.base')

@section('content')
    <h1 class="text-center text-xl-start mt-3 text-primary h3">Login</h1>

    <form class="needs-validation mb-2" action="{{ admin_url('auth/login') }}" method="post">

        {{-- @if ($hasResetMessage)
            <div class="alert alert-success">{{ $resetMessage }}</div>
        @endif --}}

        <input type="hidden" name="_token" value="{{ csrf_token() }}">

        <div class="position-relative mb-4">
            <label for="email" class="form-label fs-base">Email</label>
            <input type="text" id="email" class="form-control form-control-lg"
                placeholder="Email" name="email" value="{{ old('email') }}" required>


            @if ($errors->has('email'))
                @foreach ($errors->get('email') as $message)
                    <div class="invalid-feedback position-absolute start-0 top-100 d-block mb-2">
                        {{ $message }}
                    </div>
                @endforeach
            @endif
        </div>
        <div class="mb-4">
            <label for="password" class="form-label fs-base">Password</label>
            <div class="password-toggle">
                <input type="password" id="password" name="password" class="form-control form-control-lg" required>
                <label class="password-toggle-btn" aria-label="Show/hide password">
                    <input class="password-toggle-check" type="checkbox">
                    <span class="password-toggle-indicator"></span>
                </label>

                @if ($errors->has('password'))
                    @foreach ($errors->get('password') as $message)
                        <div class="invalid-feedback position-absolute start-0 top-100 d-block mb-2">
                            {{ $message }}
                        </div>
                    @endforeach
                @endif

            </div>
        </div>

        <button type="submit" class="btn  btn-lg my-btn-primary  w-100">Sign in</button>
    </form>
    <!-- <a href="{{ url('password-forget-email') }}" class="btn btn-link btn-lg w-100">Forgot your
    password?</a>
    <a href="{{ url('auth/register') }}" class="btn btn-link btn-lg w-100">Not a member?  Register with us</a> -->



    {{-- <p class="text-center mt-1 mb-0"><b>Partners</b></p>
<center><img class="img-fluid text-center" src="{{ asset('assets/logos.png') }}" width="75%">
</center> --}}

@endsection
