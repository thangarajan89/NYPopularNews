/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

import Foundation
struct Results: Codable {
	let url: String?
	let adxKeywordswords: String?
	let column: String?
	let section: String?
	let byline: String?
	let type: String?
	let title: String?
	let abstract: String?
	let publishedDate: String?
	let source: String?
	let id: Int?
	let assetId: Int?
	let views: Int?
//    let desFacet: [String]?
//    let orgFacet: [String]?
//    let perFacet: [String]?
//    let geoFacet: String?
	let media: [Media]?

	enum CodingKeys: String, CodingKey {

		case url = "url"
		case adxKeywordswords = "adx_keywords"
		case column = "column"
		case section = "section"
		case byline = "byline"
		case type = "type"
		case title = "title"
		case abstract = "abstract"
		case publishedDate = "published_date"
		case source = "source"
		case id = "id"
		case assetId = "asset_id"
		case views = "views"
//        case desFacet = "des_facet"
//        case orgFacet = "org_facet"
//        case perFacet = "per_facet"
//        case geoFacet = "geo_facet"
		case media = "media"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		adxKeywordswords = try values.decodeIfPresent(String.self, forKey: .adxKeywordswords)
		column = try values.decodeIfPresent(String.self, forKey: .column)
		section = try values.decodeIfPresent(String.self, forKey: .section)
		byline = try values.decodeIfPresent(String.self, forKey: .byline)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		abstract = try values.decodeIfPresent(String.self, forKey: .abstract)
		publishedDate = try values.decodeIfPresent(String.self, forKey: .publishedDate)
		source = try values.decodeIfPresent(String.self, forKey: .source)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		assetId = try values.decodeIfPresent(Int.self, forKey: .assetId)
		views = try values.decodeIfPresent(Int.self, forKey: .views)
//        desFacet = try values.decodeIfPresent([String].self, forKey: .desFacet)
//        orgFacet = try values.decodeIfPresent([String].self, forKey: .orgFacet)
//        perFacet = try values.decodeIfPresent([String].self, forKey: .perFacet)
//        geoFacet = try values.decodeIfPresent(String.self, forKey: .geoFacet)
		media = try values.decodeIfPresent([Media].self, forKey: .media)
	}

}
