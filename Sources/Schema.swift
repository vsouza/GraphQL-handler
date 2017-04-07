import GraphQL

extension User : MapFallibleRepresentable {}

let UserType =  try! GraphQLObjectType(
    name: "User",
    description: "A user in system",
    fields:[
        "id": GraphQLField(
            type: GraphQLString,
            description: "The id of the character."
        ),
        "name": GraphQLField(
            type: GraphQLString,
            description: "The id of the character."
        ),
        "email": GraphQLField(
            type: GraphQLString,
            description: "The id of the character."
        ),
    ],
    isTypeOf: { source, _, _ in
        source is User
    }
)

let QueryType = try! GraphQLObjectType(
    name: "Query",
    fields: [
        "user": GraphQLField(
            type: UserType,
            args: [
                "id": GraphQLArgument(
                    type: GraphQLString,
                    description:
                    "If omitted, returns the hero of the whole saga. If " +
                    "provided, returns the hero of that particular episode."
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