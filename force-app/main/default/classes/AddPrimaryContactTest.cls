/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
public class AddPrimaryContactTest {

    @TestSetup
    static void makeData(){
        List<Account> accounts = new List<Account>();
        accounts.add(new Account(name='ParentCA'));

        for (Integer i = 0; i<50; i++) {
            accounts.add(new Account(
                Name = 'Test Account'+i,
                BillingState = 'CA'
            ));
        }
        insert accounts;

        List<Account> accountsDos = new List<Account>();
        accountsDos.add(new Account(name='ParentNY'));

        for (Integer i = 0; i<50; i++) {
            accountsDos.add(new Account(
                Name = 'Test Account'+i,
                BillingState = 'NY'
            ));
        }
        insert accountsDos;
    }
    @isTest
    static void testQueueable() {
        // TO DO: implement unit test

        Contact cont = new Contact();
         cont.FirstName='demo';
         cont.LastName ='demo';
         insert cont;

        String strState = 'CA';

         AddPrimaryContact apc = new AddPrimaryContact(cont, strState);

          Test.startTest();

            System.enqueueJob(apc);

          Test.stopTest();
          System.assertEquals(50, [SELECT count() FROM Account WHERE BillingState = :'CA'],'success');
    }
}