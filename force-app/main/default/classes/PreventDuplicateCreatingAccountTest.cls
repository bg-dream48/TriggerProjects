@istest
public with sharing class PreventDuplicateCreatingAccountTest {
   
   
   @isTest public static void  PreventDuplicateCreatingAccountTestMethod() {

     Account acc= new Account(Name='S1');
     
     insert acc;


     try{
        Account acc2= new Account(Name='S1');

     insert  acc2;



}catch(DmlException e){
System.assert(e.getMessage().contains('Account name duplicated'));
System.assertEquals(0, [select Name from Account].size());

}

     
    }
}
