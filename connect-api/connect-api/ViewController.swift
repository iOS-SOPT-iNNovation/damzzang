//
//  ViewController.swift
//  connect-api
//
//  Created by 최은지 on 24/04/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let urlString = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty?sidoName="
    
    let urlString2 = "&pageNo=1&numOfRows=10&ServiceKey=g5wuVXrLzJMBI9kR2gmdXm6ltsn0zYEicoOG7g2xNHZnGZVp9v7znsIO45M2l7R6rlE5wiD%2FjtIZupMYvyN2Pg%3D%3D&ver=1.3&_returnType=json"
    
    @IBOutlet weak var misaeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var aqiDataSet = [AqiResponseString]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func callMisaeAPI(_ sender: UIButton) {
        
        let region = "서울"
        let encodeRegion = makeStringKoreanEncoded(region)
        let encodeURL = urlString + encodeRegion + urlString2
//        print(encodeURL)
        let url = URL(string: encodeURL)!
        
        do {
            let responseString = try String(contentsOf: url)
//            print(responseString)
            
            guard let data = responseString.data(using: .utf8) else { return }
            
            do {
                let decoder = JSONDecoder()
//                print(data)
                let object = try decoder.decode(AqiResponseString.self, from: data)
//                print(object.list)
                
                self.aqiDataSet = [object] as! [AqiResponseString]
//                print(self.aqiDataSet[0].list![1])
                
                self.misaeLabel.text = self.aqiDataSet[0].list![0].pm25Value
                self.dateLabel.text = self.aqiDataSet[0].list![0].dataTime
                
                
                
//                print(self.aqiDataSet[0].arpltnInforInqireSVCVo?.pm25Value)
//                self.aqiDataSet = [object]
//                print(aqiDataSet[0])
                
                
            } catch (let err) {
                print(err.localizedDescription)
            }
  
            
        } catch let e as NSError {
            print(e.localizedDescription)
        }
        
    }
    
    // 한글 인코딩
    func makeStringKoreanEncoded(_ string: String) -> String {
        return string.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) ?? string
    }
    
    func jsonToObject(json: Data){
        do{
            let db = try JSONDecoder().decode([AqiResponseString].self, from: json)
            print(db)
        } catch let jsonErr {
            print(jsonErr)
        }
    }
    
    
}

