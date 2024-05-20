public without sharing class ExportarOBLCase {
@AuraEnabled
public static responseWrapper getFieldsCase(String caseId){
        Case currentCase= [SELECT Id,EngineeringReqNumber__c From Case WHERE Id =: caseId];    
    	responseWrapper res = new responseWrapper();
        res.EngineeringReqNumber = currentCase.EngineeringReqNumber__c;
    return res;
    }
    public class responseWrapper{
        @AuraEnabled public String EngineeringReqNumber;
    }
}