public with sharing class CalendarService {
    
    public static String statusCode;
    // requesting/invoking an access token
     public static HttpResponse requestAccessToken(){
    Azure_Active_Directory_Auth__mdt azureAuth = [SELECT Azure_Client_ID__c, Azure_Client_Secret__c, Azure_Scope__c, Azure_Tenant_Id__c, Azure_Grant_Type__c FROM Azure_active_directory_Auth__mdt WHERE DeveloperName = 'My_Active_Directory'];
    String strbody = 'client_id =' + azureAuth.Azure_Client_ID__c + '&client_secret=' + azureAuth.Azure_Client_Secret__c + '&scope='+ azureAuth.Azure_Scope__c + '&grant_type=' + azureAuth.Azure_Grant_Type__c;
    HttpRequest request = new HttpRequest();
    request.setTimeout(120000);
    String endPoint = 'callout:Microsoft_Online' + '/' + azureAuth.Azure_Tenant_id__c + '/oauth2/v2.0/token';
    request.setEndpoint(endPoint);
    request.setMethod('POST');
    request.setBody(strbody);
    Http http = new Http();
    HttpResponse response = http.send(request);
    
   
         return response;
     }
    
    public static  HttpResponse  PostCalloutOutlook(String jsonStr) {
        String UserEmail = UserInfo.getUserEmail();
        String endP='https://graph.microsoft.com/v1.0/users'+'('+'\''+ UserEmail + '\''+')'+'/events';
        HttpResponse resp=requestAccessToken();
        String accessToken;
        if(resp.getStatusCode() == 200) {
            Map<String, Object> responseGetBody = (Map<String, Object>) JSON.deserializeUntyped(resp.getBody());
            accessToken= String.valueof(responseGetBody.get('access_token'));
            }
            System.debug('resp '+resp);
        System.debug('access token is:  ' + accessToken);
    HttpRequest request = new HttpRequest();
    request.setTimeout(120000); // Maximum Timeout Period
    request.setEndpoint(endP);
    request.setMethod('POST');
    request.setHeader('Authorization', 'Bearer ' + accesstoken);
    request.setHeader('accept', 'application/json');
    request.setHeader('Content-Type', 'application/json');
      
        
        
 		String regex = '\\[|\\]';
 		String newStr = jsonStr.replaceAll(regex, '');
         System.debug('json final body '+newStr);
        if (newStr != null){
            request.setBody(newStr);
                
            }
     
    Http http = new Http();
    HttpResponse response = http.send(request);
        System.debug('res is>>'+response.getBody());
        
        
        if(response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
    return response;
    }
    
    }