func insertionSort<T: Comparable>(_ array: inout [T]) -> [T] {
    for i in 1..<array.count {
        let key = array[i]
        var j = i - 1
        while j >= 0 && array[j] > key {
            array[j + 1] = array[j]
            j -= 1
        }
        array[j + 1] = key
    }
    return array
}

var array = [10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26]
print(insertionSort(&array))
