@isTest
public with sharing class OutlookEvent_Test {
  
   @isTest 
    static void setup() {
       Datetime dt = Datetime.newInstance(2022, 09, 09);
       Datetime dt2 = dt.addHours(2);
    Salesforce_Calendar__c events = new Salesforce_Calendar__c(Name = 'Client Servicing', StartDateTime__c =dt,
        EndDateTime__c =dt2,Description__c ='event test');
    
    
  
    
        insert events;
         
      
   }
   
   @isTest(SeeAllData = true)  
   static void getEvent_Test() {
    Test.setMock(HttpCalloutMock.class, new CalendarHttpCalloutMock()); 
    Test.startTest();
    OutlookEvent.getEvent('a4D0C000000SdmVUAS');
       Test.stopTest();
    List<Salesforce_Calendar__c> cal= [SELECT Name,StartDateTime__c,EndDateTime__c,Description__c
            FROM Salesforce_Calendar__c
            Where Name='Client Servicing'];
      OutlookEvent.starts str=new OutlookEvent.starts();
       if(cal!=null){
       		for(Salesforce_Calendar__c eve: cal){
           System.assertNotEquals(null, eve.Name);        
	       System.assertNotEquals(null, eve.StartDateTime__c);
    	   System.assertNotEquals(null, eve.EndDateTime__c);
    	   System.assertNotEquals(null, eve.Description__c);
			str.dateTimes=eve.StartDateTime__c;
           System.assertNotEquals(null, str.dateTimes);
       }
       
       }           
    
      
       

    OutlookEvent ob = new OutlookEvent();
    ob.body='Does noon work for you?';
    ob.subject='My event';
    System.assertEquals('Does noon work for you?',ob.body);
    System.assertEquals('My event',ob.subject);

    OutlookEvent.starts obj = new OutlookEvent.starts();
    Datetime dt3 = Datetime.newInstance(2022, 09, 09);
    obj.dateTimes=dt3;
    obj.timeZone='UTC';
    System.assertNotEquals(null, obj.dateTimes);
    System.assertNotEquals(null, obj.timeZone);

    OutlookEvent.ends obj1 = new OutlookEvent.ends();
    Datetime dateEnd = Datetime.newInstance(2022, 09, 09);
    obj1.dateTimes=dateEnd;
    obj1.timeZone='UTC';
    System.assertNotEquals(null, obj1.dateTimes);
    System.assertNotEquals(null, obj1.timeZone);

    OutlookEvent.body obj2 = new OutlookEvent.body();
    obj2.content='Does noon work for you?';
    obj2.contentType='HTML';
    System.assertEquals('Does noon work for you?',obj2.content);
    System.assertEquals('HTML',obj2.contentType);
      

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