@extends('layouts.app')
@section('auth_content')
<div class="row">
    @foreach($episodes as $episode)

    <div class="col-md-4">
        <a href="{{route('view-episode',$episode->id)}}">
            <img src="{{Voyager::image($episode->thumbnail('cropped','thumb'))}}"/>
        </a>

    </div>

    @endforeach
</div>
@endsection
