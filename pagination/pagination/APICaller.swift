//
//  APICaller.swift
//  pagination
//
//  Created by 최은지 on 2020/08/20.
//  Copyright © 2020 최은지. All rights reserved.
//

import Foundation

class APICaller {
    var isPaginating = false
    
    func fetchData(pagination:Bool = false, completion: @escaping (Result<[String], Error>) -> Void){
        
        if pagination {
            isPaginating = true
        }
        
        DispatchQueue.global().asyncAfter(deadline: .now() + (pagination ? 3 : 2) , execute: {
            let originalData = [
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
                "Apple",
                "Google",
                "Facebook",
            ]
            
            let newData = [
                "dam",
                "mbti",
                "cute"
            ]
            
            completion(.success(pagination ? newData : originalData))
            
            if pagination {
                self.isPaginating = false
            }
            
        })
    }
}
