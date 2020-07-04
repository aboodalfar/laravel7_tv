@extends('layouts.app')

@section('auth_content')
    <h4>{{$serie->title}}</h4>
    <h4>{{$serie->description}}</h4>
    
    <follow-component :id="{{$id}}" :follows="{{ $isfollowing }}"></follow-component>
    <hr/>
<div class="row">

                    @foreach($serie->episodes as $episode)
                    
                   <div class="col-md-4">
                       <p>{{$episode->title}}</p>
                        <a href="{{route('view-episode',$episode->id)}}">
                        <img src="{{Voyager::image($episode->thumbnail('cropped','thumb'))}}"/>
                        </a>
                        
                    </div>
                   
                    @endforeach
</div>
@endsection
