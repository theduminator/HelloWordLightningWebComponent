import { LightningElement, wire } from 'lwc';  
 import getStocks from '@salesforce/apex/stockcontroller.getStocks';  
 export default class StockManagement extends LightningElement {  
   @wire(getStocks) stocks;  
 }