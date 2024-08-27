
<!DOCTYPE html>
<html>
<head>
    <title>Farmer Activities</title>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.js"></script>
</head>
<body>
    <div class="container">
        <h1>Farmer Activities</h1>
        <div id='calendar'></div>
    </div>

    <!-- Bootstrap Modal -->
    <div class="modal fade" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="eventModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="eventModalLabel">Add Event</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="eventTitle">Event Title:</label>
                        <input type="text" class="form-control" id="eventTitle">
                    </div>
                    <div class="form-group">
                        <label for="eventDescription">Event Description:</label>
                        <input type="text" class="form-control" id="eventDescription">
                    </div>
                    <div class="form-group">
                        <label for="eventType">Farm:</label>
                        <select class="form-control" id="farm">
                        @foreach(\App\Models\Farm::pluck('name', 'id') as $id => $name)
                            <option value="{{ $id }}">{{ $name }}</option>
                        @endforeach
                                            
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="eventDescription">Start date:</label>
                        <input type="date" class="form-control" id="start">
                    </div>
                    <div class="form-group">
                        <label for="eventDescription">End date:</label>
                        <input type="date" class="form-control" id="end">
                    </div>
                    <!-- get the authenticated user id -->
                    <input type="hidden" id="userId" value='1'>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="saveEvent()">Save Event</button>
                </div>
            </div>
        </div>
    </div>

    <script>
      var calendar
        $(document).ready(function () {
            calendar = $('#calendar').fullCalendar({
                editable: true,
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                events: '/',
                selectable: true,
                selectHelper: true,
                select: function (start, end, allDay) {
                    openEventModal(start, end, allDay);
                },
            });
        });

        function openEventModal(selectedStart, selectedEnd, allDay) 
        {
            // Clear previous values
            $("#eventTitle, #eventDescription, #eventType").val("");

            // Set modal title
            $("#eventModalLabel").text("Add Farm Activity");

            // Show the modal
            $("#eventModal").modal("show");
        }

        function saveEvent() 
        {
            var title = $("#eventTitle").val();
            var description = $("#eventDescription").val();
            var farm_id = $("#farm").val();
            var user_id = $("#userId").val();
            var start = $("#start").val();
            var end = $("#end").val();

            if (title && description && farm) {
              

                $.ajax({
                    url: "{{ route('event.store') }}",
                    type: "POST",
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    data: {
                        title: title,
                        description: description,
                        farm_id: farm_id,
                        start: start,
                        end: end,
                        user_id: user_id,
                        type: 'add'
                    },
                   dataType: 'json',
                    success: function (data) {
                        calendar.fullCalendar('refetchEvents');
                        alert("Event created");
                    }
                });

                // Close the modal
                $("#eventModal").modal("hide");
            } else {
                alert("Please fill in all fields");
            }
        }


    </script>
</body>
</html>
