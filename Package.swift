import PackageDescription

let package = Package(
    name: "GraphQLHandler",
    dependencies: [
        .Package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", majorVersion: 2, minor: 0),
        .Package(url: "https://github.com/GraphQLSwift/GraphQL.git", majorVersion: 0, minor: 2)
    ]
)
