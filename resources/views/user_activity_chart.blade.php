<div class="card">
    <!--begin::Header-->
    <div >
    <div class="card-header" style="position: relative;">
    <h3 class="card-title">{{__('User Engagement')}}</h3>
    
</div>

    </div>
   
<form action="{{ route('user-activity') }}" method="get">
    <label for="filter">Filter:</label>
    <select id="filter" name="filter">
        <option value="day" {{ $filter === 'day' ? 'selected' : '' }}>Day</option>
        <option value="week" {{ $filter === 'week' ? 'selected' : '' }}>Week</option>
        <option value="month" {{ $filter === 'month' ? 'selected' : '' }}>Month</option>
        <option value="year" {{ $filter === 'year' ? 'selected' : '' }}>Year</option>
    </select>
    <button type="submit">Apply</button>
</form>

<canvas id="userCountChart" width="400" height="200"></canvas>
<script src="https://cdn.jsdelivr.net/npm/moment/moment.min.js"></script>

<!-- Include chart.js and chartjs-adapter-moment -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-moment"></script>
<script>
    // Use Chart.js to create a line chart
    var ctx = document.getElementById('userCountChart').getContext('2d');
    var userCountChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: <?php echo json_encode($userCounts->pluck('time')); ?>,
            datasets: [
                {
                    label: 'User Count',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1,
                    data: <?php echo json_encode($userCounts->pluck('user_count')); ?>
                }
            ]
        },
        options: {
            scales: {
                x: {
                    type: 'time',
                    time: {
                        unit: '{{ $filter }}',
                        parser: 'YYYY-MM-DD', // Adjust the date format as needed
                        tooltipFormat: 'll'
                    }
                },
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
</div>
     

