@extends('auth.base')

@section('content')
    <h1 class="text-center text-xl-start mt-3 text-primary h3">Register</h1>

    <form class="needs-validation mb-2" action="{{ admin_url('auth/login') }}" method="post">

        {{-- @if ($hasResetMessage)
            <div class="alert alert-success">{{ $resetMessage }}</div>
        @endif --}}

        <input type="hidden" name="_token" value="{{ csrf_token() }}">

        <div class="position-relative mb-4">
            <label for="name" class="form-label fs-base">Username</label>
            <input type="text" id="name" class="form-control form-control-lg"
                placeholder="{{ trans('admin.name') }}" name="name" value="{{ old('name') }}" required>


            @if ($errors->has('name'))
                @foreach ($errors->get('name') as $message)
                    <div class="invalid-feedback position-absolute start-0 top-100 d-block mb-2">
                        {{ $message }}
                    </div>
                @endforeach
            @endif
        </div>

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
        <div class="mb-4">
            <label for="password_1" class="form-label fs-base">Confirm Password</label>
            <div class="password-toggle">
                <input type="password_1" id="password_1" name="password_1" class="form-control form-control-lg" required>
                <label class="password-toggle-btn" aria-label="Show/hide password">
                    <input class="password-toggle-check" type="checkbox">
                    <span class="password-toggle-indicator"></span>
                </label>

                @if ($errors->has('password_1'))
                    @foreach ($errors->get('password_1') as $message)
                        <div class="invalid-feedback position-absolute start-0 top-100 d-block mb-2">
                            {{ $message }}
                        </div>
                    @endforeach
                @endif

            </div>
        </div>

        <button type="submit" class="btn  btn-lg my-btn-primary  w-100">Register</button>
    </form>

    <a href="{{ url('auth/login') }}" class="btn btn-link btn-lg w-100">Already a member! Sign in</a>



    {{-- <p class="text-center mt-1 mb-0"><b>Partners</b></p>
<center><img class="img-fluid text-center" src="{{ asset('assets/logos.png') }}" width="75%">
</center> --}}

@endsection
