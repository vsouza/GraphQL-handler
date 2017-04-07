import GraphQL

extension User : MapFallibleRepresentable {}

let UserType =  try! GraphQLObjectType(
    name: "User",
    description: "A user in system",
    fields:[
        "id": GraphQLField(
            type: GraphQLString,
            description: "The id of the id."
        ),
        "name": GraphQLField(
            type: GraphQLString,
            description: "The name of the name."
        ),
        "email": GraphQLField(
            type: GraphQLString,
            description: "The email of the user."
        ),
    ]
)

let QueryType = try! GraphQLObjectType(
    name: "Query",
    fields: [
        "user": GraphQLField(
            type: UserType,
            args: [
                "id": GraphQLArgument(
                    type: GraphQLString,
                    description: "Get user by ID"
                )
            ],
            resolve: { _, arguments, _, _ in
                return getUser(id: arguments["id"].string!)
            }
        ),
    ]
)

let UserSchema = try! GraphQLSchema(
    query: QueryType,
    types: [UserType]
)