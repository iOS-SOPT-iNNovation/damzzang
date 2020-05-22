# Layout with XML (2)

xml 과 연결한 UI를 만들어보자❗️

> 사용 라이브러리 : [Layout](https://github.com/nicklockwood/layout)


## LayoutFileManager

먼저 xml 파일을 관리할  `LayoutFileManager`  구조체를 만들자

```swift
import Foundation
import Layout

struct LayoutFileManager {
    ...
}
```

파일 매니저 안을 차근차근히 채워보자 🤩🤩


## app 내의 document xml 링크 가져오기 

```swift
import Layout

static var url:URL? {
    // app document 파일 경로
    guard let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        else { return nil }
    
    var index=0
    var url:URL
    repeat{
        index+=1
        let name = "layout\(index)"
        let filePath = path.appending("/\(name).xml")
        url = URL(fileURLWithPath: filePath)
    } while FileManager.default.fileExists(atPath: url.path, isDirectory: nil)
    return url
}

// path 경로의 (document 경로) 에 해당하는 xml파일이 ^없으면^ url링크를 반환한다. 
// layout1.xml 이 존재하면 -> layout2.xml이 있는지 확인. 있으면 layout3 확인.. 
// 반복하다가 xml파일이 존재하지 않는 경우에 (새로 xml파일을 생성할 수 있을 때) 링크를 반환
```

```
file:///Users/eunji/Library/Developer/CoreSimulator/Devices/A6B010F6-54A4-4F63-8784-55BC398BD6F3/data/Containers/Data/Application/0D3B62ED-0C04-40CE-827C-7F494D1C73E6/Documents/layout462.xml
```

- `FileManager.default` : 기본적인 파일 directory 작업을 수행
- `NSSearchPathForDirectoriesInDomains` :  iOS 어플리케이션 내의 document 디렉토리 경로 확인이 가능하다. 


## write xml

```swift
    static func write(layoutString: String, to url:URL) -> Bool {
         do{
             try layoutString.write(to: url, atomically: true, encoding: .utf8)
             return true
         } catch {
             return false
         }
    }
```

- `[string값].write(to:url, atomically:true, encoding:true)` : 원하는 경로에 원하는 내용을 작성


## remove xml 

```swift
    static func remove(url: URL) -> Bool {
        do {
            try FileManager.default.removeItem(at: url)
            return true
        } catch {
            return false
        }
    }
```

- `FileManager.default.removeItem(at:url)` : 원하는 경로의 파일을 삭제 


<br/>

## Load XML to ViewController

document에 저장한 xml파일을 ViewController에서 불러오자 ❗️

```swift
import Layout

class ViewController: UIViewController, LayoutLoading {
    
    var url: URL? // xml url 
    
    func writeandLoadXML(XMLString: String) {
    
        url = LayoutFileManager.url // document 파일 경로 
        guard let url = url else { return }
        
        let isWrite = LayoutFileManager.write(layoutString: XMLString, to:url) // 해당 경로에 xml 작성 
        
        // loadLayout : VC에 xml파일 불러옴 (LayoutLibrary)
        DispatchQueue.main.async {
            self.loadLayout (
                withContentsOfURL: self.url!, // 파일 경로 
                state: [...],  
                constats: [...]
            )
        }
    }
}
```


### ⚠️ DispatchQueue

> 내가 몰라서 정리하는 디스패치큐 정리 ㅋㅎㅎ

1. task 를 비동기적으로 동시에 수행할 수 있는 방법 
2. FIFO 구조
3. Main dispatch queue : 앱의 main thread에서 실행하는 전역적으로 사용 가능한 serial queue.
4. 암튼..대충 정리하려고 해봤으나 잘 모르겠으므로 담에 정리하겠음 ㅋ

