
trigger UpdateAnnualRevenue on Account (before insert) {

    //update Annual Revenue after any update Account

    //Annual Revenue must be equal to sum of all the amounts of the related Closed Won Opportunities


    List<Opportunity>relatedOppList= [select Id, Name, Amount From Opportunity where StageName='ClosedWon' And AccountId=: 
    
                                             Trigger.new.get(0).id];

           
                                             Decimal sumOfAmounts=0;
                                             
    

        for(Account acc: Trigger.new){

            for(Opportunity o: relatedOppList){

               sumOfAmounts+=o.Amount;
            }

            acc.AnnualRevenue=sumOfAmounts;
        }



}