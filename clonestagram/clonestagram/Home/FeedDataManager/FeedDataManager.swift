//
//  FeedDataManager.swift
//  clonestagram
//
//  Created by 이규빈 on 2022/05/15.
//

import Alamofire

class FeedDataManager {
    func FeedDataManager(_ parameters : FeedAPIInput, _ viewController : HomeViewController) {
        AF.request("https://api.thecatapi.com/v1/images/search", method: .get, parameters: parameters).validate().responseDecodable(of: [FeedModel].self) { response in
            switch response.result {
            case .success(let result):
                //print("success")
                viewController.successAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
