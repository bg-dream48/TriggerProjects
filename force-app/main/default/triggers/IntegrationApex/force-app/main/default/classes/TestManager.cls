public with sharing class TestManager {
   


    public static Case createCase(){
       Case cs= new Case();

       cs.Subject='Test Subject';
       cs.Description='Test Description';
       cs.Priority='High';
       cs.Status='New';

   return cs;
    }
}
