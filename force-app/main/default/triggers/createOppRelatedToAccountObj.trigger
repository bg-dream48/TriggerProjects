trigger createOppRelatedToAccountObj on Account (after insert, after update) {


   List<Opportunity> opp= new List<Opportunity>();

  // find account record does not have opportunity

  List<Account> needsToAddOpp = [select id, name from Account where 
  Id in: Trigger.new and not in (select AccountId from Opportunity)];




   for(Account acc:needsToAddOpp){

    opp.add(new Opportunity(Name=acc.name, StageName='Prospecting', 
    CloseDate=System.today().addMonths(2), AccountId=acc.Id));


   }

   if(needsToAddOpp>0){
insert needsToAddOpp;

   }




}