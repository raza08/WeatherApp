/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct List : Codable,Hashable {
    
    static func == (lhs: List, rhs: List) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
	let id : Int?
	let name : String?
	let coord : Coord?
	let main : Main?
	let dt : Int?
	let wind : Wind?
	let sys : Sys?
	let rain : String?
	let snow : String?
	let clouds : Clouds?
	let weather : [Weather]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case coord = "coord"
		case main = "main"
		case dt = "dt"
		case wind = "wind"
		case sys = "sys"
		case rain = "rain"
		case snow = "snow"
		case clouds = "clouds"
		case weather = "weather"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		coord = try values.decodeIfPresent(Coord.self, forKey: .coord)
		main = try values.decodeIfPresent(Main.self, forKey: .main)
		dt = try values.decodeIfPresent(Int.self, forKey: .dt)
		wind = try values.decodeIfPresent(Wind.self, forKey: .wind)
		sys = try values.decodeIfPresent(Sys.self, forKey: .sys)
		rain = try values.decodeIfPresent(String.self, forKey: .rain)
		snow = try values.decodeIfPresent(String.self, forKey: .snow)
		clouds = try values.decodeIfPresent(Clouds.self, forKey: .clouds)
		weather = try values.decodeIfPresent([Weather].self, forKey: .weather)
	}

}
