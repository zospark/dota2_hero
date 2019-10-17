//
//  HeroService.swift
//  ListHero
//
//  Created by developer team on 17/10/2562 BE.
//  Copyright © 2562 developer team. All rights reserved.
//

import Foundation

class HeroService {
    
    func getAll(completion: @escaping ([Hero]?, Error?) -> ()) {
        let service = Service()
        service.setURL = "https://peerapongsam.github.io/heropedia/json/english/heroes.json"
        service.getData(method: .get, success: { (data) in
            
            guard let data = data as? Data else {
                print("cast data error , ")
                return
                
            }
            do {
                let heros = try JSONDecoder().decode([Hero].self, from: data )
                DispatchQueue.main.async {
                    completion(heros, nil)
                }
            } catch {
                print("Failed decode : ", error)
            }
        }) { (error) in
            if let error = error {
                completion(nil, error)
                print("Failed to fetch hero:", error)
                return
            }
        }
    }
    
}
