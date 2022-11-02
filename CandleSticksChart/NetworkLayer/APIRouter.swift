//
//  APIRouter.swift
//  CandleSticksChart
//
//  Created by Geddawy on 01/11/2022.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    case currencyDate(_ symbol: String, _ interval: String, _ limit: String )
    
    // MARK: - HttpMethod
    private var method: HTTPMethod {
        switch self{
        case .currencyDate
            :
            return .get
        default:
            return .post
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .currencyDate:
            return ""
        default:
            return ""
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .currencyDate(let symbol, let interval, let limit):
            return ["symbol": symbol, "interval": interval, "limit": limit]
        default:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try URLs.url.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP method
        urlRequest.httpMethod = method.rawValue
        
        // Headers
        switch self {
        default:
            break
        }

        print(urlRequest.allHTTPHeaderFields ?? "")
        // HTTP Body
        let httpBody: Data? = {
            switch self {
            default:
                return nil
            }
        }()
        
        urlRequest.httpBody = httpBody
        
        // Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get, .delete:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        print(try encoding.encode(urlRequest, with: parameters))
        return try encoding.encode(urlRequest, with: parameters)
    }
}
//MARK:- encodeToJSON
extension APIRouter {
    private func encodeToJSON<T: Encodable>(_ body: T) -> Data? {
        do {
            let anyEncodable = AnyEncodable(body)
            let jsonData = try JSONEncoder().encode(anyEncodable)
            let jsonString = String(data: jsonData, encoding: .utf8)!
            print(jsonString)
            return jsonData
        } catch {
            print(error)
            return nil
        }
    }
}

// type-erasing wrapper
struct AnyEncodable: Encodable {
    private let _encode: (Encoder) throws -> Void
    public init<T: Encodable>(_ wrapped: T) {
        _encode = wrapped.encode
    }
    func encode(to encoder: Encoder) throws {
        try _encode(encoder)
    }
}
