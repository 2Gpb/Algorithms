func linearSearch<T: Equatable>(_ array: [T], _ object: T) -> Int {
    return array.firstIndex { $0 == object } ?? -1
}

var array = [2, 3, 5, 6, 7, 9, 10, 11, 12, 14]
print(linearSearch(array, 7))
