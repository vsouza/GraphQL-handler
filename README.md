# GraphQL Handler

> Swift GraphQL Handler

[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]
[![codebeat badge](https://codebeat.co/badges/1c0f9ac0-84e2-4c1d-96ef-5c0094bca263)](https://codebeat.co/projects/github-com-vsouza-graphql-handler-master)

A simple handler implementation of GraphQL using [Perfect](http://perfect.org)


## How it works?

A simple route with a `indexHandler` call when `GET` on `/graphql` route.

```swift
routes.add(method: .get, uri: "/graphql", handler: indexHandler)
```

Define your schema with `RootQueries`, `RootMutations`, `CustomTypes` e etc...

```swift
let UserType =  try! GraphQLObjectType(
    name: "User",
    description: "A user in system",
    fields:[
        "id": GraphQLField(
            type: GraphQLNonNull(GraphQLString),
            description: "The id of the user."
        ),
        "name": GraphQLField(
            type: GraphQLString,
            description: "The name of the user."
        ),
        "email": GraphQLField(
            type: GraphQLString,
            description: "The email of the user."
        ),
    ]
)
```

In handler you will call the GraphQL parser:

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

`http://localhost:8080/graphql?query=query{user(id: "3000"){id,name,email}}`


## Release History

* 0.0.2
    * Improve Schema and add sample data
* 0.0.1
    * Simple handler with basic schema

## Meta

Vinicius Souza – [@iamvsouza](https://twitter.com/iamvsouza) – hi@vsouza.com

Distributed under the MIT license. See [License](http://vsouza.mit-license.org/)

[https://github.com/vsouza](https://github.com/vsouza/)

[swift-image]:https://img.shields.io/badge/swift-4.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
