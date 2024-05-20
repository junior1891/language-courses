public class Project {
     public static void CrearProjectEnAccount(){
         List<Project__c> projects=new List<Project__c>();
         Project__c proj;
        for(Account a:[SELECT Name FROM Account]){
            proj=new Project__c();
            proj.Name=a.Name+'Project';
            proj.Initial_Cost__c=100;
            proj.Account__c=a.Id;
            projects.add(proj);
}
         if(!projects.isEmpty()){
             try{
                 insert projects;
             }
             catch(DmlException e){
                 System.debug(e.getMessage());
             }
         }
     }
    public static void Print(){
        List<String> milista=new List<String>();
        milista.add('Red');
        milista.add('Blue');
        milista.add('Black');
        
        for(String item : milista){
            System.debug(item);
        }
        
       System.debug('List Size: '+milista.size());
        milista.clear();
        System.debug('List Size: '+milista.size());
    }
    
    //SET, NO PERMITE DUPLICADO
    public static void trySet(){
        Set<string> miset=new Set<String>();
        miset.add('one');
        miset.add('two');
        miset.add('one'); //INVALID VALUE
        miset.add(null);
        System.debug('Set Size: ' +miset.size());
    }
    
    //Set dentro de List
    public static void trySetList(){
    List<Set<string>> milista=new List<Set<String>>();
        Set<String> setA=new Set<String>();
        setA.add('one');
        setA.add('two');
        milista.add(setA);
        
		Set<String> setB=new Set<String>();
        setB.add('orange');
        setB.add('black');
        milista.add(setB);
        
        for(Set<String> setItem : milista){
        System.debug('Set: ');
            for(String item : setItem){ 
                System.debug(item);
            }            }
        }
    public static void fillList(List<String> lst,Integer Amount){
        for(integer i=1; i>=amount;i++){
            lst.add('Item -'+String.valueOf(i));
        }
    }
    public static void testList(){
        List <String> test=new List<String>();
        fillList(test,10);
        for(String e:test){
        System.debug(test.size());
        }
    }
}