@isTest
public class AccountProcessorTest {
    
    @isTest
    private static void countContactsTest(){
        
        //Load test data
        
        List<Account> accounts= new List<Account>();
        for(Integer i=0;i<300;i++){
            accounts.add(new Account(Name='Test Account '+ i));
        }
        insert accounts;
        
        List<Contact> contacts= new List<Contact>();
        List<Id>accountIds= new  List<Id>();
        
        for(Account acc: accounts){
            
            contacts.add(new Contact(FirstName=acc.Name, LastName='Test Account', AccountId=acc.Id,Email='sdasdas@gmail.com'));
            accountIds.add(acc.Id);
        }
        
        insert contacts;
        
        //do the test
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();
        
        //check Result
        
        List<Account> accs= [select Id, Number_Of_Contacts__c From Account];
        for(Account acc: accs){
            
            System.assertEquals(1,acc.Number_Of_Contacts__c);
        }
        
    }

}