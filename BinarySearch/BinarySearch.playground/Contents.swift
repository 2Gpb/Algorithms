func binarySearch<T: Comparable>(_ array: [T], _ target: T) -> Int {
    var lowerBound = 0
    var upperBound = array.count - 1
    
    while lowerBound <= upperBound {
        let midIndex = lowerBound + (upperBound - lowerBound) / 2
        if target == array[midIndex] {
            return midIndex
        } else if array[midIndex] < target {
            lowerBound = midIndex + 1
        } else {
            upperBound = midIndex - 1
        }
    }
    return -1
}

var array = [2, 3, 5, 6, 7, 9, 10, 11, 12, 14]
print(binarySearch(array, 7))
