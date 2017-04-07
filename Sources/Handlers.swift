import PerfectLib
import PerfectHTTP
import GraphQL


// indexHandler 
func indexHandler(request: HTTPRequest, _ response: HTTPResponse) {
    // check "query" param on query string
    if let query = request.param(name: "query"){
        do {
            let schema = UserSchema
            // call graphql query parser
            let result = try graphql(schema: schema, request: query)
            response.setHeader(.contentType, value: "application/json")
            response.appendBody(string: result.description)
            response.completed()
        } catch {
            response.status = .internalServerError
            response.completed()
        }
    }
    response.status = .badRequest
    response.completed()
}
