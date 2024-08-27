<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Production Metrics</title>
    <!-- Include Chart.js from CDN -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <select id="farmSelector">
        <option value="">Select Farm</option>
        <?php
            // Convert the collection to an array
            $productionArray = $data->toArray();

            // Extract unique farm names
            $uniqueFarms = array_unique(array_column($productionArray, 'farm_name'));

            foreach ($uniqueFarms as $farm) {
                echo '<option value="' . $farm . '">' . $farm . '</option>';
            }
        ?>
    </select>

    <canvas id="productionMetricsChart"></canvas>

    <script>
        var originalProductionData = <?php echo json_encode($data); ?>;
      

        function generateRandomColor() {
            // Generate a random hex color code
            return '#' + Math.floor(Math.random()*16777215).toString(16);
        }

        function updateProductionChart(selectedFarm) {
            // Use a default farm if none is selected
            selectedFarm = selectedFarm || 'Default Farm';

            var filteredProductionData = originalProductionData.filter(item => item.farm_name === selectedFarm);

            var productionBreeds = [...new Set(filteredProductionData.map(item => item.breed_name))];
            var dates = [...new Set(filteredProductionData.map(item => item.date))];

            var datasets = productionBreeds.map(breed => {
                var productionBreedData = filteredProductionData.filter(item => item.breed_name == breed);
                var dataPoints = dates.map(date => {
                    var entry = productionBreedData.find(item => item.date == date);
                    return entry ? entry.weight : null;
                });

                return {
                    label: breed,
                    data: dataPoints,
                    borderColor: generateRandomColor(),
                    fill: false
                };
            });

            var ctx = document.getElementById('productionMetricsChart').getContext('2d');

            // Destroy the existing chart if it exists
            if (window.myChart) {
                window.myChart.destroy();
            }

            window.myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: dates,
                    datasets: datasets
                },
                options: {
                    scales: {
                        x: {
                            type: 'category',
                            position: 'bottom',
                            title: {
                                display: true,
                                text: 'Date'
                            }
                        },
                        y: {
                            type: 'linear',
                            position: 'left',
                            title: {
                                display: true,
                                text: 'Daily Weight Gain'
                            }
                        }
                    }
                    // Customize options if needed
                }
            });
        }

        // Extract unique farm names from the original data
        var uniqueFarms = [...new Set(originalProductionData.map(item => item.farm_name))];

        // Use the first farm as the default
        var defaultFarm = uniqueFarms.length > 0 ? uniqueFarms[0] : '';

        // Initial chart with the default farm
        updateProductionChart(defaultFarm);

        // Event listener for farm selection
        document.getElementById('farmSelector').addEventListener('change', function() {
            var selectedFarm = this.value;
            updateProductionChart(selectedFarm);
        });
    </script>
</body>
</html>
