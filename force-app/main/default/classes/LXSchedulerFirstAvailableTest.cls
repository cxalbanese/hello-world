@isTest
private class LXSchedulerFirstAvailableTest {
    static testMethod void getAppCandidatesTest() {
        String expectedResponse = '[' +
        '  {' +
        '    \"startTime\": \"2021-03-18T16:00:00.000+0000\",' +
        '    \"endTime\": \"2021-03-18T17:00:00.000+0000\",' +
        '    \"resources\": [' +
        '      \"0HnRM0000000Fxv0AE\"' +
        '    ],' +
        '    \"territoryId\": \"0HhRM0000000G8W0AU\"' +
        '  },' +
        '  {' +
        '    \"startTime\": \"2021-03-18T19:00:00.000+0000\",' +
        '    \"endTime\": \"2021-03-18T20:00:00.000+0000\",' +
        '    \"resources\": [' +
        '      \"0HnRM0000000Fxv0AE\"' +
        '    ],' +
        '    \"territoryId\": \"0HhRM0000000G8W0AU\"' +
        '  }' +
        ']';
        lxscheduler.SchedulerResources.setAppointmentCandidatesMock(expectedResponse); 
        Test.startTest();
            LXScheduleFirstAvailable.payloadIn pl = new LXScheduleFirstAvailable.payloadIn();
            pl.workTypeGroupId = '0VSB0000000LB9TOAW';
            pl.serviceTerritoryId ='0HhB0000000TrsdKAC';
            pl.startDateTime = datetime.now();
            pl.accountId = '001B000001KYUM3IAP';
            pl.schedulingPolicyId = '0VrB0000000Kz6Z';
            list<LXScheduleFirstAvailable.payloadIn> plList = new list<LXScheduleFirstAvailable.payloadIn>();
            plList.add(pl);
            List<event> candidateList = LXScheduleFirstAvailable.ScheduleIt(plList);
            System.assertEquals(1, candidateList.size(), 'Should return only 1 record!');
        Test.stopTest();
    }
}