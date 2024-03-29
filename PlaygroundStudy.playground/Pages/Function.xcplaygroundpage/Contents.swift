//함수의 정의
func add(num1: Int, num2: Int) -> Int {
    return num1 + num2
}

let addNum: Int = add(num1: 4, num2: 5)
print(addNum)

//전달인자 레이블
func present(from myName: String, to yourName: String) -> String {
    return "\(myName)이 \(yourName)에게 선물 했습니다." //함수 내부에서는 매개변수
}

let presentToYou: String = present(from: "jeunghun", to: "Son") //함수 외부에서는 전달인자 레이블
print(presentToYou)

//전달인자 레이블이 없는 함수
func mulLoop1(_ num: Int, _ repeatCount: Int) -> Int {
    var result: Int = 1
    
    for _ in 1...repeatCount {
        result *= num
    }
    return result
}

print(mulLoop1(2, 3))

//매개변수 기본값
func mulLoop2(_ num: Int, _ repeatCount: Int = 2) -> Int {
    var result: Int = 1
    
    for _ in 1...repeatCount {
        result *= num
    }
    return result
}

print(mulLoop2(2))   //repeatCount의 기본값 반영
print(mulLoop2(3, 3))

//가변 매개변수
func wishList(_ myWishList: String...) -> [String] {
    var result: [String] = [String]()
    
    for i in myWishList {
        result.append(i)
    }
    return result
}

print(wishList("iphone", "ipad", "macbook"))

//입출력 매개변수
var numbers: [Int] = [1, 2, 3, 4, 5]

func changeNumber(_ arr: inout [Int]) {
    arr[3] = arr[0]
}

changeNumber(&numbers)  // &를 사용하여 전달인자가 참조 값임을 알림
print(numbers)

//반환값이 없는 함수
func helloWorld() -> Void {
    //Void는 아에 생략도 가능
    print("Hello World!")
}

//데이터 타입으로 함수
typealias Calculate = (Int, Int) -> Int     //타입 별칭 설정

func addFunc(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func mulFunc(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathCal: Calculate = addFunc    //함수를 데이터 타입으로 사용, 함수를 변수에 저장 가능
print(mathCal(4, 5))    //변수 이름으로 할당된 함수의 매개변수의 전달인자로 전달하며 호출(전달인자 레이블 or 와일드 카드 식별자 상관 없음)

func printResult(_ function: Calculate, _ a: Int, _ b: Int) {
    //함수를 매개변수로 사용 가능
    print("result: \(function(a, b))")
}

printResult(mulFunc, 3, 4)

func chooseFunction(_ addFunction: Bool) -> Calculate {
    addFunction ? addFunc : mulFunc
}

printResult(chooseFunction(false), 5, 6)

//중첩 함수
typealias Calc = (Int, Int) -> Int      //타입 별칭 설정

func chooseCalc(_ chooseAdd: Bool) -> Calc {
    func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    
    func mul(_ a: Int, _ b: Int) -> Int{
        return a * b
    }
    
    return chooseAdd ? add : mul
}

let chooseAdd: Bool = true  //더하기 함수를 선택
let saveCalc: Calc = chooseCalc(chooseAdd)  //반환 받은 함수를 상수에 저장

print(saveCalc(3, 4))

//종료되지 않는 함수(비반환 함수)
func crashAndBurn() -> Never {
    fatalError("Something is wrong")
}

crashAndBurn()    //정상 종료되지 않고 크래시 발생

//반환 값을 무시하는 함수
@discardableResult func someFunction(_ something: String) -> String {
    print(something)
    return something
}

someFunction("Good night!")     //반환 값을 사용하지 않아도 오류 무시
