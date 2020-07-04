<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\{Series,SeriesFollowing};
use Illuminate\Support\Facades\Auth;
class SeriesController extends Controller
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
    
    const SEARCH_LIMIT=10;
    
    /**
     * search for series
     * @param Request $request
     * @return type
     */
    public function search(Request $request)
    {
        $term = trim($request->q);
        $series = Series::search($term)->limit(self::SEARCH_LIMIT)->get();
        return view('series.search', compact('series'));
    }
    
    /**
     * view detils series
     * @param type $id
     * @return type
     */
    public function view($id) {
        $serie = Series::with('episodes')->find($id);
        $user_id = Auth::id();
        $isfollowing = SeriesFollowing::Isfollowing($id,$user_id);
        return view('series.episodes', compact('serie','isfollowing','id'));
    }
    
    /**
     * follow button
     * @param type $id
     * @return \Illuminate\Http\Response
     */
    public function follow($id) {
        $follow = SeriesFollowing::firstOrNew(['series_id' => $id,'user_id'=>Auth::id()]);
        if(is_null($follow->status) || $follow->status ===0){
            $follow->status = 1;
        }else{
            $follow->status = 0;
        }
        $follow->save();
        return response()->json([
            'message'=>'Thanks',
        ]);
        
    }

}
