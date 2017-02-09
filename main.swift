import GraphQL

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
let query = "{ hello }"
let result = try graphql(schema: schema, request: query)
print(result)
