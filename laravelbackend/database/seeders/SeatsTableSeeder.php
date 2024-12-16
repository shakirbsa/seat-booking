<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Seat; // Assuming you have a Seat model.

class SeatsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Loop through 11 rows (since we need 80 seats, and 7 seats per row)
        for ($row = 1; $row <= 12; $row++) {
            // Determine if it's the last row and has only 3 booked seats
            $seatsInRow = ($row == 12) ? 3 : 7; // Last row has only 3 seats booked

            for ($seatNumber = 1; $seatNumber <= $seatsInRow; $seatNumber++) {
                $isBooked = ($row == 12 && $seatNumber <= 3) ? true : false; // Last row, 3 seats are booked
                
                Seat::create([
                    'row_number' => $row,
                    'seat_number' => $seatNumber,
                    'is_booked' => $isBooked,
                    // Optional: other fields like event_id, section_id, status, etc.
                ]);
            }
        }
    }
}
