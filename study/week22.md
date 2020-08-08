# chapter 1 - Hello RxSwift!


## RxSwift 란?

**RxSwift** 는 관측 가능한 시퀀스 및 기능 스타일 연산자를 사용하여 비동기 및 이벤트 기반 코드를 구성하기 위한 라이브러리로서 스케줄러를 통한 매개변수화된 실행이 가능하다.

RxSwift는 본질적으로 당신의 코드가 새로운 데이터에 반응하여 순차적으로 격리된 방식으로 처리할 수 있도록 함으로써 **비동기** 프로그램 개발을 단순화한다.

> By Marin Todorov. ‘RxSwift - Reactive Programming with Swift.’ Apple Books. 

<br/>

## 비동기 처리란❓

- 버튼 탭으로 작동
- 키보드를 텍스트 필드로 애니메이션화하면 포커스가 손실됨
- 인터넷에서 큰 사진 다운로드
- 디스크에 데이터 비트 저장
- 오디오 재생 중

이 모든 일들은 겉으로 보기에 동시에 일어난다.     
iOS는 다른 스레드에서 다른 작업을 수행하고 장치 CPU의 다른 코어에 걸쳐 작업을 수행할 수 있는 모든 종류의 API를 제공한다.

그러나 실제로 병렬로 실행되는 코드를 쓰는 것은 다소 복잡하다.     
어떤 코드가 먼저 데이터를 업데이트하는지, 어떤 코드가 최신 값을 읽는지에 대해서는 논쟁하기 어렵다.

<br/>

### Cocoa and UIKit Asynchronous APIs

애플에서 제공하는 iOS 비동기 코드 작성 API 는 다음과 같다.

1.  NotificationCenter 
    > 특정 이벤트가 발생할 때마다 코드 실행.

2. The delegate pattern
    > 특정 시간에 다른 클래스 또는 API에서 실행할 메소드를 정의.

3. Grand Central Dispatch
    > 순차적으로 실행되도록 코드를 예약하거나, 우선순위가 다른 여러 대기열에서 여러 태스크를 동시에 실행.

4. Closures
    > 클래스 간에 전달할 수 있는 코드. 각 클래스가 실행 여부를 결정할 수 있도록 하고, 몇 번 실행할지, 어떤 맥락에서 실행할지 결정.


모든 UI 구성 요소는 본질적으로 비동기적이기 때문에, 앱 코드 전체가 어떤 순서로 실행될 것인지 추측할 수 없다.   
결국, 앱 코드는 다양한 외부 요인에 따라 완전히 다른 순서로 실행될 수 있다. 

<br/>

## 비동기 용어 정리

1.  State

2. Imperative programming (명령형 프로그래밍)

3. Side effects

4. Declarative code (선언적 코드)

    - 명령형 프로그래밍에서 마음대로 state를 바꾼다. 
    - 함수에서 side effect 를 발생시키지 않는다. 
    - rxswift 에서 위 두가지 좋은 점을 결합한다. 

5. Reactive systems 

    - responsive : UI 최신 상태 유지
    - resilient : 각 행동은 독립적이고 유연하다
    - elastic : 다양한 workload 처리 
    - message driven 
    
<br/>

## Foundation of RxSwift

RxSwift 의 세 가지 키워드는 `observables`, `operators`, `schedulers` 이다.

### 1. `Observables`

`Observable<T>` 클래스는 Rxcode의 기초이다.     
`observer` 가 실시간으로 어떤 이벤트에 반응하여 앱 UI를 업데이트하거나, 새 데이터와 수신 데이터를 처리하고 활용할 수 있도록 한다. 

`ObservableType` 프로토콜은 매우 단순하다. 3가지 타입의 이벤트를 받을 수 있다.

1. `next`

    - 최신이나 다음 데이터를 가져온다. 

2. `completed`

    -  이벤트가 성공적으로 이루어 졌음을 의미한다. 

3. `error`

    - 에러가 발생했음을 의미한다. 
    

<br/>

### 2. `Opeartors`

`operators` 는 대부분 비동기식 입력을 취한다. 부작용을 일으키지 않고 출력만 하기 때문에 퍼즐 조각처럼 쉽게 맞춰 쉽게 결합할 수 있다. 

<br/>

### 3. `Schedulers`

`schedulers` 는 `dispatch queue` 와 비슷한 개념이지만 사용하기 더 쉽다. 

<img src="./screenshots/chap01_2.png" width="400">

