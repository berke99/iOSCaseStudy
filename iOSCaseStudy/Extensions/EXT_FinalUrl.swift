//
//  EXT_FinalUrl.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 23.05.2025.
//

import Foundation

extension Endpoint {
    var url: URL {
        guard let url = URL(string: baseUrl + path) else {
            fatalError("Invalid URL")
        }
        return url
    }
}
