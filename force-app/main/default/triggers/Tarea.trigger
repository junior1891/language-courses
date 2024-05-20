trigger Tarea on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    if(trigger.isUpdate)
    {
        List<Account> listacuenta=Trigger.new;
        //CREACON DE OPORTUNIDAD CUANDO CAMBIA DE SECTOR
        List<Opportunity> listaOpportunity=new List<Opportunity>();
    }
}