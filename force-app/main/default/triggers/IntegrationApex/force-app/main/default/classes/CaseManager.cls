
@RestResource(urlMapping='/Case/*')
global with sharing class CaseManager {
  

  @HttpGet
   global static Case getCase(){
    //https://cybernowlabs-dev-ed.my.salesforce.com/services/apexrest/Case/5008c00001H51fBAAR


    RestRequest request= RestContext.request;

    String url=request.requestURI;

    Id caseId=url.split('/')[url.split('/').size()-1];
        
    Case cs=[select Id, CaseNumber, subject, Description , Status, Priority 
    
                FROM Case
                Where Id=: caseId];

    
                return cs;
    }

    @HttpPost
    global static Id createCase(String subject, String description, String priority){

        Case cs= new Case();
        cs.Subject=subject;
        cs.Description=description;
        cs.Priority=priority;

        insert cs;

        return cs.Id;
        
    }

    @HttpDelete
    global static string deleteCase(){
        
        
        RestRequest request= RestContext.request;

        String url=request.requestURI;
    
        Id caseId=url.split('/')[url.split('/').size()-1];

        Case cs=[Select Id from Case Where Id=: caseId];

        delete cs;

        return 'Case has been deleted succesfully';
    }

    @HttpPut
    global static Case upsertCase(){
        
        
        RestRequest request= RestContext.request;

        String requestBody= request.requestBody.toString();

        Case cs=(Case)JSON.deserialize(requestBody, Case.class);


        upsert cs;

        return cs;
    }



    // we are just touching the whenever the user touched it 
    @HttpPatch
    global static Case patchCase(){
        
        
        RestRequest request= RestContext.request;

        String requestBody= request.requestBody.toString();

        //entire request body converted into the map where key is the this
        Map<String, Object> caseInfo=(Map<String, Object>)JSON.deserializeUntyped(requestBody);

        Case cs= new Case();

        for(String key: caseInfo.keySet()){
            cs.put(key, caseInfo.get(key));
        }

        update cs;

        return cs;

    }

}
