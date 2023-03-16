import ballerina/http;

configurable string url = ?;

service / on new http:Listener(9090) {

    resource function post invoke(@http:Payload xml payload) returns xml|error {
        http:Client httpEp = check new (url = "url", config = {
        httpVersion: "1.1"
    });

    xml postResponse = check httpEp->post(path = "", message = payload, headers = {"Content-Type": "application/soap+xml"});

    return postResponse;
   
    }
}
