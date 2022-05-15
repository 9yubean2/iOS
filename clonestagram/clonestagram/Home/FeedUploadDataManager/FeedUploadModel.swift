//
//  FeedUploadModel.swift
//  clonestagram
//
//  Created by 이규빈 on 2022/05/16.
//

struct FeedUploadModel : Decodable {
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : FeedUploadResult?
}

struct FeedUploadResult : Decodable {
    var postIdx : Int?
}
