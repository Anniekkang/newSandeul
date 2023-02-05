//
//  URL.swift
//  Sandeul
//
//  Created by 나리강 on 2023/02/04.
//

import Foundation

enum Endpoint {
    static let mountainURL = "http://openapi.forest.go.kr/openapi/service/trailInfoService/getforeststoryservice?ServiceKey=\(APIKey.mountainKey)"
    static let firstRequest  = "&pageNo=1&numOfRows=300"
    static let secondRequest = "&pageNo=2&numOfRows=300"
    static let thirdRequest = "&pageNo=3&numOfRows=300"
    static let fourthRequest = "&pageNo=4&numOfRows=438"
    
}
