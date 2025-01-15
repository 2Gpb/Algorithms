func countingSort(_ array: inout [Int]) {
    let dimension = (array.max() ?? 0) + 1
    var countArray: [Int] = Array(repeating: 0, count: dimension)
    for key in array {
        countArray[key] += 1
    }

    for i in 1..<dimension {
        let sum = countArray[i] + countArray[i - 1]
        countArray[i] = sum
    }
    
    var sortedArray = [Int](repeating: 0, count: array.count)

    for element in array.reversed() {
        countArray[element] -= 1
        sortedArray[countArray[element]] = element
    }
    
    array = sortedArray
}

var array = [4, 1, 5, 0, 1, 6, 5, 1, 5, 3]
countingSort(&array)
print(array)
