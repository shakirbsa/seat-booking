import { Component, OnInit } from '@angular/core';
import { SeatService } from '../services/seat.service';
import { HttpClientModule } from '@angular/common/http';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { NgxSpinnerModule } from 'ngx-spinner';
import { NgxSpinnerService } from 'ngx-spinner';
import { ToastrModule } from 'ngx-toastr';
import { ToastrService } from 'ngx-toastr';
import {BrowserAnimationsModule} from "@angular/platform-browser/animations";
@Component({
  selector: 'app-seat',
  standalone: true,
  imports: [HttpClientModule, CommonModule,FormsModule,NgxSpinnerModule,ToastrModule], // Correct imports here
  templateUrl: './seat.component.html',
  styleUrls: ['./seat.component.css'], // Corrected to 'styleUrls'
})
export class SeatComponent implements OnInit {
  seats: []=[]
  numberofseats: number = 1;

  constructor(private seatService: SeatService,private spinner: NgxSpinnerService,private toastr: ToastrService) {
    // HttpClientModule is already imported, no need to inject HttpClient here
  }

  ngOnInit(): void {
    this.getSeats();
  }
// -- for getting all seats grouped in rows --//
  getSeats(): void {
    this.spinner.show();
    this.seatService.getAllSeats().subscribe({
      next: (res: any) => {
       
        this.seats = res.data; // Storing the result in the component
        console.log(this.seats);
        this.toastr.success("Seats loaded successfully");
        this.spinner.hide();
        if (Array.isArray(this.seats)) {
        } else {
          console.error('Invalid data format', this.seats);
        }
        
      },
      error: (err) => {
        console.error('Error fetching seats:', err); // Error handling
        this.spinner.hide();
      }
    });
  }
  //-- For booking seat --//
  bookSeats(){
    this.spinner.show();
    this.seatService.bookSeats({seats:this.numberofseats}).subscribe({
      next: (res: any) => {
        this.toastr.success(res.message);
        this.spinner.hide();
        console.log(res);
        // refresh seats 
        this.getSeats();
        
      },
      error: (err) => {
        console.error('Error fetching seats:', err.error.error); // Error handling
        this.toastr.error(err.error.error);
        this.spinner.hide();
      }
    });
    
  }
  //-- For reset seat --//
  resetSeats(){
    this.spinner.show();
    this.seatService.resetSeats().subscribe({
      next: (res: any) => {
        this.toastr.success(res.message);
        this.spinner.hide();
        console.log(res);
        // refresh seats 
        this.getSeats();
        
      },
      error: (err) => {
        console.error('Error reset seats:', err.error.error); 
        this.toastr.error(err.error.error);
        this.spinner.hide();
      }
    });

  }
}
