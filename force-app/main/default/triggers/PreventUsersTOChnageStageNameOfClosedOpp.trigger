trigger PreventUsersTOChnageStageNameOfClosedOpp on Opportunity (before update) {



          for(Opportunity oppNew :Trigger.new){


           for(Opportunity oppOld: Trigger.old){

              if(oppOld.StageName=='Closed Won' || oppOld.StageName=='Closed Lost'){

                if(oppOld.StageName!= oppNew.StageName){

                    oppNew.StageName.addError('You can not update the stage name after Status was Closed Won and Closed Lost');
                }
              }


           }

          }



}