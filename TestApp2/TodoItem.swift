//
//  TodoItem.swift
//  TestApp2
//
//  Created by 이현호 on 2021/12/10.
//

import Foundation

struct TodoItem: Encodable, Decodable {
    let title: String
    let description: String
    let importance: String
    var isCompleted: Bool = false
}
