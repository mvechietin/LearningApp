//
//  APIService.swift
//  Animations
//
//  Created by Matheus Gustavo dos Santos Vechietin on 22/04/2018.
//  Copyright © 2018 Matheus Gustavo dos Santos Vechietin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class APIService: NSObject {
    let query = "dogs"
    lazy var endPoint: String = {
        return "https://api.flickr.com/services/feeds/photos_public.gne?format=json&tags=\(self.query)&nojsoncallback=1#"
    }()
        
    enum Result <T>{
        case Success(T)
        case Error(String)
    }
    
    func getDataWith(completion: @escaping (Result<[[String: AnyObject]]>) -> Void) {
        guard let url = URL(string:endPoint ) else { return completion(.Error("URL Invalida, impossível atualizar feed")) }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else { return completion(.Error(error!.localizedDescription)) }
            guard let data = data else { return completion(.Error(error?.localizedDescription ?? "Sem itens pra exibir"))
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [String: AnyObject] {
                    guard let itemsJsonArray = json["items"] as? [[String: AnyObject]] else {
                        return completion(.Error(error?.localizedDescription ?? "Sem itens pra exibir"))
                    }
                    DispatchQueue.main.async {
                        completion(.Success(itemsJsonArray))
                    }
                }
            } catch let error {
                return completion(.Error(error.localizedDescription))
            }
            }.resume()
    }
}
