<div class="card">
    <div class="card-header" style="position: relative;">
        <h3 class="card-title">{{__('Average Animal Health Status')}}</h3>
    </div>
    <div class="card-body">
        <canvas id="healthStatusChart" width="400" height="400"></canvas>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        var ctx = document.getElementById('healthStatusChart').getContext('2d');
        var healthStatusChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: [
                    'Healthy', 'Sick', 'Injured', 'Recovering', 
                    'Critical', 'Quarantined', 'Under Observation', 
                    'Euthanized', 'Unknown'
                ],
                datasets: [{
                    label: 'Overall Health Status',
                    data: [
                        @foreach($healthStatusCounts as $status => $count)
                            {{ $count }},
                        @endforeach
                    ],
                    backgroundColor: generateRandomColors({{ count($healthStatusCounts) }}),
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    tooltip: {
                        callbacks: {
                            label: function(tooltipItem) {
                                return tooltipItem.label + ': ' + tooltipItem.raw.toFixed(2) + '%';
                            }
                        }
                    }
                }
            }
        });
    });

    // Function to generate random RGBA colors
    function generateRandomColors(count) {
        var colors = [];
        for (var i = 0; i < count; i++) {
            var r = Math.floor(Math.random() * 256);
            var g = Math.floor(Math.random() * 256);
            var b = Math.floor(Math.random() * 256);
            var alpha = 0.8; // You can adjust the transparency here
            colors.push(`rgba(${r}, ${g}, ${b}, ${alpha})`);
        }
        return colors;
    }
</script>

