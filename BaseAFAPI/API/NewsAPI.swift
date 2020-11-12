//
//  NewsAPI.swift
//  BaseAFAPI
//
//  Created by ManhLD on 11/12/20.
//

import Foundation
import Alamofire

struct NewsAPI: APIClient {
    
    typealias Model = NewsResponse
    
    var paramss : [String : Any] = [:]
    
    var params: [String : Any] {
        return paramss
    }
    
    var environment: Environment {
        return DefaultEnvironment()
    }
    
    var path: String {
        return "listNews"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var header: [String : String] {
        return ["Authorization" : ""]
    }
    
}

struct NewsResponse: Decodable {
    
    var status: Int?
    var response: News?
    
    enum CodingKeys: String, CodingKey {
        case response
        case status
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decode(Int.self, forKey: .status)
        response = try container.decodeIfPresent(News.self, forKey: .response)
    }
}

struct News: Decodable {
    
    var news: [NewsModel]?
    
    enum CodingKeys: String, CodingKey {
        case news
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        news = try container.decode([NewsModel].self, forKey: .news)
    }
}
