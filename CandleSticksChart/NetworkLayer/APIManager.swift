//
//  APIManager.swift
//  CandleSticksChart
//
//  Created by Geddawy on 01/11/2022.
//

import Alamofire

class APIManager {
    static func confirmPayMob(symbole: String, interval: String, limit: String ,completion: @escaping (Result<ChartDataResponse, Error>, _ code: Int?) -> ()){
        request(APIRouter.currencyDate(symbole, interval, limit)){
            response, code in
            completion(response, code)
        }
    }
}
extension APIManager {
    
    // MARK:- The request function to get results in a closure
    internal static func request<T: Decodable>(_ urlConvertible: URLRequestConvertible, completion:  @escaping (Result<T, Error>, _ code: Int?) -> ()) {
        // Trigger the HttpRequest using AlamoFire
        AF.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
            switch response.result {
            case .success(let value):
                completion(.success(value), response.response?.statusCode)
            case .failure(let error):
                completion(.failure(error), response.response?.statusCode)
            }
        }
        .responseJSON { response in
            print(response)
            print(response.response?.statusCode)
        }
    }
}
