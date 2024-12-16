<?php
namespace App\Http\Controllers;

use App\Models\Seat;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SeatController extends Controller
{
    /**
     * Helper method to handle the response and add CORS headers
     */
    private function sendResponse($data, $status = 200)
    {
        $response = response()->json($data, $status);
        $response->header('Access-Control-Allow-Origin', '*');
        $response->header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
        $response->header('Access-Control-Allow-Headers', 'Content-Type, Authorization');
        return $response;
    }

    /**
     * Get a list of all seats.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $seats = Seat::all(); // Fetch all seats
        return $this->sendResponse($seats); // Return as a JSON response
    }

    /**
     * Get all seats grouped by row number.
     *
     * @return \Illuminate\Http\Response
     */
    public function allseats()
    {
        $seats = Seat::select('id', 'is_booked', 'row_number', 'seat_number')->get();
        
        if ($seats->isEmpty()) {
            return $this->sendResponse(['message' => 'Seat not found'], 404);
        }

        $rows = $seats->groupBy('row_number')->values(); // Group seats by row_number
        return $this->sendResponse(['data' => $rows]);
    }

    /**
     * Book seats.
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function bookSeats(Request $request)
    {
        $requestedSeats = $request->input('seats');
        
        // Validate input
        if ($requestedSeats < 1 || $requestedSeats > 7) {
            return $this->sendResponse(['error' => 'You can book between 1 and 7 seats at a time'], 400);
        }

        // Try to find available seats in one row
        $availableSeatsInRow = DB::table('seats')
            ->select('row_number', DB::raw('COUNT(id) as count_id'))
            ->where('is_booked', 0)
            ->groupBy('row_number')
            ->havingRaw('COUNT(id) >= ?', [$requestedSeats])
            ->limit(1)
            ->first();

        if ($availableSeatsInRow) {
            $seatsToBook = Seat::where('row_number', $availableSeatsInRow->row_number)
                               ->where('is_booked', 0)
                               ->take($requestedSeats)
                               ->get();

            Seat::bookSeats($seatsToBook);
            return $this->sendResponse(['message' => 'Seats booked successfully!', 'seats' => $seatsToBook]);
        }

        // If not enough seats in one row, look for available seats across the system
        $availableSeats = Seat::getAvailableSeats($requestedSeats);
        if ($availableSeats) {
            Seat::bookSeats($availableSeats);
            return $this->sendResponse(['message' => 'Seats booked successfully!', 'seats' => $availableSeats]);
        }

        return $this->sendResponse(['error' => 'Not enough available seats'], 400);
    }

    /**
     * Reset all seats (set is_booked to 0).
     *
     * @return \Illuminate\Http\Response
     */
    public function resetSeat()
    {
        Seat::query()->update(['is_booked' => 0]);
        return $this->sendResponse(['message' => 'All seats have been reset to available.']);
    }
}
