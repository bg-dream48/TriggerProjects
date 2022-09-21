trigger PreventUsersDeleteAccountsWithRelatedopp on Account (before delete) {



     List<Opportunity> relatedOpp= [select id, name from Opportunity where AccountId in : Trigger.old];

     if(relatedOpp.size()!=0){
        Trigger.old[0].addError('An account with an oppurtunity can not be deleted');
    
     }





}