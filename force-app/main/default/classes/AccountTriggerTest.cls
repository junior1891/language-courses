@isTest
public with sharing class AccountTriggerTest {

    static List<Account> setup() {
        List<Account> accts = new List<Account>();
        for(Integer i=0; i < 200; i++) {
            Account objAcc = new Account();
            objAcc.Name = 'Test1 '+ i;
            objAcc.BillingState = 'CA';
            accts.add(objAcc);
        } 
        insert accts;
        return accts;
    }
    @IsTest
    static void methodName(){
        List<Account> lstAcc = setup();
        Test.startTest();
        AccountTriggerHandler.CreateAccounts(lstAcc);
        Test.stopTest();
        List<Account> accList = [Select Id, Name, BillingState, ShippingState From Account limit 200];
        System.assertEquals(200, accList.size()); 
        
    }
}