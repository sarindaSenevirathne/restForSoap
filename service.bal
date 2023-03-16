import ballerina/http;


service / on new http:Listener(9090) {

    resource function post greeting() returns xml|error {
        http:Client httpEp = check new (url = "https://www.dataaccess.com/webservicesserver/NumberConversion.wso", config = {
        httpVersion: "1.1"
    });
    xml payload = xml `<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <NumberToWords xmlns="http://www.dataaccess.com/webservicesserver/">
      <ubiNum>500</ubiNum>
    </NumberToWords>
  </soap:Body>
</soap:Envelope>`;
    xml postResponse = check httpEp->post(path = "", message = payload, headers = {"Content-Type": "application/soap+xml"});

    return postResponse;
   
    }
}
