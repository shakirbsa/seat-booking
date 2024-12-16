import { ApplicationConfig, importProvidersFrom } from '@angular/core';
import { provideRouter } from '@angular/router';
import { ToastrModule } from 'ngx-toastr';
import { routes } from './app.routes';
import { HttpClient, HttpClientModule, HttpHandler, provideHttpClient } from '@angular/common/http';
import {provideToastr} from 'ngx-toastr';
import {BrowserAnimationsModule} from "@angular/platform-browser/animations";
import { NoopAnimationsModule } from '@angular/platform-browser/animations';


export const appConfig: ApplicationConfig = {
  providers: [provideRouter(routes),HttpClient,HttpClientModule,importProvidersFrom(),
    provideHttpClient(),ToastrModule,provideToastr(),BrowserAnimationsModule,NoopAnimationsModule],
};
