# Rxswift (2)

## Observable 

`Observer` 는 `Observable` 을 구독한다. 
`Observable` 이 이벤트를 발생시키는 것을 `emit` 한다고 한다.

### Observable 생성하기

두 가지 방법으로 생성할 수 있다. 

```swift
// #1
Observable<Int>.create { (observer) -> Disposable in
    observer.on(.next(0))
    observer.onNext(1)
    
    observer.onCompleted() // observable 종료
    
    return Disposables.create() // 메모리 정리
}

// #2
Observable.from([0,1]) // 순서대로 방출

```

<br/>


## Subject

`subject` 는 `observable` 과 `observer` 역할을 모두 할 수 있다.  즉 observable, subject 모두 
subscribe 할 수 있다.     

`AsyncSubject`, `PublishSubject`, `BehaviorSubject`, `ReplaySubject` 4가지 종류가 있다.  아래 예시는   `PublishSubject` 를 사용했다. 


```swift

let disposeBag = DisposeBag()

enum MyError: Error {
   case error
}

let subject = PublishSubject<String>()
// PublishSubject : 구독 이후에 전달되는 새로운 이벤트만 구독자로 전달함

subject.onNext("Hello") // subject 로 next 이벤트 전달 (구독 전 이벤트->프린트X)

// 구독자 o1 추가
let o1 = subject.subscribe { print(" >> 1", $0) }
o1.disposed(by: disposeBag)

subject.onNext("RxSwift") // 이벤트 전달


// 구독자 o2 추가
let o2 = subject.subscribe{ print(" >> 2", $0) }
o2.disposed(by: disposeBag)

subject.onNext("Subject") // 이벤트 전달


subject.onCompleted()


// subject 가 완료된 이후에 구독자 o3 추가
let o3 = subject.subscribe{ print(" >> 3", $0) }
o3.disposed(by: disposeBag)
// 종료 이후에 구독되었으므로 전달할 Next 이벤트가 없기 때문에 바로 completed 이벤트를 전달해 종료 시킴
```

실행 결과

```
>> 1 next(RxSwift)
>> 1 next(Subject)
>> 2 next(Subject)
>> 1 completed
>> 2 completed
>> 3 completed

```

`PublishSubject` 는 **구독 이후** 에 전달되는 새로운 이벤트만 구독자로 전달한다.     
위 예시에서는 

그러므로 구독 전 이벤트인  `Hello` 는 프린트 하지 않는다.

이후 `o1` 구독자 추가 하고, `RxSwift` 라는 이벤트를 전달  -> 구독자 o1에만 이벤트 전달    
이후 `o2` 구독자 추가하고, `Subject` 이벤트 전달 -> 구독자 o1, o2에 이벤트 전달     

`onCompleted()` 에 의해 종료한 이후 구독자를 추가하고 이벤트를 전달하면 종료 이후에 구독되었으므로 전달할 이벤트가 없으므로 바로 o1, o2, o3 구독자에게 completed 이벤트를 전달해 종료시킨다. 


<br/>

## Operator

많은 operator 종류가 있지만,, 간단히 몇개만 살펴보자

### 1. `just`

`just`는 **하나의 항목** 을 방출하는 `observable` 을 생성한다.

```swift
let disposeBag = DisposeBag()
let element = "😀"

Observable.just(element)
    .subscribe { event in print(event) }
    .disposed(by: disposeBag)


Observable.just([1, 2, 3])
    .subscribe { event in print(event) }
    .disposed(by: disposeBag)
```

```
next(😀)
completed
next([1, 2, 3])
completed
```

<br/>

### 2. `Of`

`of` 는 **두 개 이상** 의 요소를 방출한다. 

```swift
let disposeBag = DisposeBag()
let apple = "🍏"
let orange = "🍊"
let kiwi = "🥝"


Observable.of(apple, orange, kiwi)
    .subscribe { element in print (element)}
    .disposed(by: disposeBag)


Observable.of([1,2], [3,4], [5,6])
    .subscribe { element in print (element)}
    .disposed(by: disposeBag)
```

```
next(🍏)
next(🍊)
next(🥝)
completed
next([1, 2])
next([3, 4])
next([5, 6])
completed
```

<br/>

### 3. `From`

`from` 은  배열에 포함된 요소를 하나씩 순서대로 방출한다.

```swift
let disposeBag = DisposeBag()
let fruits = ["🍏", "🍎", "🍋", "🍓", "🍇"]

Observable.from(fruits)
    .subscribe{ element in print(element)}
    .disposed(by: disposeBag)
```

```
next(🍏)
next(🍎)
next(🍋)
next(🍓)
next(🍇)
completed
```

<br/>

### 4. `Filter`

```swift
let disposeBag = DisposeBag()
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


Observable.from(numbers)
    .filter { $0.isMultiple(of: 2)} // 구독자로 짝수만 리턴
    .subscribe{ print($0) }
    .disposed(by: disposeBag)
```

```
next(2)
next(4)
next(6)
next(8)
next(10)
completed
```

<br/>

### 5. `Flatmap`

원본 observable 이 방출하는 항목을 새로운 observable 로 변환한다. 새로운(변환된) observable 은 항목이 update 될 때마다 새로운 항목을 방출한다.    

단순히 처음에 방출된 항목만 구독자로 전달되는 것이 아니라 update 된 최신 항목도 구독자에게 전달된다.    
`Flatmap` 은 네트워크를 요청을 구현할 때 주로 활용된다.

```swift
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
```

```
next(1)
next(2)
next(11)
next(22)
```

