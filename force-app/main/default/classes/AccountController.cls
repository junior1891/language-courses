public with sharing class AccountController {
    public static List<Case> getAllCase() {
      return [SELECT Id, TextLongToRichArea__c FROM Case];
    }
  }