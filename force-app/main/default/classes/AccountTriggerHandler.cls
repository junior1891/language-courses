public with sharing class AccountTriggerHandler {

    public static List<Account> CreateAccounts(List<Account> newList) {
        List<Account> lstAcc = new List<Account>();
        Account iAccount = new Account();
        for (Account objAcc : newList) {
            System.debug('objAcc.ShippingState '+ objAcc.ShippingState);
            System.debug('objAcc.BillingState '+ objAcc.BillingState);
            if (objAcc.ShippingState != objAcc.BillingState) {
                iAccount.ShippingState = objAcc.BillingState;
                iAccount.Name = objAcc.Name;
                lstAcc.add(iAccount);
                System.debug('objAcc.BillingState DESPUES '+ iAccount.BillingState);
                System.debug('objAcc.ShippingState DESPUES '+ iAccount.ShippingState);
            }
System.debug('lstAcc '+ lstAcc);
        }
        return lstAcc;
    }
}