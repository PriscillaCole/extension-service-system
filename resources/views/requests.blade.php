
    <div class="card">
    <div class="card-header" style="position: relative;">
    <h3 class="card-title">{{__('Paravet Requests')}}</h3>
    
     </div>
        <canvas id="serviceRequestsChart"></canvas>
    </div>
    
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var ctx = document.getElementById('serviceRequestsChart').getContext('2d');
            var serviceRequestsChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['Service Requests', 'Completed Services', 'Pending Services'],
                    datasets: [{
                        label: 'Count',
                        data: [
                            {{ json_encode($serviceRequestsCount) }},
                            {{ json_encode($completedServicesCount) }},
                            {{ json_encode($pendingServicesCount) }}
                        ],
                        backgroundColor: [
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(255, 206, 86, 0.2)'
                        ],
                        borderColor: [
                            'rgba(54, 162, 235, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(255, 206, 86, 1)'
                        ],
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        });
    </script>

