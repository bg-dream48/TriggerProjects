
public class AccountProcessor {
    
    @future
  public  static void countContacts(List<id>accountIds){
        
        List<Account> accounts= [select Id, (select id From Contacts) from Account Where Id In: accountIds];
        
        for(Account acc:accounts){
            
            acc.Number_Of_Contacts__c=acc.Contacts.size();
        }
        
        update accounts;
        
    }
    

}