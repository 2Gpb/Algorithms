func bubbleSort<T: Comparable>(_ array: inout [T]) {
    for i in 0..<array.count {
        for j in 0..<array.count - 1 - i {
            if array[j] > array[j + 1] {
                array.swapAt(j, j + 1)
            }
        }
    }
}

var array = [10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26]
bubbleSort(&array)
print(array)
