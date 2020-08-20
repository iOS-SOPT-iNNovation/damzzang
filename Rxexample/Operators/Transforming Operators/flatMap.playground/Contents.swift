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
 # flatMap
 */

// 원본 observable 이 방출하는 항목을 새로운 observable 로 변환함
// 새로운 observable 은 항목이 update 될 때마다 새로운 항목을 방출함

// 최종적으로 하나의 observable 로 합쳐지고 모든 항목들이 이 observable 을 통해서 구독자로 전달됨
// 단순히 처음에 방출된 항목만 구독자로 전달되는 것이 아니라 update 된 최신 항목도 구독자에게 전달됨
// 네트워크를 요청을 구현할 때 주로 활용됨

let disposeBag = DisposeBag()

let a = BehaviorSubject(value: 1)
let b = BehaviorSubject(value: 2)

let subject = PublishSubject<BehaviorSubject<Int>>()

subject
    .flatMap{ $0.asObservable() } // subject 를 observable 로 변환
    .subscribe { print($0) }
    .disposed(by: disposeBag)

subject.onNext(a)
subject.onNext(b)

a.onNext(11) // update
b.onNext(22) // update
