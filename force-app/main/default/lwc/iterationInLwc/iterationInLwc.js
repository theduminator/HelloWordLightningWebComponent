import { LightningElement, wire } from 'lwc';  
 import fetchAccounts from '@salesforce/apex/IterationInLwcController.fetchAccounts';  
 export default class IterationInLwc extends LightningElement {  
   @wire(fetchAccounts) accounts;  
 }