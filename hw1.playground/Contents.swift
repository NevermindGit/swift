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
        var fib: [Int] = Array()
        if n > 2 {
            let a: Int = fibonacci(n: n-1)[0] + fibonacci(n: n-2)[0]
            fib.append(a)
        } else {
            fib.append(n)
        }
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
            charactersArray.append(str.first!)
        }
        return charactersArray
    }
    
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int] {
        var newArray: [Int] = Array()
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
    print(hw.fibonacci(n: 6))
    print(hw.sort(rawArray: [39, 94, 58, 2, 1, 80, 0, 77, 900, 26, 30]))
    print(hw.firstLetter(strings: ["abc", "def", "fog"]))
    print(hw.filter(array: [1, 2, 3, 4, 5, 6], condition: { i in
        return i % 2 == 0
    }))
}

res(hw: homeWork())
