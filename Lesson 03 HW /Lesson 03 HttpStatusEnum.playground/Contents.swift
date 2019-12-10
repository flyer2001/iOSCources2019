//Реализовать перечисление кодов состояния http (10 любых) с исходным значением кода ошибки и хранимым значением описания ошибки

import UIKit


enum HTTPStatusCode: Int {
    case badRequest = 400
    case unauthorized = 401
    case paymentRequired = 402
    case forbidden = 403
    case notFound = 404
    case methodNotAllowed = 405
    case notAcceptable = 406
    case proxyAuthenticationRequired = 407
    case requestTimeout = 408
    case conflict = 409
    case gone = 410
    case undefine = 411
        

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

       
HTTPStatusCode.badRequest.rawValue // 400
HTTPStatusCode.badRequest.errorMsg // "Bad Request"


