public class AppointmentCandidateService {
    
    //Instance members for parsing
    public String startTime;
    public String endTime;
    public List<String> resources; 
    public String territoryId;
    
    public static List<AppointmentCandidateService> getAppointmentCandidates(){
        //Build input for GetAppointmentCandidates API
        lxscheduler.GetAppointmentCandidatesInput input = new lxscheduler.GetAppointmentCandidatesInputBuilder()
            .setWorkTypeGroupId('0VSB0000000LB9TOAW')
            .setTerritoryIds(new List<String>{'0HhB0000000TrsdKAC'})
            .setStartTime(System.now().format('yyyy-MM-dd\'T\'HH:mm:ssZ','America/Los_Angeles'))
            .setEndTime(System.now().addDays(2).format('yyyy-MM-dd\'T\'HH:mm:ssZ','America/Los_Angeles'))
            .setSchedulingPolicyId('0VrB0000000Kz6Z')
            .setApiVersion(Double.valueOf('50.0'))
            .build();
        
        List<AppointmentCandidateService> vList = parse(lxscheduler.SchedulerResources.getAppointmentCandidates(input));
        return vList;
    }
    
    private static List<AppointmentCandidateService> parse(String json) {
        return (List<AppointmentCandidateService>) System.JSON.deserialize(json, List<AppointmentCandidateService>.class);
    }
}