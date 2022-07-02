protocol HomeworkService {
    // Функция деления с остатком, должна вернуть в первой части результат деления, во второй части остаток.
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int)

    // Функция должна вернуть числа фибоначчи.
    func fibonacci(n: Int) -> [Int]

    // Функция должна выполнить сортировку пузырьком.
    func sort(rawArray: [Int]) -> [Int]

    // Функция должна преобразовать массив строк в массив первых символов строки.
    func firstLetter(strings: [String]) -> [Character]

    // Функция должна отфильтровать массив по условию, которое приходит в параметре `condition`. (Нельзя юзать `filter` у `Array`)
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int]
}


struct homeWork: HomeworkService {
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int) {
        return (x / y, x % y)
    }
    
    func fibonacci(n: Int) -> [Int] {
        var fib: [Int] = []
        guard n > 1 else { return [n] }
        fib.append(fibonacci(n: n-1)[0] + fibonacci(n: n-2)[0])
        return fib
    }
    
    func sort(rawArray: [Int]) -> [Int] {
        var newArray: [Int] = rawArray
        for i in 0..<newArray.count {
            for j in 0..<newArray.count-i-1 {
                if newArray[j] > newArray[j+1] {
                    let a: Int = newArray[j+1]
                    newArray[j+1] = newArray[j]
                    newArray[j] = a
                }
            }
        }
        return newArray
    }
    
    func firstLetter(strings: [String]) -> [Character] {
        var charactersArray: [Character] = Array()
        for str in strings {
            charactersArray.append(str.first ?? "-")
        }
        return charactersArray
    }
    
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int] {
        var newArray: [Int] = []
        for i in 0..<array.count {
            if condition(array[i]) {
                newArray.append(array[i])
            }
        }
        return newArray
    }
}

func res(hw: HomeworkService){
    print(hw.divideWithRemainder(5, by: 2))
    print(hw.fibonacci(n: 11))
    print(hw.sort(rawArray: [39, 94, 58, 2, 1, 80, 0, 77, 900, 26, 30]))
    print(hw.firstLetter(strings: ["abc", "def", "fog"]))
    print(hw.filter(array: [1, 2, 3, 4, 5, 6], condition: { i in
        return i % 2 == 0
    }))
}

res(hw: homeWork())


// MARK: - 2 задание


public enum BookGenres: String {
    case none
    case melodrama
    case thriller
    case horror
    case comedy
    case detective = "And Then There Were None by Agatha Christie"
}

// Типы посетителей библиотеки
public enum VisitorTypes {
    case student
    case bibliophile // тот кто любит много читать
    case worker
}

protocol Adder {
    func addBook()
}

protocol ProtocolName {
    var name: String { get set }
}

private class NationalLibrary {
    let age: Int = 1991
    let status: String = "Open"
}

public class Human: ProtocolName {
    var name: String
    var favouriteGenre: BookGenres
    var age: Int
    
    init() {
        name = ""
        favouriteGenre = .none
        age = 0
    }
    
    func info() {
        print("I am \(name), \(age) y.o.")
    }
}

public class Librarian: Human {
    override init() {
        super.init()
        name = "Vadim"
        favouriteGenre = .detective
        age = 18
    }
    let experience: Int = 3
    let type: VisitorTypes = .worker
}

var amountOfBooks: Int = 2_000_000

private class MoreBooks: Adder {
    func addBook() {
        if amountOfBooks < 2_000_000 {
            amountOfBooks += 1
        }
    }
}

public class Action: Librarian {
    func action() {
        print("I am reading \(BookGenres.detective.rawValue)")
    }
}

private struct Visitor1 {
    let type: VisitorTypes = .student
    
    func study(){
        if amountOfBooks > 0 {
            amountOfBooks -= 1
        }
        print("I am studying, don't disturb me!!!")
    }
}

private struct Visitor2 {
    let type: VisitorTypes = .bibliophile
    var limitOfBooks = 10
    
    mutating func read(){
        print("I am reading book!")
        while limitOfBooks > 0 {
                amountOfBooks -= 1
                limitOfBooks -= 1
        }
    }
    
}

private struct Visitor3 {
    let type: VisitorTypes = .worker
    
    func work(){
        print("I am working here. I need to keep the peace")
    }
}


let person = Librarian()
person.info()
let a = Action()
a.action()

