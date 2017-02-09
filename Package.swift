import PackageDescription

let package = Package(
    name: "GraphQL-handler",
    dependencies: [
        .Package(url: "https://github.com/GraphQLSwift/GraphQL.git", majorVersion: 0, minor: 2),
    ]
)
