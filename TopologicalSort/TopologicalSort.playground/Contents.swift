func topologicalSort(_ graph: Graph) -> [String] {
    var next: [String] = []
    var linearOrdering: [String] = []
    for node in graph.getAdjacencyList().keys {
        if graph.getIncomingNodes(for: node).isEmpty {
            next.append(node)
        }
    }
    
    while !next.isEmpty {
        let currentNode = next.removeFirst()
        linearOrdering.append(currentNode)

        for node in graph.getAdjacencyList()[currentNode] ?? [] {
            graph.deleteNode(currentNode)
            if graph.getIncomingNodes(for: node).isEmpty {
                next.append(node)
            }
        }
    }
    
    if linearOrdering.count < graph.getAdjacencyList().keys.count {
        fatalError("Graph contains a cycle!")
    }

    return linearOrdering
}

// TEST
let graph = DirectedAcyclicGraph()
graph.addNode("Underpants")
graph.addNode("Socks")
graph.addNode("Shorts")
graph.addNode("T-shirt")
graph.addNode("Slingshirts")
graph.addNode("Groin protection")
graph.addNode("Pants")
graph.addNode("Bib")
graph.addNode("Sweater")
graph.addNode("Skates")
graph.addNode("Mask")
graph.addNode("Foot guards")
graph.addNode("Trap")
graph.addNode("Shield")

graph.addEdge(from: "Underpants", to: "Shorts")
graph.addEdge(from: "Socks", to: "Slingshirts")
graph.addEdge(from: "Shorts", to: "Slingshirts")
graph.addEdge(from: "Shorts", to: "Groin protection")
graph.addEdge(from: "Slingshirts", to: "Pants")
graph.addEdge(from: "Groin protection", to: "Pants")
graph.addEdge(from: "T-shirt", to: "Bib")
graph.addEdge(from: "Bib", to: "Sweater")
graph.addEdge(from: "Pants", to: "Sweater")
graph.addEdge(from: "Pants", to: "Skates")
graph.addEdge(from: "Sweater", to: "Mask")
graph.addEdge(from: "Skates", to: "Foot guards")
graph.addEdge(from: "Mask", to: "Trap")
graph.addEdge(from: "Foot guards", to: "Trap")
graph.addEdge(from: "Trap", to: "Shield")
graph.printGraph()

let sort = topologicalSort(graph)
print()
print(sort)
