protocol Graph {
    func addNode(_ node: String)
    func addEdge(from source: String, to destination: String)
    func deleteNode(_ node: String)
    func deleteEdge(from source: String, to destination: String)
    func getAdjacencyList() -> [String :[String]]
    func getIncomingNodes(for node: String) -> [String]
    func printGraph()
}

final class DirectedAcyclicGraph: Graph {
    private var adjacencyList: [String: [String]] = [:]
    
    func addNode(_ node: String) {
        guard !node.isEmpty, adjacencyList[node] == nil else { return }
        adjacencyList[node] = []
    }
    
    func addEdge(from source: String, to destination: String) {
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
    
    func deleteNode(_ node: String) {
        guard adjacencyList[node] != nil else { return }
        
        adjacencyList[node] = nil
        for (key, value) in adjacencyList {
            adjacencyList[key] = adjacencyList[key]?.filter { $0 != node }
        }
    }
    
    func deleteEdge(from source: String, to destination: String) {
        if let index = adjacencyList[source]?.firstIndex(of: destination) {
            adjacencyList[source]?.remove(at: index)
        }
    }
    
    func getAdjacencyList() -> [String: [String]] {
        adjacencyList
    }
    
    func getIncomingNodes(for node: String) -> [String] {
        adjacencyList.filter { $0.value.contains(node) }.map { $0.key }
    }
    
    func printGraph() {
        for (key, value) in adjacencyList {
            guard !value.isEmpty else { continue }
            print("\(key) -> \(value.joined(separator: ", "))")
        }
    }
}

let graph = DirectedAcyclicGraph()
graph.addNode("A")
graph.addNode("B")
graph.addNode("C")
graph.addNode("D")
graph.addNode("E")
graph.addEdge(from: "A", to: "B")
graph.addEdge(from: "B", to: "C")
graph.addEdge(from: "C", to: "D")
graph.addEdge(from: "D", to: "E")
graph.printGraph()
print(graph.getIncomingNodes(for: "C"))
print(graph.getAdjacencyList())
print()
graph.deleteNode("E")
graph.deleteEdge(from: "C", to: "D")
graph.deleteEdge(from: "A", to: "B")
graph.printGraph()
