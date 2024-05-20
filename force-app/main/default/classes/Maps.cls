public class Maps {
    public static void TryMap(){
        Map<Integer,String>miMap=new map<Integer,String>();
        mimap.put(1,'One');
        mimap.put(2,'Two');
        mimap.put(3,'Three');
        mimap.put(3,'Sobreescribe');
        mimap.put(4,'Four');
        
        System.debug(mimap.keySet());
        System.debug(mimap.values());
        //System.debug(mimap.get(3));
        
        String var;
        for(Integer keys : miMap.keySet()){
            var=mimap.get(keys);
            System.debug(var);
        }
        
    }
    public static void getAccounts(){
        List<Account> accs=[SELECT Name,WebSite,Phone FROM Account];
        for(Account a:accs){
            System.debug(a);
        }
    }
}