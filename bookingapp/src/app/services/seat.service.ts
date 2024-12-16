import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';  // Corrected import path for Observable

@Injectable({
  providedIn: 'root'
})
export class SeatService {

  private apiUrl = 'https://unstop.zapto.org/api/'; // Base URL for your Laravel API

  // Create headers for multipart form data
  private headers = new HttpHeaders({
    'Content-Type': 'application/json'  // You can also try without setting the Content-Type explicitly
  });

  constructor(private readonly http: HttpClient) { }

  // Method to fetch all seats'
  getAllSeats(): Observable<any> {
    return this.http.get(this.apiUrl + "seats"); // Send GET request to fetch seats
  }

  // Method to book seat
  bookSeats(post: any): Observable<any> {
    return this.http.post(this.apiUrl + "bookseat", post, { headers: this.headers }); // Send POST request to book seat
  }

  // Reset seats 
  resetSeats(): Observable<any> {
    return this.http.get(this.apiUrl + "resetseats"); // Send GET request to fetch seats
  }
}
