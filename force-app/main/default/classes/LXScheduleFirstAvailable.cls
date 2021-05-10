public with sharing class LXScheduleFirstAvailable {

    @invocableMethod(label='Schedule to First Available' description='Schedule to whomever is next')
    public static list<event> ScheduleIt(list<payloadIn> payloadList ){
        if(payloadList == null || payloadList.size() <> 1) return null;
        payloadIn pl = payloadList[0];
        lxscheduler.GetAppointmentCandidatesInput input = new lxscheduler.GetAppointmentCandidatesInputBuilder()
            .setWorkTypeGroupId(pl.workTypeGroupId)
            .setTerritoryIds(new List<String>{pl.serviceTerritoryId})
            .setStartTime(pl.startDateTime.format('yyyy-MM-dd\'T\'HH:mm:ssZ'))
            .setEndTime(pl.startDateTime.addDays(3).format('yyyy-MM-dd\'T\'HH:mm:ssZ'))
            .setAccountId(pl.accountId)
            .setSchedulingPolicyId(pl.schedulingPolicyId)
            .setApiVersion(Double.valueOf('50.0'))
            .build();
        //call the Apex Method - no REST API authentication or API user needed!!!
        String response = lxscheduler.SchedulerResources.getAppointmentCandidates(input);
        //parse the results using JSON.deserialize
        if(response==null) return null;
        list<schedulerCandidates> allslots = schedulerCandidates.parse(response);
        system.debug(response);
        //slots found, return just the first one
        if(allslots!=null) {
            event thisevent = new event();
            thisevent.startdatetime = allslots[0].startTime;
            thisevent.enddatetime = allslots[0].endTime;
            thisevent.description = allslots[0].territoryId;
            thisevent.whoid = allslots[0].resources[0];
            return new list<event>{thisevent};
        }
        //no slots found, return null
        return null;
    }
    public class payloadIn{
        @invocableVariable(required=true)
        public string workTypeGroupId;
        @invocableVariable(required=true)
        public string serviceTerritoryId;
        @invocableVariable(required=true)
        public string schedulingPolicyId;
        @invocableVariable(required=true)
        public string accountId;
        @invocableVariable(required=true)
        public datetime startDateTime;
    }

}
