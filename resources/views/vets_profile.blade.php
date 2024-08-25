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
        .image2 {
            display: block;
            margin: 0 auto;
            border-radius: 50%;
            width: 200px;
            height: 200px;
            object-fit: cover;
            object-position: center;
            margin-bottom: 20px;
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
            <h2>Basic Information</h2>
           
            <?php
            $profilePicture = $vet->profile_picture ? asset('storage/' . $vet->profile_picture) : asset('storage/images/default_image.png');
            ?>
            <img class="image2" src="{{ $profilePicture }}" alt="profile">
    
            <div class="details">
                <span class="label">Name:</span> {{$vet->title}} . {{$vet->surname}} {{$vet->given_name}}            
            </div>
          
            <div class="details">
                <span class="label">Phone Number:</span> {{$vet->primary_phone_number}}
            </div>
            <div class="details">
                <span class="label">Email:</span> {{$vet->email}}
            </div>
        </div>
        <div class="card additional-info">
            <h2>Business Details</h2>
            <div class="details">
                <span class="label">Category:</span> {{$vet->category}}
            </div>
            
            <div class="details">
                <span class="label">Postal address:</span> {{$vet->postal_address}}
            </div>
            <div class="details">
                <span class="label">Group/practice:</span> {{$vet->group_or_practice}}
            </div>
            <div class="details">
                <span class="label">Brief profile:</span> {{$vet->brief_profile}}
            </div>
            <div class="details">
                <span class="label">Services offered:</span> {{$vet->services_offered}}
            </div>
            <div class="details">
                <span class="label">Areas of operation:</span> {{$vet->areas_of_operation}}
            </div>
            <h2>Business Credentials</h2>
            <div class="details">
                <span class="label">Date of registration:</span> {{$vet->registration_date}}
            </div>
            <div class="details">
                <span class="label">Registration number:</span> {{$vet->registration_number}}
            </div>
            
        
            <h2>Business Documents</h2>
            <div class="details">
        <span class="label">Certificate of registration:</span>
        <a href="{{ asset('storage/' . $vet->certificate_of_registration) }}" download onclick="forceDownload(event, '{{ asset('storage/' . $vet->certificate_of_registration) }}')">Download Certificate of registration</a>
        </div>
        <div class="details">
                <span class="label">License:</span>
                <a href="{{ asset('storage/' . $vet->license) }}" download onclick="forceDownload(event, '{{ asset('storage/' . $vet->license) }}')">Download License</a>
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
