@isTest 
public with sharing class CalendarService_Test {
    @isTest 
static void requestAccessToken_Test() {
    // Set mock callout class 
    Test.setMock(HttpCalloutMock.class, new CalendarHttpCalloutMock()); 
    // This causes a fake response to be sent
    // from the class that implements HttpCalloutMock. 
    HttpResponse res = CalendarService.requestAccessToken();
    // Verify that the response received contains fake values
    Map<String, Object> responseGetBody = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
           String accessToken= String.valueof(responseGetBody.get('access_token'));
    String actuallValue =accessToken;
    System.debug(res.getBody());
    String expectedValue = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjExMzk2NGY3MDZiNGM0ZTJhYTFiM2M4NGQ1Y2YwYWRhMjA4OWIwNDc2ZjM3NjlhN2I1ZTBmZDNkN2YyM2IxYmUxNWE0N2Y0YTU4YmYzMzE1In0.eyJhdWQiOiIxNDQiLCJqdGkiOiIxMTM5NjRmNzA2YjRjNGUyYWExYjNjODRkNWNmMGFkYTIwODliMDQ3NmYzNzY5YTdiNWUwZmQzZDdmMjNiMWJlMTVhNDdmNGE1OGJmMzMxNSIsImlhdCI6MTU1NDc4NzQ3MSwibmJmIjoxNTU0Nzg3NDcxLCJleHAiOjE1NTQ4MzA2NzEsInN1YiI6IjMxOTgwMSIsInNjb3BlcyI6WyJ0cmFkZSIsInByb2ZpbGUiXX0.blR3PYblZtYvd0VOnaePaUFu_dkE2yhbGgBLTHqXGuvaMC-57OhXaWNxLLjLzlHrL1bTJcMUYfRrBNhbpiLe9ln7FofuoRUfSm0IhBuvgX-5Le1k0KLd-1JdFW8Y1jIOYm8jGT7WdBRD3ykPoWAKcp_iuXgv2Ci_beii6W6ANX4BWShpekBuUfcKQoiXLNpmDWNt8SfbF4MDjDCs-Z81HAtzFr4P7lmMFugkqODOgVYg9VEhAdXWG56K8uTBmdc0v7w1Ahy7DE_wWzOMOA6JPq6qUvoIuz51I7LCLLhXUNeLXpELuXzREKqSbgZJb2KaZ67vbFYEM4dt8s67SKWfMv5KK7OPY6v0zB529m3r5H0wfvNOH7PNw782q9AmOSZc62yXCKijBNP-7XKsrzbK2LneVn8z_wDLJ3xjs7frppkQ0f-YAk3xmg8JJnPWDleLm4FUx32F2_MwPlN227ThgASi2N8jtRpkUgNFnOkBScDhEwpT5zqJK9H09pTkUIWdDCB7H5er0HR9qBK509qif4b9UGl1OHMnjQKyFQT36c5nGJCG05E0IRH8Mbax37Wv94Eb_53rpJwEWv_XkuT-N_wPEwf92VvwCUhoHxTK9a-p78NfCuroRQWARk4gdhZ9i_rCgQQEzlEk9EsiFl_bTcBgT7bU';
    System.assertEquals(expectedValue, actuallValue);
    System.assertEquals(200, res.getStatusCode());
}
    @isTest 
static void PostCalloutOutlook_Test() {
    // Set mock callout class 
    Test.setMock(HttpCalloutMock.class, new CalendarHttpCalloutMock()); 
    // This causes a fake response to be sent
    // from the class that implements HttpCalloutMock. 
    String jsonStr= '{"subject":"My event","start":{"dateTimes":"2022-08-13T09:06:08.583Z","timeZone":"UTC"},"body":{"contentType":"HTML","content":"Does noon work for you?"},"end":{"dateTimes":"2022-08-20T09:06:08.583Z","timeZone":"UTC"}}"';

    HttpResponse response = CalendarService.PostCalloutOutlook(jsonStr);
    // Verify that the response received contains fake values
    String contentType = response.getHeader('Content-Type');
    System.assert(contentType == 'application/json');
    String actualValue = response.getBody();
    System.debug(response.getBody());
    String expectedValue = '"{\"start\":{\"dateTime\":\"2022-09-05T11:30:20.9830000\",\"timeZone\":\"UTC\"},\"end\":{\"dateTime\":\"2022-09-12T11:30:20.9830000\",\"timeZone\":\"UTC\"},\"emailAddress\":{\"name\":\"sbonelo ngcobo\",\"address\":\"sbonelo48@13ldv0.onmicrosoft.com\"},\"createdDateTime\":\"2022-09-05T11:30:35.5840498Z\",\"lastModifiedDateTime\":\"2022-09-05T11:30:35.8184071Z\"}"';
    System.assertEquals(expectedValue, actualValue);
    System.assertEquals(201, response.getStatusCode());
}
}
