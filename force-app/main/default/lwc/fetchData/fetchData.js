import { LightningElement } from 'lwc';
import fetchDataHelper from './fetchDataHelper';

const columns = [
    { label: 'name', fieldName: 'name' },
    { label: 'capital', fieldName: 'name'},
    { label: 'region', fieldName: 'name' },

];

export default class BasicDatatable extends LightningElement {
    data = [];
    columns = columns;

    // eslint-disable-next-line @lwc/lwc/no-async-await
    async connectedCallback() {
        const data = await fetchDataHelper({ amountOfRecords: 100 });
        this.data = data;
    }
}
