
<div class="card">
    <!--begin::Header-->
    <div >
    <div class="card-header" style="position: relative;">
    <h3 class="card-title">{{__('Livestock Breed Distribution')}}</h3>
    <p>{{__('A summary of the Livestock Breed Distribution across subcounties')}}</p>
   
</div>

    </div>
   
<select id="locationSelector">
        <option value="">Select Location</option>
        <?php
            // Convert the collection to an array
            $dataArray = $data->toArray();

            // Extract unique location names
            $uniqueLocations = array_unique(array_column($dataArray, 'location_name'));

            foreach ($uniqueLocations as $location) {
                echo '<option value="' . $location . '">' . $location . '</option>';
            }
        ?>
    </select>

    <canvas id="livestockBreedChart"></canvas>

    <script>
        var originalData = <?php echo json_encode($data); ?>;
        console.log(originalData);

        function getRandomColor() {
    // Generate a random hex color code
    return '#' + Math.floor(Math.random()*16777215).toString(16);
}

function updateChart(selectedLocation) {
                // Use a default location if none is selected
                selectedLocation = selectedLocation || 'Kapeke';

                var filteredData = originalData.filter(item => item.location_name === selectedLocation);

                // Group data by breed and sum the counts
                var groupedData = filteredData.reduce((acc, item) => {
                    if (!acc[item.breed_name]) {
                        acc[item.breed_name] = {
                            count: 0,
                            color: getRandomColor() // Assign a random color to the breed
                        };
                    }
                    acc[item.breed_name].count += item.breed_count;
                    return acc;
                }, {});

                var breeds = Object.keys(groupedData);
                var breedData = Object.values(groupedData);

                var ctx = document.getElementById('livestockBreedChart').getContext('2d');

                // Destroy the existing chart if it exists
                if (window.myChart) {
                    window.myChart.destroy();
                }

                window.myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: breeds,
                        datasets: [{
                            label: 'Breed Count',
                            data: breedData.map(item => item.count),
                            backgroundColor: breedData.map(item => item.color), // Use breed-specific colors
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            x: {
                                type: 'category',
                                position: 'bottom',
                                title: {
                                    display: true,
                                    text: 'Breed'
                                }
                            },
                            y: {
                                type: 'linear',
                                position: 'left',
                                title: {
                                    display: true,
                                    text: 'Breed Count'
                                }
                            }
                        }
                        // Customize options if needed
                    }
                });
            }

           // Extract unique location names from the original data
        var uniqueLocations = [...new Set(originalData.map(item => item.location_name))];

        // Use the first location as the default
        var defaultLocation = uniqueLocations.length > 0 ? uniqueLocations[0] : '';

        // Initial chart with the default location
        updateChart(defaultLocation);

        // Event listener for location selection
        document.getElementById('locationSelector').addEventListener('change', function() {
            var selectedLocation = this.value;
            updateChart(selectedLocation);
        });

    </script>
</div>
