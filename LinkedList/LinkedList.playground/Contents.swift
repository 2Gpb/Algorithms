final class Node<Element> {
    // MARK: - Variables
    var value: Element
    var next: Node?
    
    // MARK: - Lifecycle
    init(_ value: Element) {
        self.value = value
    }
}

struct LinkedList<Element> {
    // MARK: - Private variables
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    // MARK: - Variables
    var isEmpty: Bool { head == nil }
    var count: Int = 0
    var first: Element? { head?.value }
    var last: Element? { tail?.value }
}

extension LinkedList {
    // MARK: - Methods
    mutating func append(_ value: Element) {
        let newNode = Node(value)
        if isEmpty {
            head = newNode
        } else {
            tail?.next = newNode
        }
    
        tail = newNode
        count += 1
    }
    
    func value(at index: Int) -> Element? {
        node(at: index)?.value
    }
    
    @discardableResult
    mutating func remove(at index: Int) -> Element? {
        guard index >= 0, let head = head else { return nil }
        
        if index == 0 {
            let removedValue = head.value
            self.head = head.next
            if self.head == nil { tail = nil }
            count -= 1
            return removedValue
        }
        
        let previousNode = node(at: index - 1)
        guard let nodeToRemove = previousNode?.next else { return nil }
        
        previousNode?.next = nodeToRemove.next
        if nodeToRemove === tail {
            tail = previousNode
        }
        
        count -= 1
        return nodeToRemove.value
    }
}

extension LinkedList {
    // MARK: - Private methods
    private func node(at index: Int) -> Node<Element>? {
        guard index >= 0 else { return nil }
        var currentNode = head
        for _ in 0..<index {
            guard let nextNode = currentNode?.next else { return nil }
            currentNode = nextNode
        }
        
        return currentNode
    }
}

extension LinkedList: CustomStringConvertible {
        var description: String {
        var result = "["
        var currentNode = head
        while let node = currentNode {
            result += "\(node.value)"
            if node.next != nil { result += " -> " }
            currentNode = node.next
        }
        return result + "]"
    }
}
