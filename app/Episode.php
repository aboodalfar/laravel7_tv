<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use TCG\Voyager\Traits\Resizable;
class Episode extends Model
{
    
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'title', 'description', 'duration',
        'airing_time','thumb','video','series_id','total_likes','total_dislikes'
    ];
    use Resizable;
    
//    /**
//     * Get image url for the Episode image.
//     */
//    public function urlThumbnail()
//    {
//        return Storage::url($this->thumbnail);
//    }
//
//    /**
//     * Get image url for the Episode image.
//     */
//    public function getUrlThumbnailAttribute()
//    {
//        return $this->urlThumbnail();
//    }
    
    
    public function scopeActive($query)
    {
        return $query->where('airing_time','<', date('Y-m-d H:i:s'))->orderBy('id', 'DESC');
    }
    
    public function seriesId() {
        return $this->belongsTo(Series::class);
    }
}
