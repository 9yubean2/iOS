//
//  FeedUploadDataManager.swift
//  clonestagram
//
//  Created by 이규빈 on 2022/05/16.
//

import Alamofire

class FeedUploadDataManager {
    func posts(_ viewController : HomeViewController, _ parameter : FeedUploadInput){
        AF.request("https://edu-api-ios-test.softsquared.com/posts", method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: nil).validate().responseDecodable(of: FeedUploadModel.self) { response in
            switch response.result {
            case .success(let result):
                if result.isSuccess {
                    print("success")
                } else {
                    print(result.message)
                }
                    
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}