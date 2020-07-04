@extends('layouts.app')

@section('auth_content')
<div class="row">
    @foreach($series as $serie)

    <div class="col-md-4">
        <a href="{{route('view-series',$serie->id)}}">
            {{$serie->title}}
        </a>

    </div>

    @endforeach
</div>
@endsection
