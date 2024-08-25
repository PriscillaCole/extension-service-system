<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vets Information</title>
    <style>
        .container {
            display: flex;
            justify-content: space-between;
            max-width: 1200px;
            margin: 20px auto;
        }
        .card {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            flex-grow: 1;
        }
        .basic-info {
            flex: 0 1 30%;
            margin-right: 10px;
        }
        .additional-info {
            margin-left: 10px;
        }
        h2 {
            text-align: center;
        }
        img {
            display: block;
            margin: 0 auto;
            border-radius: 50%;
            width: 200px;
            height: 200px;
            object-fit: cover;
            object-position: center;
            margin-bottom: 20px;
        }
        .details {
            margin-bottom: 10px;
        }
        .label {
            font-weight: bold;
            color: black;
        }
        .back-arrow {
            margin-bottom: 5px;
            cursor: pointer;
            font-size: 24px;
            color: black; /* Default color */
        }
        .back-arrow:hover {
            color: orange; /* Color on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        
        <div class="card basic-info">
        <div class="back-arrow" onclick="window.history.back()">&#8592; </div>
            <h2>Personal Information</h2>
           
            <?php
            $logo = $provider->logo ? asset('storage/' . $provider->logo) : asset('storage/images/default_image.png');
            ?>
            <img src="{{ $logo }}" alt="logo">
    
            <div class="details">
                <span class="label">Owner's Name:</span> {{$provider->owner_name}}           
            </div>
            <div class="details">
                <span class="label">TIN:</span> {{$provider->tin_number_owner}}
            </div>
            <div class="details">
                <span class="label">Personal Profile:</span> {{$provider->owner_profile}}
            </div>
           
        </div>
        <div class="card additional-info">
            <h2>Business Details</h2>
            <div class="details">
                <span class="label">Name of service/product:</span> {{$provider->name}}
            </div>

            <div class="details">
                <span class="label">Class of service:</span> {{$provider->class_of_service}}
            </div>
            <div class="details">
                <span class="label">Address:</span> {{$provider->physical_address}}
            </div>
            <div class="details">
                <span class="label">Phone number:</span> {{$provider->primary_phone_number}} / {{$provider->secondary_phone_number}}
            </div>
            <div class="details">
                <span class="label">Email:</span> {{$provider->email}}
            </div>
            <div class="details">
                <span class="label">Postal address:</span> {{$provider->postal_address}}
            </div>
            <div class="details">
                <span class="label">Other services offered:</span> {{$provider->other_services}}
            </div>
          
            <h2>Business Credentials</h2>
            <div class="details">
                <span class="label">Date of registration:</span> {{$provider->date_of_registration}}
            </div>
            <div class="details">
                <span class="label">NDA registration number:</span> {{$provider->NDA_registration_number}}
            </div>
            <div class="details">
                <span class="label">Business TIN:</span> {{$provider->tin_number_business}}
            </div>
            <h2>Business Documents</h2>
    
            <div class="details">
                <span class="label">NDA registration:</span>
                <a href="{{ asset('storage/' . $provider->NDA_registration_number) }}" download onclick="forceDownload(event, '{{ asset('storage/' . $provider->NDA_registration_number) }}')">Download NDA registration</a>
            </div>
            <div class="details">
                <span class="label">License:</span>
                <a href="{{ asset('storage/' . $provider->license) }}" download onclick="forceDownload(event, '{{ asset('storage/' . $provider->license) }}')">Download License</a>
            </div>
        </div>
    </div>
    <script>
    function forceDownload(event, url) {
        event.preventDefault(); // Prevent default link action
        
        fetch(url)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.blob();
            })
            .then(blob => {
                const filename = url.split('/').pop();
                const link = document.createElement('a');
                link.href = window.URL.createObjectURL(blob);
                link.download = filename;
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);
            })
            .catch(error => {
                console.error('There was a problem with the download:', error);
                // Handle error appropriately, e.g., show an error message to the user
            });
    }
</script>
   
</body>
</html>
