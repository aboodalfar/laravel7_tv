<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\{Episode,EpisodeLike};
use Illuminate\Support\Facades\Auth;

class EpisodeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function view($id)
    {
        $episode = Episode::find($id);
        //dd(json_decode($episode->video,1));
        return view('episode.view', compact('episode'));
    }
    
    public function getlike(Request $request){
        $episode = Episode::find($request->get('episode'));
        return response()->json([
            'total'=>$episode->total_likes,
        ]);
    }
    
    public function like($id) {
        $episodeLike = EpisodeLike::firstOrNew(['episode_id' => $id,'user_id'=>Auth::id()]);
        if(is_null($episodeLike->status)){
            $episode = Episode::find($id);
            $episode->increment('total_likes');
        }elseif($episodeLike->status ==0){
            $episode = Episode::find($id);
            $episode->increment('total_likes');
            $episode->decrement('total_dislikes');
        }
        $episodeLike->status = 1;
        $episodeLike->save();
        return response()->json([
            'message'=>'Thanks',
        ]);
    }
    
    public function getDislike(Request $request) {
        $episode = Episode::find($request->get('episode'));
        return response()->json([
            'total'=>$episode->total_dislikes,
        ]);
    }
    
    public function dislike($id) {
        $episodeLike = EpisodeLike::firstOrNew(['episode_id' => $id,'user_id'=>Auth::id()]);
        if(is_null($episodeLike->status)){
            $episode = Episode::find($id);
            $episode->increment('total_dislikes');
        }elseif($episodeLike->status ==1){
            $episode = Episode::find($id);
            $episode->increment('total_dislikes');
            $episode->decrement('total_likes');
        }
        $episodeLike->status = 0;
        $episodeLike->save();
        return response()->json([
            'message'=>'Thanks',
        ]);
    }
    }
