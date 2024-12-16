<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Seat extends Model
{
    use HasFactory;

    
    protected $fillable = [
        'row_number',
        'seat_number',
        'is_booked',
        
    ];

    public static function getAvailableSeats($count)
    {
        $availableSeats = Seat::where('is_booked', false)->get();

        // If there are enough available seats, return them
        if ($availableSeats->count() >= $count) {
            return $availableSeats->take($count);
        }

        return null;
    }

    public static function bookSeats($seats)
    {
        foreach ($seats as $seat) {
            $seat->update(['is_booked' => true]);
        }
    }

    
}
