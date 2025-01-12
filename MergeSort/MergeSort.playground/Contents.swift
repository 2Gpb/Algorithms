func merge<T: Comparable>(_ array: inout [T], left: Int, mid: Int, right: Int) {
    var leftSubarray = Array(array[left...mid])
    var rightSubArray = Array(array[mid + 1...right])
    
    var leftIndex = 0, rightIndex = 0
    
    for i in left...right {
        if leftIndex < leftSubarray.count && (
            rightIndex >= rightSubArray.count || leftSubarray[leftIndex] <= rightSubArray[rightIndex]
        ) {
            array[i] = leftSubarray[leftIndex]
            leftIndex += 1
        } else {
            array[i] = rightSubArray[rightIndex]
            rightIndex += 1
        }
    }
}

func mergeSort<T: Comparable>(_ array: inout [T], left: Int, right: Int) {
    if left >= right { return }
    
    let mid = left + (right - left) / 2
    mergeSort(&array, left: left, right: mid)
    mergeSort(&array, left: mid + 1, right: right)
    merge(&array, left: left, mid: mid, right: right)
}

var array = [12, 9, 3, 7, 14, 11, 6, 2, 10, 5]
mergeSort(&array, left: 0, right: array.count - 1)
print(array)
