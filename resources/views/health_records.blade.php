<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Health Records Report</title>
    <style>
        @media print {
            .no-print {
                display: none;
            }
          
        }
    </style>
   
</head>
<body>
    <div class="container">
        <h1>Health Records Report</h1>
        <a href="#" onclick="window.print()" class="btn btn-primary no-print">Print Report</a>

        <!-- General Health Section -->
        <h2>General Health</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Visit Date</th>
                    <th>Weight</th>
                    <th>Body Temperature</th>
                    <th>Heart Rate</th>
                    <th>Respiratory Rate</th>
                </tr>
            </thead>
            <tbody>
               
                    <tr>
                        <td>{{ $healthRecords->visit_date }}</td>
                        <td>{{ $healthRecords->weight }}</td>
                        <td>{{ $healthRecords->body_temperature }}</td>
                        <td>{{ $healthRecords->heart_rate }}</td>
                        <td>{{ $healthRecords->respiratory_rate }}</td>
                    </tr>
               
            </tbody>
        </table>

        <!-- Physical Condition Section -->
        <h2>Physical Condition</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Body Condition Score</th>
                    <th>Skin Condition</th>
                    <th>Mucous Membranes</th>
                    <th>Hoof Condition</th>
                </tr>
            </thead>
            <tbody>
               
                    <tr>
                        <td>{{ $healthRecords->body_condition_score }}</td>
                        <td>{{ $healthRecords->skin_condition }}</td>
                        <td>{{ $healthRecords->mucous_membranes }}</td>
                        <td>{{ $healthRecords->hoof_condition }}</td>
                    </tr>
               
            </tbody>
        </table>

        <!-- Behavioral Observations Section -->
        <h2>Behavioral Observations</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Appetite</th>
                    <th>Behavior</th>
                    <th>Gait and Posture</th>
                    <th>Signs of Pain</th>
                </tr>
            </thead>
            <tbody>
               
                    <tr>
                        <td>{{ $healthRecords->appetite }}</td>
                        <td>{{ $healthRecords->behavior }}</td>
                        <td>{{ $healthRecords->gait_posture }}</td>
                        <td>{{ $healthRecords->signs_of_pain }}</td>
                    </tr>
               
            </tbody>
        </table>

        <!-- Diagnostic Test Results Section -->
        <h2>Diagnostic Test Results</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Fecal Exam Results</th>
                    <th>Blood Test Results</th>
                    <th>Urine Test Results</th>
                </tr>
            </thead>
            <tbody>
               
                    <tr>
                        <td>{{ $healthRecords->fecal_exam_results }}</td>
                        <td>{{ $healthRecords->blood_test_results }}</td>
                        <td>{{ $healthRecords->urine_test_results }}</td>
                    </tr>
               
            </tbody>
        </table>

        <!-- Treatments and Follow-ups Section -->
        <h2>Treatments and Follow-ups</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Medications</th>
                    <th>Vaccinations</th>
                    <th>Procedures</th>
                    <th>Follow-up Actions</th>
                </tr>
            </thead>
            <tbody>
               
                    <tr>
                        <td>{{ $healthRecords->medications }}</td>
                        <td>{{ $healthRecords->vaccinations }}</td>
                        <td>{{ $healthRecords->procedures }}</td>
                        <td>{{ $healthRecords->follow_up_actions }}</td>
                    </tr>
               
            </tbody>
        </table>

        <!-- Additional Observations Section -->
        <h2>Additional Observations</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Overall Health Status</th>
                    <th>Environmental Factors</th>
                    <th>Notes</th>
                </tr>
            </thead>
            <tbody>
              
                    <tr>
                        <td>{{ $healthRecords->overall_health_status }}</td>
                        <td>{{ $healthRecords->environmental_factors }}</td>
                        <td>{{ $healthRecords->notes }}</td>
                    </tr>
              
            </tbody>
        </table>
    </div>
</body>
</html>
