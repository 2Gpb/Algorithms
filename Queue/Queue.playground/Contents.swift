final class Node<Element> {
    // MARK: - Variables
    var value: Element
    var next: Node?
    
    // MARK: - Lifecycle
    init(_ value: Element) {
        self.value = value
    }
}

struct Queue<Element> {
    // MARK: - Private variables
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    // MARK: - Variables
    var isEmpty: Bool { head == nil }
    var count: Int = 0
}

extension Queue {
    // MARK: - Methods
    mutating func enqueue(_ value: Element) {
        let newNode = Node(value)
        if isEmpty {
            head = newNode
        } else {
            tail?.next = newNode
        }
        
        tail = newNode
        count += 1
    }
    
    mutating func dequeue() -> Element? {
        guard !isEmpty else { return nil }
        
        let value = head?.value
        head = head?.next
        if head == nil { tail = nil }
        
        count -= 1
        return value
    }
}

extension Queue {
    init(_ elements: [Element]) {
        for element in elements {
            enqueue(element)
        }
    }
    
    // MARK: - Overloading
    mutating func enqueue(_ elements: [Element]) {
        elements.map { enqueue($0) }
    }
    
    mutating func dequeue(_ number: Int) -> [Element]? {
        (0..<min(number, count)).compactMap { _ in dequeue() }
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        var result = "["
        var currentNode = head
        while let node = currentNode {
            result += "\(node.value)"
            if node.next != nil { result += ", " }
            currentNode = node.next
        }
        
        return result + "]"
    }
}
