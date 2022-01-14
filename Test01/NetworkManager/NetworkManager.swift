//
//  NetworkManager.swift
//  Test01
//
//  Created by Max Pavlov on 9.01.22.
//

import Foundation
import Alamofire

let token = "tkyurgtkelk6u3631ed5v2iheg121v7jwrsjg0ep"
var headers = ["Authorization": "Bearer " + token]

class NetworkManager: NSObject {
   static let shared = NetworkManager()
    private override init(){}
    func getData(completion: @escaping ([MainModel]) -> Void) {
        request("https://api.json-generator.com/templates/L9JuSpxCwx0p/data", method: .get, parameters: [:], headers: headers).responseJSON { result in
            switch result.result {
            case .success(_):
                guard let data = result.data else { return }
                do {
                    let decode = try JSONDecoder().decode([MainModel].self, from: data)
                    completion(decode)
                } catch let error {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
