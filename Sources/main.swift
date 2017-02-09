import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

let server = HTTPServer()


var routes = Routes()
routes.add(method: .get, uri: "/", handler: indexHandler)

server.addRoutes(routes)
server.serverPort = 8080

do {
    try server.start()
} catch PerfectError.networkError(let err, let msg) {
    print("Network error thrown: \(err) \(msg)")
}
