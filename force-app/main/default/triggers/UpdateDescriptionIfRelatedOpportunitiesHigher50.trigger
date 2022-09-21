trigger UpdateDescriptionIfRelatedOpportunitiesHigher on Account (after  update) {



   // find related Opportbuties whose Account got updated

   List<Opportunity> updatedRelatedOpp= [select id, Name, Probability from Opportunity where AccountId In: Trigger.new];

   
       
   List<Opportunity> needsToUpdate=new List<Opportunity>();


   for(Opportunity o: updatedRelatedOpp){

      if(o.Probability>50){

        needsToUpdate.add(o);
      }
   }

   update needsToUpdate;




 

}