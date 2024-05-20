public with sharing class DailyLeadProcessor implements Schedulable {

    public static String CRON_EXP = '0 0 0 15 3 ? 2042';

    public void execute(SchedulableContext schContext) {
        List<Lead> lstLead = new List<Lead>([SELECT Id FROM Lead WHERE LeadSource = '']);
        List<Lead> newList = new List<Lead>();
        for (Lead objLead : lstLead) {
            objLead.LeadSource = 'Dreamforce';
            newList.add(objLead);
        }
        update newList;
    }
}