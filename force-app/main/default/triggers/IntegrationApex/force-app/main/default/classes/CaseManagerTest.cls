@isTest
public  class CaseManagerTest {
  
    

     @TestSetup
     private static  void testSetUp(){

    List<Case> cases= new List<Case>();

    for(Integer i=0;i<5;i++){

        cases.add(TestManager.createCase());

    }
    insert cases;
}


@isTest
private static void getCaseTest(){

    Case cs= [select Id from Case Limit 1];
    //prepare Rest request
    RestRequest request= new RestRequest();
    request.requestURI='//https://cybernowlabs-dev-ed.my.salesforce.com/services/apexrest/Case/'+ cs.id;
    request.httpMethod='GET';

    //prepare Rest context
    RestContext.request=request;

    //test getCase method
    Case csObj= CaseManager.getCase();
    System.assert(csObj.Id!=null);


}


@isTest
private static void createCaseTest(){
    Id caseId= CaseManager.createCase('Post call test', 'This is a test','Low');

    System.assert(caseId!=null);

}

@isTest
private static void deleteCaseTest(){

    Case cs= [Select id from Case Limit 1];

    //prepare Rest Request

    RestRequest request= new RestRequest();
    request.requestURI='//https://cybernowlabs-dev-ed.my.salesforce.com/services/apexrest/Case/'+ cs.id;
    request.httpMethod='DELETE';

    //prepare rest context
    RestContext.request=request;

    //test deleteCase method
    String status =CaseManager.deleteCase();
    System.assertEquals('Case has been deleted succesfully', status);
}


@isTest
private static void upsertCaseTest(){

    //prepare rest request
     RestRequest request = new RestRequest();
     request.requestURI='//https://cybernowlabs-dev-ed.my.salesforce.com/services/apexrest/Case/';

     String requestBody='{ "Subject: "TestAccount integrationjkjhkhkhkk",  "Priority":"Low", "Description":"Test case"}';
     request.requestBody=Blob.valueOf(requestBody);
     request.httpMethod='PUT';

     //prepare rest context

     RestContext.request=request;

     //test upsertCase Method
     Case csObj=CaseManager.upsertCase();
     System.assert(csObj.Id!=null);


}


@isTest
private static void patchCaseTest(){

    Case cs= [Select id from Case Limit 1];

    //prepare rest request
     RestRequest request = new RestRequest();
     request.requestURI='//https://cybernowlabs-dev-ed.my.salesforce.com/services/apexrest/Case/';

     String requestBody='{ "Id":"'+cs.Id+'","Subject: "TestAccount integr", "Priority":"Low", "Description":"Test case"}';
     request.requestBody=Blob.valueOf(requestBody);
     request.httpMethod='PATCH';

     //prepare rest context

     RestContext.request=request;

     //test upsertCase Method
     Case csObj=CaseManager.patchCase();
     System.assert(csObj.Id!=null);
    
}

}