//
//  NewsModel.swift
//  BaseAFAPI
//
//  Created by ManhLD on 11/12/20.
//

import Foundation
import RealmSwift

struct NewsModel: Decodable {
    var id: Int?
    var feed:  String?
    var title: String?
    var thumbImg: String?
    var detailUrl: String?
    var description: String?
    var author: String?
    var publishDate: String?
    var createdAt: String?
    var updateAt: String?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case feed
        case title
        case thumbImg = "thumb_img"
        case detailUrl = "detail_url"
        case description
        case author
        case publishDate = "publish_date"
        case createdAt = "created_at"
        case updateAt = "updated_at"
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        feed = try container.decode(String.self, forKey: .feed)
        title = try container.decode(String.self, forKey: .title)
        thumbImg = try container.decodeIfPresent(String.self, forKey: .thumbImg)
        detailUrl = try container.decodeIfPresent(String.self, forKey: .detailUrl)
        description = try container.decode(String.self, forKey: .description)
        author = try container.decode(String.self, forKey: .author)
        publishDate = try container.decodeIfPresent(String.self, forKey: .publishDate)
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        updateAt = try container.decodeIfPresent(String.self, forKey: .updateAt)
    }
    
    func toRealmObject() -> NewsRealm {
        let newRealm = NewsRealm()
        newRealm.id = id ?? 0
        newRealm.feed = feed ?? ""
        newRealm.author = author ?? ""
        newRealm.thumbImg = ""
        newRealm.publishdate = publishDate ?? ""
        newRealm.url = detailUrl ?? ""
        return newRealm
    }
}

class NewsRealm: Object {
    @objc dynamic var id = 0
    @objc dynamic var feed = ""
    @objc dynamic var title = ""
    @objc dynamic var thumbImg = ""
    @objc dynamic var author = ""
    @objc dynamic var publishdate = ""
    @objc dynamic var url = ""

}


