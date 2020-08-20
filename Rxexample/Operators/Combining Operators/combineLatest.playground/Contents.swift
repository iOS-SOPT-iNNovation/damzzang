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
 # combineLatest
 */

// 연산자를 언제 배출하는 지 이해하는 것이 가장 중요!!
// 가장 마지막으로 방출되는 요소를 사용
// result observables : 연산자가 리턴하는 observables

let bag = DisposeBag()

enum MyError: Error {
    case error
}

let greetings = PublishSubject<String>()
let languages = PublishSubject<String>()

// 두 개의 observable 과 closure 를 파라미터로 받음
Observable.combineLatest(greetings, languages){ lhs, rhs -> String in
    return "\(lhs) \(rhs)"
}
    .subscribe { event in
        switch event {
        case .next(let s):
            print(s)
        case .error(_):
            break
            
        }
}
    .disposed(by: bag)

// greeting subject 로 이벤트를 전달했으나 language 에 전달되는 이벤트 없으므로 구독자에게 전달되는 이벤트도 없음
greetings.onNext("hi") // none.

// language subject 로 이벤트 전달 -> 구독자에게 이벤트 전달됨
languages.onNext("world!") // hi world
 
// 가장 최근에 방출된 요소를 대상으로 클로저 실행 -> 결과를 바로 구독자에게 전달
greetings.onNext("Hello") // Hello world

languages.onNext("RxSwift") // Hello RxSwift



// 아직 language subject 로 completed 이벤트가 전달되지 않아 구독자에게 completed 이벤트가 전달되지 않음
greetings.onCompleted()
languages.onNext("SwiftUI") // Hello SwiftUI


// 모든 observable 이 completed 이벤트 전달 -> 이 시점의 구독자에게 completed 이벤트 전달함
languages.onCompleted()

// source observable 중 하나라도 에러 이벤트를 전달하면 그 즉시 구독지에게 에러 이벤트를 전달하고 종료시킴
