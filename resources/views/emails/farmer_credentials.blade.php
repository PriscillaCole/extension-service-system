<!DOCTYPE html>
<html>
<head>
    <title>Your Farmer Account Credentials</title>
</head>
<body>
    <h1>Welcome, {{ $farmer->name }}</h1>
    <p>Thank you for applying to become a farmer on our platform. Here are your login credentials:</p>
    <p><strong>Email:</strong> {{ $credentials['email'] }}</p>
    <p><strong>Password:</strong> {{ $credentials['password'] }}</p>
    <p>You can log in using the credentials provided. Please change your password after the first login for security purposes.</p>
    <p>If you have any questions, feel free to reach out.</p>
</body>
</html>
