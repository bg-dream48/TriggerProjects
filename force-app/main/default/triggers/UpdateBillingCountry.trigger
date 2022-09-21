
//update billing country to USA if it is filled as a America

trigger UpdateBillingCountry on Account (before insert) {

        
        for(Account acc: Trigger.new){

           if(acc.BillingCountry=='America'){
             acc.BillingCountry='USA';

           }

        }

}