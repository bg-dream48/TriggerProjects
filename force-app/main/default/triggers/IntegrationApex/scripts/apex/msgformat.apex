Account acc=[select Id, name, Type from Account Limit 1];

String jsonString=JSON.serialize(acc);

System.debug(jsonString);





List<Account>listAccounts=[select Id, name, Type from Account 
                             where AnnualRevenue != null
                             Limit 3];

String jsonString2= JSON.serialize(listAccounts);
System.debug(listAccounts);


String jsonString='{ "Name: "TestAccount integrationjkjhkhkhkk",  "Type" : "Prospect"}';

Account accc=(Account)JSON.deserialize(jsonString, Account.class);

insert accc;

//Test Rest Call Out

RestCallOuts.getAnimals();

RestCallOuts.getUsers();
   

RestCallOuts.postAnimals();
