public class SLA_ctr {
    @auraEnabled
    public static List<sla__c> getslas(){
        return [Select ID, Tipo__c,Origen__c,Dias__c FROM SLA__c];
    }
    
}