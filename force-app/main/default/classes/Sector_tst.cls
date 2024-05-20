@isTest
public class Sector_tst {
    @testSetup
    static void Setup(){
Account ac=new Account();
        ac.Name='PRUEBA1';
        insert ac;
    }
   static testMethod void updateBanking(){
       List<Account> ac=[Select id,Name,Industry from Account limit 1];
       system.debug('Account..'+ac);
        ac[0].Name='PRUEBA1';
        insert ac;
Test.startTest();
       ac[0].Industry='Banking';
       update ac;
       
          
      ac[0].Industry='Shipping';
       update ac;
       
Test.stopTest();
       List<Opportunity> op=[Select id from Opportunity where Accountid=:ac[0].Id];
       System.assertEquals(2,op.size(),'NO SE CREO LA OPORTUNIDAD');
   }
}