
//if type is left blank while adding an opportunity , set is as a New Customer

//blank means null

//will use before insert no need to id

trigger OpportunityTypeUpdate on Opportunity (before insert) {

for(Opportunity o:Trigger.new){

        if(o.Type== null || o.Type==''){
                o.Type='New Customer';
        }
}

}