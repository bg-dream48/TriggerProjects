

//if mailing Addressis same other field check marked combine mail address and other address filed
trigger CombinemailingAddressAndOtherAddress on Contact (before insert, before update) {

            for(Contact con: Trigger.new){

                 if(con.Mailing_Address_is_Same_As_Other__c==True){

                     con.OtherCountry=con.MailingCountry;
                     con.OtherCity=con.MailingCity;
                     con.OtherPostalCode=con.MailingPostalCode;
                     con.OtherState=con.MailingState;

                 }

            }

}


