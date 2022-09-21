trigger updateDescriptionField on Account (before insert, before update) {



     if(Trigger.isInsert && Trigger.isBefore){

      for(Account ac: Trigger.new){

        ac.Description= 'This description has been updated  before insert';
      }


     }



     if(Trigger.isUpdate && Trigger.isBefore){

for(Account ac: Trigger.new){

  ac.Description= 'This description has been updated  after update';
}


}


}