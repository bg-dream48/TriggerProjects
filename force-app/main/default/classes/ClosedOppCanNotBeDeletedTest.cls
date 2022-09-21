@istest


public with sharing class ClosedOppCanNotBeDeletedTest {
    
    
    @isTest static void ClosedOppCanNotBeDeletedTest() {

        Opportunity op= new Opportunity();
        op.Name='test Method';
        op.CloseDate=date.parse('07/08/2019');
        op.StageName='Closed Won';
        op.Type='New Customer';

          insert op;
    


        try{

            delete op;

        }catch(DmlException e){
         System.assert(e.getMessage().contains('Closed Won opportunities can not be deleted'));

        }


       // System.assertEquals(0,[select id from Opportunity].size());

    }
}
