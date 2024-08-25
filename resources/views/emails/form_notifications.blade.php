@component('mail::message')
# Hello

<p>{{$message}}</p>

@component('mail::button', ['url' => $link, 'color' => 'green', ])
View the form
@endcomponent

Thanks,<br>
{{ config('app.name') }}
@endcomponent
