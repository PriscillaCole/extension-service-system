<?php
use App\Models\Utils;
session_start();

$hasResetMessage = false;
$resetMessage = '';

if (isset($_SESSION['reset_message'])) {
    if (strlen($_SESSION['reset_message']) > 3) {
        $resetMessage = $_SESSION['reset_message'];
        $hasResetMessage = true;
        unset($_SESSION['reset_message']);
    }
}

?>
<!DOCTYPE html>
<html lang="en">

<meta http-equiv="content-type" content="text/html;charset=utf-8" />

<head>
    {{-- <base href="{{ url('/') }}"> --}}
    <meta charset="utf-8">
    <title>LDF - Livestock Development Forum</title>

    <!-- SEO Meta Tags -->
    <meta name="description" content="LDF - Livestock Development Forum">
    <meta name="keywords" content="LDF - Livestock Development Forum">
    <meta name="author" content="8Technologies">

    <!-- Viewport -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicon and Touch Icons -->
    <link rel="apple-touch-icon" sizes="180x180" href="{{ asset('assets/logo.png') }}">
    <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('assets/logo.png') }}">
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('assets/logo.png') }}">
    <link rel="manifest" href="{{ asset('assets/public/favicon/site.webmanifest') }}">
    <link rel="mask-icon" href="{{ asset('assets/logo.png') }}" color="#6366f1">
    <link rel="shortcut icon" href="{{ asset('assets/logo.png') }}">
    <meta name="msapplication-TileColor" content="#080032">
    <meta name="msapplication-config" content="{{ asset('assets/public/favicon/browserconfig.xml') }}">
    <meta name="theme-color" content="#ffffff">

    <!-- Vendor Styles -->
    <link rel="stylesheet" media="screen"
        href="{{ asset('assets/public/vendor/boxicons/css/boxicons.min.css') }}" />

    <!-- Main Theme Styles + Bootstrap -->
    <link rel="stylesheet" media="screen" href="{{ asset('assets/public/css/theme.min.css') }}">

    <!-- Page loading styles -->
    <style>
        .page-loading {
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 100%;
            -webkit-transition: all .4s .2s ease-in-out;
            transition: all .4s .2s ease-in-out;
            background-color: #fff;
            opacity: 0;
            visibility: hidden;
            z-index: 9999;
        }

        .dark-mode .page-loading {
            background-color: #0b0f19;
        }

        .page-loading.active {
            opacity: 1;
            visibility: visible;
        }

        .page-loading-inner {
            position: absolute;
            top: 50%;
            left: 0;
            width: 100%;
            text-align: center;
            -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
            -webkit-transition: opacity .2s ease-in-out;
            transition: opacity .2s ease-in-out;
            opacity: 0;
        }

        .page-loading.active>.page-loading-inner {
            opacity: 1;
        }

        .page-loading-inner>span {
            display: block;
            font-size: 1rem;
            font-weight: normal;
            color: #9397ad;
        }

        .dark-mode .page-loading-inner>span {
            color: #fff;
            opacity: .6;
        }

        .page-spinner {
            display: inline-block;
            width: 2.75rem;
            height: 2.75rem;
            margin-bottom: .75rem;
            vertical-align: text-bottom;
            border: .15em solid #b4b7c9;
            border-right-color: transparent;
            border-radius: 50%;
            -webkit-animation: spinner .75s linear infinite;
            animation: spinner .75s linear infinite;
        }

        .dark-mode .page-spinner {
            border-color: rgba(255, 255, 255, .4);
            border-right-color: transparent;
        }

        @-webkit-keyframes spinner {
            100% {
                -webkit-transform: rotate(360deg);
                transform: rotate(360deg);
            }
        }

        @keyframes spinner {
            100% {
                -webkit-transform: rotate(360deg);
                transform: rotate(360deg);
            }
        }

        .my-btn-primary {
            background-color: #419300;
            box-shadow: #2e8d5989 0px 2px 5px;
        }

        .btn-link {
            color: #419300;
        }

        .my-btn-primary:hover {
            color: #419300;
        }

        .btn-link:hover {
            color: #419300;
        }

        .text-primary {
            color: #419300 !important;
        }
    </style>

    <!-- Theme mode -->
    <script>
        let mode = window.localStorage.getItem('mode'),
            root = document.getElementsByTagName('html')[0];
        if (mode !== null && mode === 'dark') {
            root.classList.add('dark-mode');
        } else {
            root.classList.remove('dark-mode');
        }
    </script>

    <!-- Page loading scripts -->
    <script>
        (function() {
            window.onload = function() {
                const preloader = document.querySelector('.page-loading');
                preloader.classList.remove('active');
                setTimeout(function() {
                    preloader.remove();
                }, 1000);
            };
        })();
    </script>


</head>
<!-- Body -->

<body>

    <!-- Page loading spinner -->
    <div class="page-loading active">
        <div class="page-loading-inner">
            <div class="page-spinner"></div><span>Loading...</span>
        </div>
    </div>

    <main class="page-wrapper">
        <!-- Page content -->
        <section class="position-relative h-100 pt-0 pb-0">

            <!-- Sign in form -->
            <div class="container d-flex flex-wrap justify-content-center justify-content-xl-start h-100 pt-0">
                <div class="w-100 align-self-end pt-1 pt-md-4 pb-4" style="max-width: 350px;">

                    <center><img class="img-fluid text-center" src="{{ asset('assets/logo.png') }}" width="30%">
                    </center>
                    <hr class="my-4">
                    <h2 class="h3 text-center">Livestock Development Forum</h2>

                    @yield('content')

          

                </div>

                <div class="w-100 align-self-end">
                    <p class="nav d-block fs-xs text-center text-xl-start pb-2 mb-0">
                        All rights reserved. &copy; 2023
                        <a class="nav-link d-inline-block p-0 text-primary" href="javascript:;" target="_blank"
                            rel="noopener">LDF</a>
                    </p>
                </div>
            </div>

            <!-- Background -->
            <div class="position-absolute top-0 end-0 w-50 h-100 bg-position-center bg-repeat-0 bg-size-cover d-none d-md-block"
                style="background-image: url({{ asset('assets/bg/' . rand(1, 5) . '-min.jpg') }});
                padding: 0px;

                border-radius: 0%;
                background-color: #13502f;
                ">
            </div>
        </section>
    </main>

    <!-- Back to top button -->
    <a href="#top" class="btn-scroll-top" data-scroll>
        <span class="btn-scroll-top-tooltip text-muted fs-sm me-2">Top</span>
        <i class="btn-scroll-top-icon bx bx-chevron-up"></i>
    </a>

    <!-- Vendor Scripts -->
    <script src="{{ asset('assets/public/vendor/bootstrap/dist/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/public/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js') }}"></script>

    <!-- Main Theme Script -->
    <script src="{{ asset('assets/public/js/theme.min.js') }}"></script>
</body>

</html>