trigger Account_TGR on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete ) {
if(Trigger.isInsert)
	{
        if(Trigger.isbefore)
        {
    	List<Account> listaacc=Trigger.new;
            for(Account acc:listaacc)
            {
                if(acc.name=='Luis')
                {
                 acc.NumberOfEmployees=30;  
                }  
                 if(acc.name=='Juan')
                {
                 acc.NumberOfEmployees=0;  
                }    
            }
            System.debug('a : '+listaacc);
        }else if(Trigger.isafter){
            List<Account> lstacc=Trigger.new;
            //CREACION DE CONTACTOS POR LE NUMERO DE EMPLEADOS DE UNA CUENTA , SI ES MAYOR A 50 SOLO CREAR 50
            List<Contact> listacontacto=new List<Contact>();
            Integer i=0;
            Contact con;
            for(Account acc : lstacc)
            {
               if(acc.NumberOfEmployees==null)
                {
                    i=0;
                }
                else
                {
                    if(acc.NumberOfEmployees>50){
                        i=50;
                    }else{
                        i=acc.NumberOfEmployees;
                    }
                }
            if(i>0)
                for (Integer j=1;j<=i;j++)
            {
                con=new Contact();
                con.lastname=acc.Name+''+j;
                con.AccountId=acc.Id;
                listacontacto.add(con);
            }
        }
        insert listacontacto;       
        
        }
    }
}