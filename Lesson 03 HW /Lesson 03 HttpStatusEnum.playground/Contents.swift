//Реализовать перечисление кодов состояния http (10 любых) с исходным значением кода ошибки и хранимым значением описания ошибки

import UIKit


enum HTTPStatusCode {
    case badRequest
    case unauthorized
    case paymentRequired
    case forbidden
    case notFound
    case methodNotAllowed
    case notAcceptable
    case proxyAuthenticationRequired
    case requestTimeout
    case conflict
    case gone
    case undefine
        
    var errorMsg: String {
        switch self {
            case .badRequest:
                return "400 Bad Request"
            case .unauthorized:
                return "401 Unauthorized"
            case .paymentRequired:
                return "402 Payment Required"
            case .forbidden:
                return "403 Forbidden"
            case .notFound:
                return "404 notFound"
            case .methodNotAllowed:
                return "405 Method not allowed"
            case .notAcceptable:
                return "406 Not acceptable"
            case .proxyAuthenticationRequired:
                return "407 Proxy authentication required"
            case .requestTimeout:
                return "408 Request timout"
            case .conflict:
                return "409 Conflict"
            case .gone:
                return "410 Gone"
            case .undefine:
                return "411 Undefine"
                }
    }
}

       
let status = HTTPStatusCode.badRequest.errorMsg

