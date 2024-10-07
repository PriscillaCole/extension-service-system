<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .email-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 0 auto;
        }
        .header {
            background-color: #28a745;
            color: white;
            padding: 10px;
            text-align: center;
            border-radius: 8px 8px 0 0;
        }
        .content {
            padding: 20px;
        }
        .content p {
            font-size: 16px;
            line-height: 1.5;
            color: #333333;
        }
        .footer {
            margin-top: 20px;
            text-align: center;
            font-size: 14px;
            color: #888888;
        }
    </style>
</head>
<body>
    <div class="email-container">
        <div class="header">
            <h2>Paravet Status Update</h2>
        </div>
        <div class="content">
            <p>Dear <strong>{{  $farmer->name }}</strong>,</p>
            <p>I hope this email finds you well. I am pleased to provide you with an update regarding your Paravet status.</p>

            <p><strong>Status:</strong> {{  $credentials['status']  }}</p>
            <p><strong>Paravet ID:</strong> {{   $credentials['id'] }}</p>
           

            <p>If your status is pending, please be assured that we are working on it and will update you as soon as possible.</p>
            
            <p>If you have any questions or need further assistance, feel free to contact us at <a href="mailto:support@yourorganization.com">support@yourorganization.com</a>.</p>

            <p>Thank you for your dedication to improving animal health in the community!</p>
        </div>
        <div class="footer">
            <p>Best regards,<br>
            LDF<br>
            <p><a href="mailto:support@ldf.com">support@ldf.com</a></p>
        </div>
    </div>
</body>
</html>
