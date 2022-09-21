
 //Don't create a new Account if the name already exist
trigger PreventDuplicateCreatingAccount on Account (before insert) {


List<Opportunity>oppList= [select id , name from Opportunity where Name =: Trigger.new[0].name];

if(oppList.size()>1){
    Trigger.new[0].name.addError('Account name duplicated');
}
        

}



// 2.way trigger PreventDuplicateCreatingAccount on Account (before insert) {


// Set<String> newListWithName= new Set<String>();

// for(Account acc: Trigger.new){

//     newListWithName.add(acc.Name);
// }


// //find any name has contains new name;
// //var olan accountlar benim kumemdeki name ise getir
// List<Account> existingNames= [select id, name from Account where Name in: newListWithName];

// if(existingNames.size()>0

//     acc.name.addError('Account name duplicated');
// }



// List<Account>accountName=[select Name from Account];

//         for(Account acc:Trigger.new){

//             for(Account acc2: accountName){

//         if(acc.Name == acc2.Name){

//          acc.name.addError('Account name duplicated');
//         }

//             }

          
//             }
        

// }










//1 way: Don't create a new Account if the name already exist

// trigger PreventDuplicateCreatingAccount on Account (before insert) {



// List<Account>accountName=[select Name from Account];

//         for(Account acc:Trigger.new){

//             for(Account acc2: accountName){

//         if(acc.Name == acc2.Name){

//          acc.name.addError('Account name duplicated');
//         }

//             }

          
//             }
        

// }