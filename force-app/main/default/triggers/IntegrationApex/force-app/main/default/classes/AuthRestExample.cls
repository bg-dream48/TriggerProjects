public with sharing class AuthRestExample {
    
    
    
    public static HttpResponse getAnimalsWithAuthorization() {
        //1.)Prepare request
        HttpRequest request= new HttpRequest();
        request.setEndpoint(Integration_Infos__mdt.getInstance('GET_ANIMALS').Endpoint__c);
        request.setMethod('GET');



        //extra: add up authrozationd details

        String userName='bedia@gmail.com';
        String password= 'Test123@';
        Blob details= Blob.valueOf(username+ ':'+ password);

        String authorizationString= 'BASIC '+ EncodingUtil.base64Encode(details);
        request.setHeader('Authorization',authorizationString );
        //2.)prepare HTTp

        Http http= new Http();

        //3.)Send the request over the internet and receive response

        HttpResponse res= http.send(request);


        //4. process the response
        if(res.getStatusCode()==200){

        }else{

            
        }

        return res;
    }
}
