public class AccountUtils {

	public static List<Account> accountsByState(String strBillingState) {
		List<Account> lstAcc = new List<Account>([SELECT Id, BillingState FROM Account WHERE BillingState =: strBillingState]);

		return lstAcc;
	}
}