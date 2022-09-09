public with sharing class OutlookEvent{
    public starts starts{get;set;}
    public ends ends{get;set;}
    public String subject{get;set;}
    public String body{get;set;}
    public static String strBody;
    
    @AuraEnabled(cacheable=true)
public static String getEvent(String eventNumber){
    List<Salesforce_Calendar__c> event = [Select Type__c,Description__c,StartDateTime__c,EndDateTime__c FROM Salesforce_Calendar__c WHERE Id =: eventNumber];
    List<EventData> eventList= new List<eventData>();
    for(Salesforce_Calendar__c eve:event){
        EventData eveData= new EventData();
        eveData.subject = eve.Type__c;
        
        starts eventStarts= new starts();
        eventStarts.dateTimes = eve.StartDatetime__c;
        eventStarts.timeZone= 'UTC';  
        
        eveData.starts=eventStarts;
        
        ends eventEnds = new ends();
        eventEnds.dateTimes = eve.EndDateTime__c;
        eventEnds.timeZone= 'UTC'; 
        eveData.ends=eventEnds; 
        
        
        
        body body= new body();
        body.contentType='HTML';
        body.content= eve.Description__c;
        eveData.body=body;
        
        
        eventList.add(eveData);
        
        }
    String jsonSt=JSON.serialize(eventList);
    String jsonStr = jsonSt.replaceAll('"ends":','"end":').replaceAll('"starts":','"start":').replaceAll('"dateTimes":','"dateTime":');
   	
    
    HttpResponse response = CalendarService.PostCalloutOutlook(jsonStr);
    return String.valueOf(response.getStatusCode());

}
public class starts{
    
    public Datetime dateTimes{get;set;}
    public String timeZone{get;set;}
}
public class ends{
    
    public Datetime dateTimes{get;set;}
    public String timeZone{get;set;}
}
    
    public class body{
        public String content{get;set;}
        public String contentType{get;set;}
        
    }
    
    public class EventData{
        public String subject;
        public ends ends;
        public starts starts;
        public location location;
        public body body;
    }
    
    
}



/*{
"subject": "My event",
"start": {
    "dateTimes": "2022-08-13T09:06:08.583Z",
    "timeZone": "UTC"
},
"body": {
    "contentType": "HTML",
    "content": "Does noon work for you?"
  },
"end": {
    "dateTimes": "2022-08-20T09:06:08.583Z",
    "timeZone": "UTC"
}
}*/