//
//  PostData.swift
//  Assignment-SwiftUI
//
//  Created by Unthinkable-mac-0040 on 11/06/21.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {   // id is important to make Post obey Identifiable Protocol
        return objectID
    }
    let objectID: String  //object id is different from id as it is fetched from Api and can't be renamed to id
    let points: Int
    let title: String
    let url: String?
}
