func bucketSort(_ array: inout [Int]) {
    var maxValue = array[0]
    var minValue = array[0]
    
    for value in array {
        if value > maxValue {
            maxValue = value
        }
        if value < minValue {
            minValue = value
        }
    }
    
    let bucketCount = maxValue - minValue + 1
    var buckets: [[Int]] = Array(repeating: [], count: bucketCount)
    
    for i in array {
        let bucketIndex = i - minValue
        buckets[bucketIndex].append(i)
    }
    
    array = buckets.flatMap { $0 }
}

var array = [10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26]
bucketSort(&array)
print(array)
