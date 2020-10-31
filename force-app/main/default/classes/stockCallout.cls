public with sharing class stockCallout {
    public stockCallout() {

        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:PetStore/findByStatus?status=instock&status=intransit&status=outofstock');
        req.setMethod('GET');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        //System.debug(res.getBody());
        String newPayload = '{"data":' +res.getBody()+'}';
        System.debug(newPayload);
        //using dummyResponse for now 
        String dummyResponse = '{  "data":[  {    "id":0,    "itemname":"bread",   "itemavailability":"instock"},{   "id":1,    "itemname":"milk",   "itemavailability":"instock"  },   {  "id":2,   "itemname":"honey",  "itemavailability":"outofstock"  } ]}';
        //JSON2Apex myClass = JSON2Apex.parse( dummyResponse);

        if (res.getStatusCode() == 200) {
            System.debug('Success');
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(dummyResponse);

            // Cast the values in the 'animals' key as a list
            List<Object> stockData = (List<Object>) results.get('data');

           // System.debug('Received the following stock:'+stockData);
            for (Object objects: stockData) {
                    //Field level array traversal
                Map<String, Object> i = (Map<String, Object>)objects;
                System.debug('-->'+i.get('itemname'));

               
                //Instantiate Object we're writing to
                Stock__c stock = new Stock__c();
                 stock.ItemName__c= String.valueof(i.get('itemname'));
                 stock.ItemAvailability__c = String.valueof(i.get('itemavailability'));

                insert stock;
                System.debug('Inserted data'+stock);
                
                
            }
            
        }
          
    }
}
