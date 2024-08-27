
<div class="card">
    <!--begin::Header-->
    <div >
    <div class="card-header" style="position: relative;">
    <h3 class="card-title">{{__('Livestock Health status')}}</h3>
    <p>{{__('A summary of the livestock status')}}</p>
    <div style="position: absolute; top: 0; right: 0;">
        <a href="{{ admin_url('/animal-health-records') }}" class="btn-view-all">{{__('View')}}</a>
    </div>
</div>

    </div>
   
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <div style="width: 80%; margin: auto;">
        <label for="dateFilter">Filter by Date:</label>
        <select id="dateFilter" onchange="updateHealthChart()">
            <option value="all">All Dates</option>
            @foreach ($timestamps as $timestamp)
                <option value="{{ $timestamp }}">{{ $timestamp }}</option>
            @endforeach
        </select>

        <label for="statusFilter">Filter by Status:</label>
        <select id="statusFilter" onchange="updateHealthChart()">
            <option value="all">All Statuses</option>
            @foreach ($datasets as $dataset)
        <option value="{{ $dataset['label'] }}">{{ $dataset['label'] }}</option>
    @endforeach
        </select>

        <canvas id="healthChart"></canvas>
    </div>

    <script>
        // Get data from the PHP variables passed to the view
        var timestamps = <?php echo json_encode($timestamps); ?>;
        var datasets = <?php echo json_encode($datasets); ?>;

   // Create the initial line chart
   var ctx = document.getElementById('healthChart').getContext('2d');
    var healthChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: timestamps,
            datasets: datasets,
        },
        options: {
            responsive: true,
            maintainAspectRatio: true,
            title: {
                display: true,
                text: 'LiveStock Health Chart',
            },
            scales: {
                x: {
                    type: 'category',
                    labels: timestamps,
                    title: {
                        display: true,
                        text: 'Date',
                    },
                },
                y: {
                    title: {
                        display: true,
                        text: 'Count',
                    },
                },
            },
        },
    });

// Function to update the chart based on the selected filters
function updateHealthChart() {
    var dateFilter = document.getElementById('dateFilter').value;
    var statusFilter = document.getElementById('statusFilter').value;

    // Filter timestamps
    var filteredTimestamps = timestamps.filter(function (timestamp, index) {
        return dateFilter === 'all' || timestamp === dateFilter;
    });

    // Filter datasets based on the selected options
    var filteredDatasets = datasets.map(function (dataset) {
        return {
            label: dataset.label,
            data: dataset.data.filter(function (_, index) {
                return (dateFilter === 'all' || timestamps[index] === dateFilter) &&
                    (statusFilter === 'all' || dataset.label === statusFilter);
            }),
            fill: false,
        };
    });

    // Update the existing chart with the filtered data and options
    healthChart.data.labels = filteredTimestamps;
    healthChart.data.datasets = filteredDatasets;
    healthChart.options.scales.x.labels = filteredTimestamps;
    healthChart.update();
}



    </script>
</div>

