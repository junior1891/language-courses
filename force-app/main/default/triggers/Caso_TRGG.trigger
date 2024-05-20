trigger Caso_TRGG on Case (before insert, after insert) {
    if(Trigger.isInsert){
            if(Trigger.isBefore){
            List<sla__c> slas=[SELECT ID,Tipo__c,Origen__c,Dias__c FROM sla__c];
            Map<String,Integer> slamap=new map<String, integer>();
            for(sla__c sla:slas){
                slamap.put(sla.Tipo__c+sla.Origen__c, Integer.valueOf(sla.Dias__c));
            }
            for (Case casos:Trigger.new){
                String key=casos.type+casos.Origin;
                Integer days=slamap.get(key); //OBTIENE VALORES
                if(days<>null)casos.Fecha_Estimada__c=Date.today()+days;
            } 
        //for (Case casos:Trigger.new){
        //casos.Fecha_Electrical__c=Date.today();
        //casos.status='Working';
        //casos.addError('MENSAJE DE ERROR');
    } 
    }
    if(Trigger.isUpdate){
        List<Case> lstcase=Trigger.new;
        Map<Id,case>mapCase=Trigger.oldMap;
        for(Case casos:lstcase){
            if(mapCase.get(casos.Id).Status<>casos.status && mapCase.get(casos.Id).Status=='Closed'){
                casos.addError('EL CASO YA ESTA CERRADO');
            }
        }
    }
}