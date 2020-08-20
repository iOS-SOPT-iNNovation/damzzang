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


/*:
 # PublishSubject
 */

let disposeBag = DisposeBag()

enum MyError: Error {
   case error
}

let subject = PublishSubject<String>()
// publish subject : 구독 이후에 전달되는 새로운 이벤트만 구독자로 전달함

subject.onNext("Hello") // subject 로 next 이벤트 전달 (구독 전 이벤트 )

// 구독자 추가
let o1 = subject.subscribe { print(" >> 1", $0) }
o1.disposed(by: disposeBag)

subject.onNext("RxSwift") // 이벤트 전달


// 구독자 추가
let o2 = subject.subscribe{ print(" >> 2", $0) }
o2.disposed(by: disposeBag)

subject.onNext("Subject") // 이벤트 전달


subject.onCompleted()
//subject.onError(MyError.error)


// subject 가 완료된 이후에 구독자 추가
let o3 = subject.subscribe{ print(" >> 3", $0) }
o3.disposed(by: disposeBag)
// 종료 이후에 구독되었으므로 전달할 Next 이벤트가 없기 때문에 바로 completed 이벤트를 전달해 종료 시킴

