public class AddPrimaryContact implements Queueable {
private Contact contacts;
private String status;
private Id parent;
    public AddPrimaryContact(Contact contacts, String status){
        this.contacts = contacts;
		this.status = status;
    }
	public void execute(QueueableContext context) {
		List<Account> lstAcc= [SELECT Id, BillingState,(SELECT Id,FirstName,LastName FROM Contacts ) FROM Account WHERE BillingState = : status LIMIT 200];
		List<Contact> lstContact = new List<Contact>();
		for (Account objAcc : lstAcc) {
			Contact cont = contacts.clone(false,false,false,false);
                 cont.AccountId =  objAcc.id;
                 lstContact.add( cont );
		}
		insert lstContact;
	}
}