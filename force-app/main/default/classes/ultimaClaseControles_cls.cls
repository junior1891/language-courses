public class ultimaClaseControles_cls {
public static String newIdTest;
    @AuraEnabled
    
    //recibir un parametro string
    public static String getAction(String mensaje){
    String captura=mensaje+'ultima clase';
        
        insertOpportunityTest(mensaje);
        updateOpportunityTest(captura);
        
        return captura;
    }
    public static void insertOpportunityTest(String insertaropp){
        Opportunity nuevaOpportunityTest=new Opportunity();
        nuevaOpportunityTest.Name='miOportunidad';
        nuevaOpportunityTest.StageName='Prospecting';
        nuevaOpportunityTest.CloseDate=date.today();
        nuevaOpportunityTest.Description=insertaropp;
        insert nuevaOpportunityTest;
        newIdTest=nuevaOpportunityTest.Id;
    }

    //MASSIVE UPDATE
    private static void updateOpportunityTest(String nameTest){
        List<Opportunity> lstopp=[SELECT id, Name FROM Opportunity];
        
        for(Opportunity lst:lstopp){
            if(lst.Id !=newIdTest){
                lst.Name=nameTest;
            }
            System.debug(lst);
        }
        update lstopp;
            }
}