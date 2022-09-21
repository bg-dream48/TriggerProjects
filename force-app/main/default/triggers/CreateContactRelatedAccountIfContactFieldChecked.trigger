trigger CreateContactRelatedAccountIfContactFieldChecked on Account (after insert) {


List<Contact> contactList= new List<Contact>();


    for(Account acc: Trigger.new){

        if(acc.Create_Contact__c==true){

       

            contactList.add(new Contact(AccountId=acc.Id, LastName=acc.Name));
        }
    }

    if(contactList.size()!=0){
        insert contactList;
    }

}