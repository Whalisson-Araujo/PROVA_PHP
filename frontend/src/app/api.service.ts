import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class ApiService {
  private baseUrl = 'http://localhost:8000/api';

  constructor(private http: HttpClient) {}

  getRecibos(dataMovimento: string): Observable<any> {
    return this.http.get(`${this.baseUrl}/contribuicoes?data_movimento=${dataMovimento}`);
  }

  updateStatus(recibo: number, status: string): Observable<any> {
    return this.http.put(`${this.baseUrl}/contribuicoes/${recibo}/status`, { status });
  }
}
