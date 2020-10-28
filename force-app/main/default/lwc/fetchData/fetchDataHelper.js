const recordMetadata = {
    name: 'name',
    email: 'email',
    website: 'url',
    amount: 'currency',
    phone: 'phoneNumber',
    closeAt: 'dateInFuture',
};

export default function fetchDataHelper({ amountOfRecords }) {
    return fetch('https://restcountries.eu', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=utf-8',
        },
        body: JSON.stringify({
          //  amountOfRecords,
            //recordMetadata,
        }),
    }).then(response => response.json())
    .then(json => console.log(json))  ;
}
