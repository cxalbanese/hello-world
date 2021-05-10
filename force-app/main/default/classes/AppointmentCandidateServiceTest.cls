@isTest
private class AppointmentCandidateServiceTest {
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
            List<AppointmentCandidateService> candidateList = AppointmentCandidateService.getAppointmentCandidates();
            System.assertEquals(2, candidateList.size(), 'Should return only 2 records!');
        Test.stopTest();
    }
}