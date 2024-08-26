
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
        } */
    </style>

    <div class="container">
        
        <div class="card basic-info">
        <div class="back-arrow" onclick="window.history.back()">&#8592; </div>
            <h2>Personal Information</h2>
           
            <?php
            $profile_picture = $farmer->profile_picture ? asset('storage/' . $farmer->profile_picture) : asset('storage/assets/person.png');
            ?>
            <img class ="image2"src="{{ $profile_picture }}" alt="profile_picture">
    
            <div class="details">
                <span class="label">Name:</span> {{$farmer->surname}} {{$farmer->given_name}}          
            </div>
            <div class="details">
                <span class="label">Date of birth:</span> {{$farmer->date_of_birth}}
            </div>
            <div class="details">
                <span class="label">Gender:</span> 
                {{ $farmer->gender === 'F' ? 'Female' : ($farmer->gender === 'M' ? 'Male' : 'Unknown') }}
            </div>

            <div class="details">
                <span class="label">Marital Status:</span> 
                {{ 
                    $farmer->marital_status === 'S' ? 'Single' : 
                    ($farmer->marital_status === 'M' ? 'Married' :
                    ($farmer->marital_status === 'D' ? 'Divorced' :
                    ($farmer->marital_status === 'W' ? 'Widowed' : 'Unknown')))
                }}
            </div>

            <div class="details">
                <span class="label">Phone number:</span> {{$farmer->primary_phone_number}} / {{$farmer->secondary_phone_number}}
            </div>
            <div class="details">
                <span class="label">NIN:</span> {{$farmer->nin}}
            </div>
            <div class="details">
                <span class="label">Level of education:</span> {{$farmer->education}}
            </div>
            <div class="details">
                <span class="label">Cooperative/Association:</span> {{$farmer->cooperative_association}}
            </div>
            <div class="details">
                <span class="label">Is Land Owner:</span> 
                {{ 
                    $farmer->is_land_owner == 1 ? 'Yes' : 
                    ( $farmer->is_land_owner == 0 ? 'No' : 'Unknown')
                }}
            </div>
            <div class="details">
                <span class="label">Access to Credit:</span> 
                {{ 
                    $farmer->access_to_credit == 1 ? 'Yes' : 
                    ( $farmer->access_to_credit == 0 ? 'No' : 'Unknown')
                }}
            </div>

        </div>
        <div class="card additional-info">
            <h2>Farm Details</h2>
            <div class="details">
                <span class="label">Physical address:</span> {{$farmer->physical_address}}
            </div>
        
            <div class="details">
                <span class="label">Production type:</span> {{$farmer->production_scale}}
            </div>
            
            <div class="details">
                <span class="label">Started farming in:</span> {{$farmer->farming_experience}}
            </div>

        </div>
    
   

