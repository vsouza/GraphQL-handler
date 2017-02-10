# GraphQL-handler

> Swift GraphQL Handler

[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]

A simple handler implementation of GraphQL using [Perfect](http://perfect.org)


## How it works?

A simple route with a `indexHandler` call when `GET` on `/graphql` route.

```swift
routes.add(method: .get, uri: "/graphql", handler: indexHandler)
```

Define your schema with `RootQueries`, `RootMutations` e etc...

```swift
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
```

Execute graphql request:

```swift
let result = try graphql(schema: schema, request: query)
```

__[GraphQL library](https://github.com/GraphQLSwift/GraphQL)__ returns a `map`
by default, to get a JSON you should use `result.description` like @paulofaria
says here:
[#1](https://github.com/GraphQLSwift/GraphQL/issues/1#issuecomment-257182572)



## Usage example

`make run`

listen on `:8080`

`http://localhost:8080/graphql?query={hello}`


## Release History

* 0.0.1
    * Simple handler with basic schema

## Meta

Vinicius Souza – [@iamvsouza](https://twitter.com/iamvsouza) – hi@vsouza.com

Distributed under the MIT license. See [License](http://vsouza.mit-license.org/)

[https://github.com/vsouza](https://github.com/vsouza/)

[swift-image]:https://img.shields.io/badge/swift-3.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
