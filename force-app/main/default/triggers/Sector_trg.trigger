trigger Sector_trg on Account (
                    before insert, before update, before delete, after insert, after update, after delete, after undelete) {
                       
  if (Trigger.isUpdate) {
      if (Trigger.isAfter)  {
          List<Account> lstAcc = Trigger.new;
          Map<Id,Account> mapAcc = Trigger.oldMap; //
          List<Opportunity> lstOpo = new List<Opportunity>();
          //si una cuenta cambia de sector a banking,
          //genera una oportunidad con nombre "entidad Bancaria" relacionada a la cuenta.
          Opportunity opp;
          for (Account ac : lstAcc) { //recorre la cuenta
              if (mapAcc.get(ac.Id).Industry <> ac.Industry){
                  if(ac.Industry == 'Banking') {
                  opp = new Opportunity();
                  opp.AccountId = ac.Id;
                  opp.StageName = 'Prospecting';
                  opp.CloseDate = Date.today();
                  opp.Name = 'entidad Bancaria';
                  lstOpo.add(opp);
              }
            else if(mapAcc.get(ac.Id).Industry <> ac.Industry){
                  if(ac.Industry=='Shipping')
              {
                  opp = new Opportunity();
                  opp.AccountId = ac.Id;
                  opp.StageName = 'Prospecting';
                  opp.CloseDate = Date.today();
                  opp.Name = 'entidad Bancaria';
                  lstOpo.add(opp);
              }}
             }
          insert lstOpo;
          }      }               
    }
                       
}