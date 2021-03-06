<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SeriesFollowing extends Model
{
    
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'series_id', 'user_id', 'status'
    ];
    
    /**
     * 
     * @param type $query
     * @param type $series_id
     * @param type $user_id
     * @return type
     */
    public function scopeIsfollowing($query,$series_id,$user_id)
    {
        return $query->where([
            'series_id'=>$series_id,
            'user_id'=>$user_id,
            'status'=>1
        ])->count();
    }
}
