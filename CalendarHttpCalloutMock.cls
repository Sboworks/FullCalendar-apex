@isTest
global class CalendarHttpCalloutMock implements HttpCalloutMock {
    // Implement this interface method
        // Implement this interface method
        
    global HTTPResponse respond(HTTPRequest request) {
        if (request.getEndpoint().endsWith('token')) {
            HttpResponse respons= new HttpResponse();
            
            respons.setBody('{"token_type":"Bearer","expires_in":43200,"access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjExMzk2NGY3MDZiNGM0ZTJhYTFiM2M4NGQ1Y2YwYWRhMjA4OWIwNDc2ZjM3NjlhN2I1ZTBmZDNkN2YyM2IxYmUxNWE0N2Y0YTU4YmYzMzE1In0.eyJhdWQiOiIxNDQiLCJqdGkiOiIxMTM5NjRmNzA2YjRjNGUyYWExYjNjODRkNWNmMGFkYTIwODliMDQ3NmYzNzY5YTdiNWUwZmQzZDdmMjNiMWJlMTVhNDdmNGE1OGJmMzMxNSIsImlhdCI6MTU1NDc4NzQ3MSwibmJmIjoxNTU0Nzg3NDcxLCJleHAiOjE1NTQ4MzA2NzEsInN1YiI6IjMxOTgwMSIsInNjb3BlcyI6WyJ0cmFkZSIsInByb2ZpbGUiXX0.blR3PYblZtYvd0VOnaePaUFu_dkE2yhbGgBLTHqXGuvaMC-57OhXaWNxLLjLzlHrL1bTJcMUYfRrBNhbpiLe9ln7FofuoRUfSm0IhBuvgX-5Le1k0KLd-1JdFW8Y1jIOYm8jGT7WdBRD3ykPoWAKcp_iuXgv2Ci_beii6W6ANX4BWShpekBuUfcKQoiXLNpmDWNt8SfbF4MDjDCs-Z81HAtzFr4P7lmMFugkqODOgVYg9VEhAdXWG56K8uTBmdc0v7w1Ahy7DE_wWzOMOA6JPq6qUvoIuz51I7LCLLhXUNeLXpELuXzREKqSbgZJb2KaZ67vbFYEM4dt8s67SKWfMv5KK7OPY6v0zB529m3r5H0wfvNOH7PNw782q9AmOSZc62yXCKijBNP-7XKsrzbK2LneVn8z_wDLJ3xjs7frppkQ0f-YAk3xmg8JJnPWDleLm4FUx32F2_MwPlN227ThgASi2N8jtRpkUgNFnOkBScDhEwpT5zqJK9H09pTkUIWdDCB7H5er0HR9qBK509qif4b9UGl1OHMnjQKyFQT36c5nGJCG05E0IRH8Mbax37Wv94Eb_53rpJwEWv_XkuT-N_wPEwf92VvwCUhoHxTK9a-p78NfCuroRQWARk4gdhZ9i_rCgQQEzlEk9EsiFl_bTcBgT7bU","refresh_token":"def5020046875925bb9c0ba2ead1954836339f8f31d5a45103603b857567096da0eb820114a75a6ed3db9eb301e3389d284a696a3cb21ea0df9eebdca2052e8b8120423bb2d4b063651aeff7ac7623ea3beea2f3f21b5127792daf6f71f4d23980ca140f875ec5607f63deeac8696128ea2918a473486c0c4223a088f385046b84e6f8edd17cb459d5cdc66d856ee42b2ce3f90f3829a104735372ac14eae3ccff71dde4552b9ad46df7380870b5cd3bcb8d6ca7f16484a2d5b3b26efcebf7b2e5221ed16620445099ee4b0239fd82c8e7f37262883d57fc6545ab31f9e52dc4fc4de70235d5121f7222f8066bfdc9945aa9ac5940c6e2fdc9daa6623a9f2b6e3f41aa47698ec1008514878494fef9932b317f42873af44d5dbcdd19958c2fc3835a820d09e5aa6a6ae3bef6592812a698b2547f0cca5e9f8ac38014b6651be46a098374f92bc35fcebc373f17ab70fd20cf1147bf11e2093e9908516717a3902d2d9efc7f06e917fb67dca2bca4f0c25ed7","expire":1554787516031}');
            respons.setStatusCode(200);
            return respons;
            
        } else if (request.getEndpoint().endsWith('events')) {
            HttpResponse response = new HttpResponse();
        
        response.setHeader('Authorization', 'Bearer ' +'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjExMzk2NGY3MDZiNGM0ZTJhYTFiM2M4NGQ1Y2YwYWRhMjA4OWIwNDc2ZjM3NjlhN2I1ZTBmZDNkN2YyM2IxYmUxNWE0N2Y0YTU4YmYzMzE1In0.eyJhdWQiOiIxNDQiLCJqdGkiOiIxMTM5NjRmNzA2YjRjNGUyYWExYjNjODRkNWNmMGFkYTIwODliMDQ3NmYzNzY5YTdiNWUwZmQzZDdmMjNiMWJlMTVhNDdmNGE1OGJmMzMxNSIsImlhdCI6MTU1NDc4NzQ3MSwibmJmIjoxNTU0Nzg3NDcxLCJleHAiOjE1NTQ4MzA2NzEsInN1YiI6IjMxOTgwMSIsInNjb3BlcyI6WyJ0cmFkZSIsInByb2ZpbGUiXX0.blR3PYblZtYvd0VOnaePaUFu_dkE2yhbGgBLTHqXGuvaMC-57OhXaWNxLLjLzlHrL1bTJcMUYfRrBNhbpiLe9ln7FofuoRUfSm0IhBuvgX-5Le1k0KLd-1JdFW8Y1jIOYm8jGT7WdBRD3ykPoWAKcp_iuXgv2Ci_beii6W6ANX4BWShpekBuUfcKQoiXLNpmDWNt8SfbF4MDjDCs-Z81HAtzFr4P7lmMFugkqODOgVYg9VEhAdXWG56K8uTBmdc0v7w1Ahy7DE_wWzOMOA6JPq6qUvoIuz51I7LCLLhXUNeLXpELuXzREKqSbgZJb2KaZ67vbFYEM4dt8s67SKWfMv5KK7OPY6v0zB529m3r5H0wfvNOH7PNw782q9AmOSZc62yXCKijBNP-7XKsrzbK2LneVn8z_wDLJ3xjs7frppkQ0f-YAk3xmg8JJnPWDleLm4FUx32F2_MwPlN227ThgASi2N8jtRpkUgNFnOkBScDhEwpT5zqJK9H09pTkUIWdDCB7H5er0HR9qBK509qif4b9UGl1OHMnjQKyFQT36c5nGJCG05E0IRH8Mbax37Wv94Eb_53rpJwEWv_XkuT-N_wPEwf92VvwCUhoHxTK9a-p78NfCuroRQWARk4gdhZ9i_rCgQQEzlEk9EsiFl_bTcBgT7bU');
        response.setHeader('accept', 'application/json');
        response.setHeader('Content-Type', 'application/json');
        
        response.setBody('"{\"start\":{\"dateTime\":\"2022-09-05T11:30:20.9830000\",\"timeZone\":\"UTC\"},\"end\":{\"dateTime\":\"2022-09-12T11:30:20.9830000\",\"timeZone\":\"UTC\"},\"emailAddress\":{\"name\":\"sbonelo ngcobo\",\"address\":\"sbonelo48@13ldv0.onmicrosoft.com\"},\"createdDateTime\":\"2022-09-05T11:30:35.5840498Z\",\"lastModifiedDateTime\":\"2022-09-05T11:30:35.8184071Z\"}"');
        response.setStatusCode(201);
        return response;
        } else {
            System.assert(false, 'unexpected endpoint ' + request.getEndpoint());
            return null;
        }
        // Create a fake response
        
    }
}