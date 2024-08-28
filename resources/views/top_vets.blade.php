<!DOCTYPE html>
<html>
<head>
    <title>Top Rated Vets</title>
    <style>
        .star {
            color: gold;
        }
        .paravet-info {
            display: flex;
            align-items: center;
        }
        .paravet-info img {
            margin-right: 10px;
        }
        .paravet-details {
            display: flex;
            flex-direction: column;
            font-size: 0.9em;
        }
        .paravet-details span {
            margin: 2px 0;
        }
        .paravet-details .label {
            font-weight: bold;
        }
        .paravet-details .value a {
            text-decoration: none;
            color: #007bff;
        }
        .paravet-details .value a:hover {
            text-decoration: underline;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tbody tr:nth-child(odd) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <div class="card">
        <h3 class ="card-title">Top Rated Vets</h3>
        <table>
            <thead>
                <tr>
                    <th>Paravet</th>
                    <th>Stars</th>
                </tr>
            </thead>
            <tbody>
                @foreach($topVets as $vet)
                    <tr>
                        <td>
                            <div class="paravet-info">
                                <img src="{{ $vet->profile_picture ? asset($vet->profile_picture) : asset('storage/assets/person.png') }}" alt="Profile Picture" width="50" height="50">
                                <div class="paravet-details">
                                    <span class="value"><a href="/vets/{{$vet->id}}">{{ $vet->surname }} {{ $vet->given_name }}</a></span>
                                    <span class="value">Location: {{ $vet->location }}</span>
                                    <span class="value">Average Rating: {{ number_format($vet->averageRating(), 1) }}</span>
                                </div>
                            </div>
                        </td>
                        <td>
                            @php
                                $averageRating = $vet->averageRating();
                                for ($i = 0; $i < 5; $i++) {
                                    if ($i < $averageRating) {
                                        echo '<span class="star">&#9733;</span>';
                                    } else {
                                        echo '<span class="star">&#9734;</span>';
                                    }
                                }
                            @endphp
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</body>
</html>
