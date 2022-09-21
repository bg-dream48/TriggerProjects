
//closed Won Opportunity can not be deleted
trigger ClosedWonOppCanNotBeDeleted on Opportunity (before delete) {


    for(Opportunity op: Trigger.old){


        if(op.StageName=='Closed Won'){

            op.addError('Closed Won opportunities can not be deleted');
        }
        
    }

}