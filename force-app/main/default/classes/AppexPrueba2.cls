public class AppexPrueba2 {
    @AuraEnabled //consumo por lightning
    public static List<Opportunity> devolver (Id opp){
     return [SELECT Id, Name, CloseDate FROM Opportunity WHERE AccountId= :opp];
    }
}