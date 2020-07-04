@extends('layouts.app')

@section('auth_content')
<p>{{$episode->title}}</p>
                      
                       <video width="320" height="240" controls>
                       <?php 
                       $file = json_decode($episode->video);
                       $file=$file[0]->download_link??'';
                       
                       ?>		
  <source src="{{ Storage::disk(config('voyager.storage.disk'))->url($file) ?: '' }}" type="video/mp4">
Your browser does not support the video tag.
</video> 
<div class="row">
                      <div class="col-md-8">
                     <like-component :episode="{{ $episode->id }}"></like-component>
                     <dis-like-component :episode="{{ $episode->id }}"></dis-like-component>
                      </div>
</div>
@endsection
