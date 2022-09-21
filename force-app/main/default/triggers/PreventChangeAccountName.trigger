
//don't change account name while updatinf user
trigger PreventChangeAccountName on Account (before update) {


       for(Account acc: Trigger.new){

        if(Trigger.newMap.get(acc.Id).Name!=Trigger.oldMap.get(acc.Id).Name){

            acc.name.addError('AccountName cannot change it');
        }
       }

}