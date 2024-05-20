public with sharing class BP_GenerateOBLController_ctr {

    @AuraEnabled(cacheable=true)
    public static Map<String, String> getData(){
        System.debug('entro a getData');
        Case objCase = [SELECT Id,
        AccountId, CaseNumber, Origin, OwnerId, Reason, RecordTypeId
        FROM Case LIMIT 1 /*WHERE Id = : casoId*/];
        System.debug('objCase ' + objCase);

        Map<String, String> mapCase = new Map<String, String>();

        mapCase.put('AccountId', objCase.AccountId == null ? '' : objCase.AccountId);
        mapCase.put('CaseNumber', objCase.CaseNumber == null ? '' : objCase.CaseNumber);
        mapCase.put('Origin', objCase.Origin == null ? '' : objCase.Origin);
        mapCase.put('OwnerId', objCase.OwnerId == null ? '' : objCase.OwnerId);
        mapCase.put('Reason', objCase.Reason == null ? '' : objCase.Reason);
        mapCase.put('RecordTypeId', objCase.RecordTypeId == null ? '' : objCase.RecordTypeId);
        System.debug('mapCase ' + mapCase);
        return mapCase;
}
}