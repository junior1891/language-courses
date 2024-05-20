public class CasoTest_cls {
@AuraEnabled
    public static string InsertarCaso(string idOpp){
        return 'prueba';
    }
    public static void InsertarCaso(List<String> idOpp){
       System.debug('CASO TEST_insertar caso'); 
        List<Case> lstcase=new List<Case>();
        for(String ins:idOpp){
        Case cs=new Case();
        //OBTENER CAMPOS DE OBJETO CASE
        cs.Status='New';
        cs.Origin='Phone';
        cs.Type='Mechanical';
        cs.Opportunity_Related__c=ins;
        lstCase.add(cs);
                    }
        insert lstcase;
    }
}