import Foundation
import ObjectMapper

struct BaseObjectMapper : Mappable {
	var content : [Content]?
	var totalPages : Int?
	var totalElements : Int?
	var last : Bool?
	var numberOfElements : Int?
	var first : Bool?
	var sort : String?
	var size : Int?
	var number : Int?

	init?(map: Map) {

	}
    
    init() {}

	mutating func mapping(map: Map) {

		content <- map["content"]
		totalPages <- map["totalPages"]
		totalElements <- map["totalElements"]
		last <- map["last"]
		numberOfElements <- map["numberOfElements"]
		first <- map["first"]
		sort <- map["sort"]
		size <- map["size"]
		number <- map["number"]
	}

}
