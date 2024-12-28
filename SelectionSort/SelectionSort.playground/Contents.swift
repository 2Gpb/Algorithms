final class InsertionSort {
    static func sort(_ array: inout [Int]) {
        for i in 0..<array.count-1 {
            var smallest = i
            for j in i+1..<array.count {
                if array[j] < array[smallest] {
                    smallest = j
                }
            }
            array.swapAt(i, smallest)
        }
        print(array)
    }
}

var array = [10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26]
InsertionSort.sort(&array)
