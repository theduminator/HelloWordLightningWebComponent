public with sharing class stockcontroller {
    @AuraEnabled(cacheable = true)  
    public static List<Stock__c> getStocks(){  
      return [SELECT Id, Name, ItemName__c, ItemAvailability__c FROM Stock__c LIMIT 100];  
    }    
      }
    

