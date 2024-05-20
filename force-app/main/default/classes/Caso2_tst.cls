@isTest
public class Caso2_tst {
    static testMethod void testcaso2(){
     case cs=new case();
        cs.Status='New';
        cs.Status='Working';
        cs.Status='Escalated';
        cs.Status='Closed';
        insert cs;
    }
    static testMethod void updateCase(){
    List<Case> cs=[Select id,status from Case];
     //System.debug('Case..'+cs);
     SLA__c sl=new SLA__c();
        sl.Tipo__c='Other';
        sl.Origen__c='Phone';
        sl.Dias__c=5;
   test.startTest();
        cs[0].Status='Closed';
        update cs;
   test.stopTest();
    }

}