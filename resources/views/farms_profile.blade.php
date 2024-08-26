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
            <h2>Basic Farm Information</h2>
           
            <?php
            error_log($farm->profile_picture);
            $profilePicture = $farm->profile_picture ? asset('storage/' . $farm->profile_picture) : asset('storage/assets/farm.jpeg');
            ?>
            <img src="{{ $profilePicture }}" alt="profile">
    
            <div class="details">
                <span class="label">Farm name:</span> {{$farm->name}}           
            </div>
            <div class="details">
                <span class="label">Farm ownership:</span> {{ $farm->farmOwner->surname }} {{ $farm->farmOwner->given_name }}
            </div>

        </div>
        <div class="card additional-info">
            <h2>Farm Details</h2>
            <div class="details">
             
             <span class="label">Farm type:</span> {{ implode(', ', $farm->livestock_type) }}
             </div>

            <div class="details">
             
             <span class="label">Farm type:</span> {{ implode(', ', $farm->production_type) }}
             </div>
            <div class="details">
                <span class="label">Date of establishment:</span> {{$farm->date_of_establishment}}
            </div>
            <div class="details">
                <span class="label">Land size:</span> {{$farm->size}}
            </div>

            <div class="details">
                <span class="label">Number of animals:</span> {{$farm->number_of_animals}}
            </div>
            <div class="details">
             
             <span class="label">Farm structures:</span> {{ implode(', ', $farm->farm_structures) }}
             </div>

        </div>
    </div>

</body>
</html>
