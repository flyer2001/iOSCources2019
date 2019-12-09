//Реализовать перечисление кодов состояния http (10 любых) с исходным значением кода ошибки и хранимым значением описания ошибки

import UIKit


struct HTTPStatusCode {
    var code: Int
    
    init(code: Int) {
        self.code = code
    }
    
    enum DescriptionOfStatus {
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
            return "Bad Request"
        case .unauthorized:
            return "Unauthorized"
        case .paymentRequired:
            return "Payment Required"
        case .forbidden:
            return "Forbidden"
        case .notFound:
            return "notFound"
        case .methodNotAllowed:
            return "Method not allowed"
        case .notAcceptable:
            return "Not acceptable"
        case .proxyAuthenticationRequired:
            return "Proxy authentication required"
        case .requestTimeout:
            return "Request timout"
        case .conflict:
            return "Conflict"
        case .gone:
            return "Gone"
        case .undefine:
            return "Undefine"
            }
       }
    }

    var description: DescriptionOfStatus {
        switch self.code {
        case 400:
            return .badRequest
        case 401:
            return .unauthorized
        case 402:
            return .paymentRequired
        case 403:
            return .forbidden
        case 404:
            return .notFound
        case 405:
            return .methodNotAllowed
        case 406:
            return .notAcceptable
        case 407:
            return .proxyAuthenticationRequired
        case 408:
            return .requestTimeout
        case 409:
            return .conflict
        case 410:
            return .gone
        default:
            return .undefine
        }
    }
}
    
let status = HTTPStatusCode(code: 400)
print(status.description.errorMsg)
