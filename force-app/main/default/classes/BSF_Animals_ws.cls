@RestResource(urlMapping='/Animal__c/*')
global with sharing class BSF_Animals_ws {
    @HttpGet
    global static List<Animal__c> getRecord() {
        return[SELECT Name FROM Animal__c];
    }
    @HttpPost
    global static List<Animal__c> getRecord(String name) {
        return[SELECT Name FROM Animal__c WHERE Name= :name];
    }
}