<!-- resources/views/financial_records_chart.blade.php -->


    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Financial Summary - Income and Expenses</h3>
        </div>
        <div class="card-body">
            <canvas id="financialChart" width="800" height="400"></canvas>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
    var timestamps = <?php echo json_encode($timestamps); ?>;
    var income = <?php echo json_encode($income); ?>;   
    var expenses = <?php echo json_encode($expenses); ?>;

    console.log('Timestamps:', timestamps);
    console.log('Income:', income);
    console.log('Expenses:', expenses);

    var ctx = document.getElementById('financialChart').getContext('2d');

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: timestamps,
            datasets: [
                {
                    label: 'Income',
                    data: income,
                    backgroundColor: 'rgba(75, 192, 192, 0.5)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1,
                },
                {
                    label: 'Expenses',
                    data: expenses,
                    backgroundColor: 'rgba(255, 99, 132, 0.5)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1,
                },
            ],
        },
        options: {
            scales: {
                x: {
                    type: 'category',
                    labels: timestamps,
                },
                y: {
                    beginAtZero: true,
                },
            },
        },
    });
</script>





