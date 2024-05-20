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
private class DailyLeadProcessorTest {

    public static String cronExp = '0 0 0 15 3 ? 2042';
    @isTest
    static void myUnitTest() {
        // TO DO: implement unit test
        List<Lead> listaLead = new List<Lead>();
        for (Integer i=0; i<200;i++) {
            Lead objLead = new Lead(LastName = 'Test Lead'+i, Company = 'Test Company');
        listaLead.add(objLead);
        }
        insert listaLead;
        Test.startTest();
        String jobId = System.schedule('ScheduledApexTest',
            cronExp,
            new DailyLeadProcessor());
        Test.stopTest();

        List<Lead> lstLeadAsser = [SELECT Id FROM Lead];

        System.assertEquals(lstLeadAsser.size()>0, true, 'success');
        
    }
}