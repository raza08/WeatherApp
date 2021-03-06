/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Main : Codable {
	let temp : Double?
	let feels_like : Double?
	let temp_min : Double?
	let temp_max : Double?
	let pressure : Int?
	let humidity : Int?
	let sea_level : Int?
	let grnd_level : Int?
    var getTempCelcius: String?{
        get {
            return String(format: "%.0f", (self.temp ?? 0.0) - 273.15)
        }
    }
    
    var getTempFahrenhit: String?{
        get {
            return String(format: "%.0f", ((self.temp ?? 0.0) - 273.15) * 1.8 + 32)
        }
    }

    var getFeelsLikeCelcius: String?{
        get {
            return String(format: "%.0f", (self.feels_like ?? 0.0) - 273.15)
        }
    }
    var getFeelsLikeFahrenhit: String?{
        get {
            return String(format: "%.0f", ((self.feels_like ?? 0.0) - 273.15) * 1.8 + 32)
        }
    }


	enum CodingKeys: String, CodingKey {

		case temp = "temp"
		case feels_like = "feels_like"
		case temp_min = "temp_min"
		case temp_max = "temp_max"
		case pressure = "pressure"
		case humidity = "humidity"
		case sea_level = "sea_level"
		case grnd_level = "grnd_level"
	}


}
