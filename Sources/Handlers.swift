import PerfectLib
import PerfectHTTP
import GraphQL



func indexHandler(request: HTTPRequest, _ response: HTTPResponse) {

    if let query = request.param(name: "query"){
        do {
            let schema = try GraphQLSchema(
                query: GraphQLObjectType(
                    name: "RootQueryType",
                    fields: [
                        "hello": GraphQLField(
                            type: GraphQLString,
                            resolve: { _ in "world" }
                        )
                    ]
                )
            )
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
