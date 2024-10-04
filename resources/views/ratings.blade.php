<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ratings for Paravets</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Other CSS and meta tags -->
    <style>
        /* Add your custom styles here */
        .card {
            border: 1px solid #ccc;
            border-radius: 8px;
            margin-bottom: 20px;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 95.5%;
        }
        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .ratings-container {
            margin-top: 10px;
        }
        .rating {
            margin-bottom: 10px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }
        .rating p {
            margin: 5px 0;
        }
        .show-more-btn {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }
        .show-more-btn:hover {
            background-color: #0056b3;
        }
        .hidden {
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        @foreach ($paravets as $paravet)
        <div class="card">
            <div class="card-header">
                <h3>{{$paravet->title}} {{ $paravet->surname }} {{$paravet->given_name}}</h3>
                <p>Average Rating:
                    @php
                        $averageRating = $paravet->averageRating ?? 0; // Default to 0 if average rating is not set
                        $fullStars = floor($averageRating);
                        $halfStar = ceil($averageRating - $fullStars);
                    @endphp

                    @for ($i = 1; $i <= 5; $i++)
                        @if ($i <= $fullStars)
                            <i class="fas fa-star" style="color: gold;"></i>
                        @elseif ($halfStar > 0 && $i == ($fullStars + 1))
                            <i class="fas fa-star-half-alt" style="color: gold;"></i>
                        @else
                            <i class="far fa-star" style="color: gold;"></i>
                        @endif
                    @endfor
                </p>
            </div>

            <div class="ratings-container">
                @if ($paravet->ratings->count() > 0)
                    <div class="rating">
                        <p>Rating: {{ $paravet->ratings[0]->rating }} / 5</p>
                        <p>Comment: {{ $paravet->ratings[0]->comment }}</p>
                        <p>By: {{ $paravet->ratings[0]->user->name }}</p>
                    </div>

                    @if ($paravet->ratings->count() > 1)
                        <button class="show-more-btn" onclick="toggleHidden('{{ $paravet->id }}')">Show more</button>
                    @endif

                    <div id="hidden-ratings-{{ $paravet->id }}" class="hidden">
                        @foreach ($paravet->ratings->skip(1) as $rating)
                            <div class="rating">
                                <p>Rating: {{ $rating->rating }} / 5</p>
                                <p>Comment: {{ $rating->comment }}</p>
                                <p>By: {{ $rating->user->name }}</p>
                            </div>
                        @endforeach
                    </div>
                @else
                    <p>No ratings yet.</p>
                @endif
            </div>

            <!-- <h2>Leave a Rating</h2>
            <form action="{{ route('ratings.store') }}" method="POST">
                @csrf
                <input type="hidden" name="paravet_id" value="{{ $paravet->id }}">
                <input type="hidden" name="rating" id="rating-{{ $paravet->id }}" value="0">
              
                <div id="star-rating-{{ $paravet->id }}" data-rating="0">
                    <i class="far fa-star" data-value="1"></i>
                    <i class="far fa-star" data-value="2"></i>
                    <i class="far fa-star" data-value="3"></i>
                    <i class="far fa-star" data-value="4"></i>
                    <i class="far fa-star" data-value="5"></i>
                </div>
                <div class="form-group">
                    <label for="comment">Comment</label>
                    <textarea name="comment" id="comment-{{ $paravet->id }}" class="form-control"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form> -->
        </div>
        @endforeach
    </div>

    <script>
        function toggleHidden(paravetId) {
            const hiddenRatings = document.getElementById(`hidden-ratings-${paravetId}`);
            hiddenRatings.classList.toggle('hidden');
        }

        function initStarRating(paravetId) {
            const starRating = document.getElementById(`star-rating-${paravetId}`);
            const ratingInput = document.getElementById(`rating-${paravetId}`);

            starRating.addEventListener('click', (e) => {
                const star = e.target;
                if (star.matches('i')) {
                    const value = star.getAttribute('data-value');
                    ratingInput.value = value;
                    starRating.setAttribute('data-rating', value);
                    const stars = starRating.querySelectorAll('i');
                    stars.forEach(s => {
                        if (s.getAttribute('data-value') <= value) {
                            s.classList.remove('far');
                            s.classList.add('fas');
                            s.style.color = 'gold'; // Change star color to gold
                        } else {
                            s.classList.remove('fas');
                            s.classList.add('far');
                            s.style.color = ''; // Reset star color to default
                        }
                    });
                }
            });
        }

        // Initialize star ratings for each paravet
        document.addEventListener('DOMContentLoaded', () => {
            @foreach ($paravets as $paravet)
                initStarRating('{{ $paravet->id }}');
            @endforeach
        });
    </script>
</body>
</html>
