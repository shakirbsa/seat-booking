import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { SeatComponent } from './seat/seat.component';
import { HttpClient, HttpClientModule, HttpHandler } from '@angular/common/http';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet,SeatComponent,HttpClientModule,CommonModule],
  providers: [HttpClient],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'bookingapp';
}
