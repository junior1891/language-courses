trigger Opp_tgr on Opportunity (after insert, before insert) {
    if(Trigger.new.size()==1){
        List<String> lstid=new List<String>();
/*         for(Opportunity Opp:Trigger.new){ //INICIO DEL FOR
            if(trigger.isBefore){ //INICIO DE BEFORE
                if(Opp.Description==null||Opp.Description=='HOLA'){
                    Opp.addError('Descripcion no valida RAUL',true);
                }
            } //FIN DE BEFORE
            else
            {
                lstid.add(Opp.Id);
                
                System.debug('EL TRIGGER ES DESPUES DE...'+Trigger.isAfter);
                
            }
        } */
        //FIN FOR
        //CasoTest_cls.InsertarCaso(lstid);
    }
        System.debug('EL TRIGGER ES ANTES DE...'+Trigger.isBefore);
        
    System.debug('SALIENDO DEL TRIGGER');
    
}