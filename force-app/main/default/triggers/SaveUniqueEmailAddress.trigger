trigger SaveUniqueEmailAddress on Contact (before insert) {

Set<String>oldEmail= new Set<String>();

for(Contact c: [select id, email from Contact]){

    oldEmail.add(c.Email);
}


for(Contact cc: Trigger.new){

    if(oldEmail.contains(cc.Email)){
        cc.Email.addError('Email has ben already used');

    }
}




}