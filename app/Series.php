<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Series extends Model
{
    
    /**
     * Get the Episods for the Serie.
     */
    public function episodes()
    {
        return $this->hasMany('App\Episode');
    }
    
    /**
     * 
     * @param type $query
     * @param type $q
     * @return type
     */
    public function scopeSearch($query,$q)
    {
        return $query->where('title', 'LIKE', '%'.$q.'%');
    }
    /**
     * 
     * @param type $query
     * @return type
     */
    public function scopeRandom($query)
    {
        return $query->inRandomOrder()->limit(5)->get();
    }
}
