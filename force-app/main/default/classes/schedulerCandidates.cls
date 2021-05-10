public class schedulerCandidates {

	public datetime startTime;
	public datetime endTime;
	public List<String> resources;
	public String territoryId;

	
	public static list<schedulerCandidates> parse(String json) {
		return (list<schedulerCandidates>) System.JSON.deserialize(json, list<schedulerCandidates>.class);
	}
}