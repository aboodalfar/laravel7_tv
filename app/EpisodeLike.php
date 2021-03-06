<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class EpisodeLike extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'episode_id', 'user_id', 'status'
    ];
}
