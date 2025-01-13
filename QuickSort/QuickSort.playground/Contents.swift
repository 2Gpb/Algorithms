func partition<T: Comparable>(_ array: inout [T], left: Int, right: Int) -> Int {
    var pivotIndex = left
    for currentIndex in left..<right{
        if array[currentIndex] <= array[right] {
            array.swapAt(currentIndex, pivotIndex)
            pivotIndex += 1
        }
    }
    array.swapAt(pivotIndex, right)
    return pivotIndex
}

func quickSort<T: Comparable>(_ array: inout [T], left: Int, right: Int) {
    if left >= right { return }
    
    let pivotIndex = partition(&array, left: left, right: right)
    quickSort(&array, left: left, right: pivotIndex - 1)
    quickSort(&array, left: pivotIndex + 1, right: right)
}

var array = [9, 7, 5, 11, 12, 2, 14, 3, 10, 6]
quickSort(&array, left: 0, right: array.count - 1)
print(array)
