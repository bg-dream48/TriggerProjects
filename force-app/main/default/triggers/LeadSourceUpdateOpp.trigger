

//add validation rule when type is null
trigger LeadSourceUpdateOpp on Opportunity (before insert, before update) {

    for(Opportunity op: Trigger.new){

        if(op.Type == null || op.Type ==''){
           
           op.Type.addError('Type must be selected');
        }

      
        
    }

}



// //lead source must be web when new opp is created
// trigger LeadSourceUpdateOpp on Opportunity (before insert, before update) {

// for(Opportunity op: Trigger.new){

//     if(op.LeadSource== null || op.LeadSource==''){
//         op.LeadSource='Other';
//     }

//     if(op.LeadSource=='Phone Inquiry'){
//         op.Type='New Customer';
//     }
    
// }

// }



// //lead source must be web when new opp is created
// trigger LeadSourceUpdateOpp on Opportunity (before insert, before update) {

// for(Opportunity op: Trigger.new){

//     op.LeadSource='Web';
// }

// }