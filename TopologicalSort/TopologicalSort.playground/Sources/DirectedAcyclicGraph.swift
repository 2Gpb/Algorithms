public protocol Graph {
    func addNode(_ node: String)
    func addEdge(from source: String, to destination: String)
    func deleteNode(_ node: String)
    func deleteEdge(from source: String, to destination: String)
    func getAdjacencyList() -> [String :[String]]
    func getIncomingNodes(for node: String) -> [String]
    func printGraph()
}

public final class DirectedAcyclicGraph: Graph {
    private var adjacencyList: [String: [String]] = [:]
    
    public init() {}
    
    public func addNode(_ node: String) {
        guard !node.isEmpty, adjacencyList[node] == nil else { return }
        adjacencyList[node] = []
    }
    
    public func addEdge(from source: String, to destination: String) {
        guard !source.isEmpty,
              !destination.isEmpty,
              adjacencyList[source] != nil,
              adjacencyList[destination] != nil,
              !(adjacencyList[source]?.contains(destination) ?? false)
        else {
            return
        }
       
        adjacencyList[source]?.append(destination)
    }
    
    public func deleteNode(_ node: String) {
        guard adjacencyList[node] != nil else { return }
        
        adjacencyList[node] = nil
        for (key, _) in adjacencyList {
            adjacencyList[key] = adjacencyList[key]?.filter { $0 != node }
        }
    }
    
    public func deleteEdge(from source: String, to destination: String) {
        if let index = adjacencyList[source]?.firstIndex(of: destination) {
            adjacencyList[source]?.remove(at: index)
        }
    }
    
    public func getAdjacencyList() -> [String: [String]] {
        adjacencyList
    }
    
    public func getIncomingNodes(for node: String) -> [String] {
        adjacencyList.filter { $0.value.contains(node) }.map { $0.key }
    }
    
    public func printGraph() {
        for (key, value) in adjacencyList {
            guard !value.isEmpty else { continue }
            print("\(key) -> \(value.joined(separator: ", "))")
        }
    }
}
