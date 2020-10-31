public with sharing class serviceCallout {
    public serviceCallout() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Animals');
        req.setMethod('GET');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug(res.getBody());

        if (res.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
           
            // Cast the values in the 'animals' key as a list
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following animals:');
            for (Object animal: animals) {
                System.debug(animal);
                //Instantiate Object we're writing to
                Account acc = new Account();
                 acc.Name=String.valueOf(animal);
                // acc.TypeOfAnimal__c=String.valueOf(animal);
                upsert acc ID;
                System.debug('Account data'+acc);
            }
        }
          
    

    }
}
