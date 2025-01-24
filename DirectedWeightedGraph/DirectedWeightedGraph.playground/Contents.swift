protocol Graph {
    func addNode(_ node: Node)
    func addEdge(from source: Node, to destination: Node, weight: Double?)
    func deleteNode(_ node: Node)
    func deleteEdge(from source: Node, to destination: Node)
    func getAdjacencyList() -> [Node : [Node]]
    func getIncomingNodes(for node: Node) -> [Node]
    func printGraph()
}

final class DirectedWeightedGraph: Graph {
    private var adjacencyList: [Node: [Node]] = [:]
    private var edges: [Edge] = []
    
    func addNode(_ node: Node) {
        guard !node.name.isEmpty, adjacencyList[node] == nil else { return }
        adjacencyList[node] = []
    }
    
    func addEdge(from source: Node, to destination: Node, weight: Double? = nil) {
        guard !source.name.isEmpty,
              !destination.name.isEmpty,
              adjacencyList[source] != nil,
              adjacencyList[destination] != nil,
              !(adjacencyList[source]?.contains(destination) ?? true)
        else {
            return
        }
        
        edges.append(Edge(from: source, to: destination, weight: weight))
        adjacencyList[source]?.append(destination)
    }
    
    func deleteNode(_ node: Node) {
        guard adjacencyList[node] != nil else { return }
        
        adjacencyList[node] = nil
        for (key, value) in adjacencyList {
            adjacencyList[key] = adjacencyList[key]?.filter { $0 != node }
        }
        
        edges = edges.filter { $0.source != node || $0.destination != node  }
    }
    
    func deleteEdge(from source: Node, to destination: Node) {
        if let index = adjacencyList[source]?.firstIndex(of: destination) {
            adjacencyList[source]?.remove(at: index)
        }
         
        edges = edges.filter { $0.source != source && $0.destination != destination }
    }
    
    func getAdjacencyList() -> [Node: [Node]] {
        adjacencyList
    }
    
    func getEdgeWeights() -> [Edge] {
        edges
    }
    
    func getIncomingNodes(for node: Node) -> [Node] {
        adjacencyList.filter { $0.value.contains(node) }.map { $0.key }
    }

    func printGraph() {
        edges.forEach { edge in
            if let weightInfo = edge.weight {
                print("\(edge.source.name) -(\(Int(weightInfo)))> \(edge.destination.name)")
            } else {
                print("\(edge.source.name) -> \(edge.destination.name)")
            }
        }
    }
}

let graph = DirectedWeightedGraph()
let nodeA = Node(name: "A")
let nodeB = Node(name: "B")
let nodeC = Node(name: "C")
let nodeD = Node(name: "D")
let nodeE = Node(name: "E")

graph.addNode(nodeA)
graph.addNode(nodeB)
graph.addNode(nodeC)
graph.addNode(nodeD)
graph.addNode(nodeE)
graph.addEdge(from: nodeA, to: nodeB)
graph.addEdge(from: nodeB, to: nodeC, weight: 3)
graph.addEdge(from: nodeC, to: nodeD)
graph.addEdge(from: nodeD, to: nodeE)
graph.printGraph()
