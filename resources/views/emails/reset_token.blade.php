<!DOCTYPE html>
<html>
<head>
    <title>Password Reset Token</title>
</head>
<body>
    <h1>Hello, {{ $user->name }}</h1>
    <p>You have requested to reset your password. Use the token below to reset it:</p>
    <p><strong>{{ $token }}</strong></p>
    <p>If you did not request a password reset, please ignore this email.</p>
</body>
</html>
