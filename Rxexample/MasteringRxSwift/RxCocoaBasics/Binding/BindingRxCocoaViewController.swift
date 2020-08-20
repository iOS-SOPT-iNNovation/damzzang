//
//  Copyright (c) 2019 KxCoding <kky0317@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit
import RxSwift
import RxCocoa

class BindingRxCocoaViewController: UIViewController {
    
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var valueField: UITextField!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueLabel.text = ""
        valueField.becomeFirstResponder()
        
//        valueField.rx.text
//            .subscribe(onNext: { [weak self] str in
//                self?.valueLabel.text = str
//            })
//            .disposed(by: disposeBag)
        // 코드가 매우 간결해짐. delegate 사용하지 않으나 main thread 에서 실행되는 문제점이 발생
        
        // 해결 방법 1 -> DispatchQueue 사용
//                valueField.rx.text
//                    .subscribe(onNext: {[weak self] str in
//                        DispatchQueue.main.async {
//                            self?.valueLabel.text = str
//                        }
//                    })
//                    .disposed(by: disposeBag)
//
        
        // 해결 방법 2 -> MainScheduler 사용
//                valueField.rx.text
//                    .observeOn(MainScheduler.instance)
//                    .subscribe(onNext: {[weak self] str in
//                        DispatchQueue.main.async {
//                            self?.valueLabel.text = str
//                        }
//                    })
//                    .disposed(by: disposeBag)
//
        
        // 해결 방법 3 -> main thread 직접 지정하지 않음. 코드가 훨씬 간결화됨
        valueField.rx.text
            .bind(to: valueLabel.rx.text)
            .disposed(by: disposeBag)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        valueField.resignFirstResponder()
    }
}


/*
 data producer : Observable
 data consumer : UI Component
 
 binder : 에러 이벤트를 받지 않음
 binder 는 binding 이 main thread 에서 실행하는 것을 보장함
 */

