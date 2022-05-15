//
//  UserFeedDataManager.swift
//  clonestagram
//
//  Created by 이규빈 on 2022/05/16.
//

import Alamofire

class UserFeedDataManager {
    func getUserFeed(_ viewController : ProfileViewController, _ userID: Int = 2) {
        AF.request("https://edu-api-ios-test.softsquared.com/users/\(userID)",
                   method: .get,
                   parameters: nil)
        .validate()
        .responseDecodable(of: UserFeedModel.self) { response in
            switch response.result {
            case .success(let result):
//                print("DEBUG: ",result)
                viewController.succesFeedAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func deleteUserFeed(_ viewController : ProfileViewController, _ postIdx: Int ) {
        AF.request("https://edu-api-ios-test.softsquared.com/posts/\(postIdx)/status",
                   method: .patch,
                   parameters: nil)
        .validate()
        .responseDecodable(of: DeleteUserFeed.self) { response in
            switch response.result {
            case .success(let result):
                print("PATCH: ",result)
                viewController.successDeletePostAPI(result.isSuccess ?? false)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
