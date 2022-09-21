public with sharing class RestCallOuts {


    private static final String HTTP_GET='GET';
    private static final String HTTP_POST='POST';

    public static HttpResponse getAnimals() {
        //1 .prepare request
        HttpRequest request= new HttpRequest();
           request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals'); //which identifies the target website and server end point

           request.setMethod(HTTP_GET);




        //2. prepare http

        Http http= new Http();
        //3. send the request over the internet and receive response
        HttpResponse res=http.send(request);
        //4. process the response

        if(res.getStatusCode()==200){

            String jsonString= res.getBody();
            System.debug(jsonString);

        }else{
            //create error log

        }

        return res;

    }


    public static HttpResponse getUsers(){

        HttpRequest request = new HttpRequest();

        request.setEndpoint(Integration_Infos__mdt.getInstance('POST_USERS').Endpoint__c);

        request.setMethod('GET');

        Http http= new Http();

        HttpResponse res= http.send(request);

        if(res.getStatusCode()==200){

            String jsonString= res.getBody();
            List<ContactResponse> contactResponses=(List<ContactResponse>)JSON.deserialize(jsonString, List<ContactResponse>.class);
            System.debug(jsonString);
            processContacts(contactResponses);
        }else{

        }

    return res;
    }

    private static void processContacts(List<ContactResponse> contactResponses){
        List<Contact> contacts= new List<Contact>();

        for(ContactResponse conRes:contactResponses){

           Contact con = new Contact();
           String [] names= conRes.name.split(' ');

           con.FirstName= names[0];
           con.LastName=names[1];

           con.Email=conRes.Email;
           con.Gender__c=conRes.gender;
           con.Status__c=conRes.status;

           contacts.add(con);

        }

        insert contacts;
    }

    public static HttpResponse postAnimals(){
      //1.)prepare Request

      HttpRequest request= new HttpRequest();
      

      request.setEndpoint(Integration_Infos__mdt.getInstance('POST_ANIMALS').Endpoint__c);
      request.setMethod('POST');
    //   String body='{"name":"mighty moose"}';
    //   request.setBody(body);

    //   request.setHeader('Content-Type', 'application/json');
    //     //another example set of body

        List<Contact>contacts= [select firstname, LastName, Email, Phone From Contact Limit 100];

        String jsonString=JSON.serialize(contacts);
        request.setBody(jsonString);
        request.setHeader('Content-Type', 'application/json');

        //2. prepare http

        Http http= new Http();

        //3.) send the request oer the internet and receieve response

        HttpResponse response= http.send(request);

        //4 process the response

        if(response.getStatusCode()==201){
        //do business logic
        
        for(Contact con: contacts){
            con.Status__c='Active';
        }

        update contacts;

        }else{

            //error log
        }


return response;

    }
}
