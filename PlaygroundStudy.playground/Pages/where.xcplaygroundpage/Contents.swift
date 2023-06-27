//MARK: - where절을 사용한 패턴 매칭
let point: (Int, Int) = (-3, 2)

switch point {
case let (x, y) where x > 0 && y > 0:
    print("(\(x), \(y)): 1사분면")
case let (x, y) where x < 0 && y > 0:
    print("(\(x), \(y)): 2사분면")
case let (x, y) where x < 0 && y < 0:
    print("(\(x), \(y)): 3사분면")
case let (x, y) where x > 0 && y < 0:
    print("(\(x), \(y)): 4사분면")
case (_, _):
    print("(\(point.0), \(point.1)): 선의 경계")
}
//(-3, 2): 2사분면

let heights: [Int?] = [nil, 178, 163, 172, nil, 181, nil]

for case .some(let value) in heights where value > 170 {
    print(value)
}

//178
//172
//181

//protocol extension
protocol PrintCharacter {
    func printCharacter()
}

extension String: PrintCharacter {}
//extension Int: PrintCharacter {}

extension PrintCharacter where Self: CustomStringConvertible, Self: Collection {
    func printCharacter() {
        for char in description {
            print(char)
        }
    }
}

String("Hello").printCharacter()
//H
//e
//l
//l
//o
//Int(19).printCharacter()
