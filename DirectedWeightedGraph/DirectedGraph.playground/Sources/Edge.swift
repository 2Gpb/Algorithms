//
//  Edge.swift
//  
//
//  Created by Peter on 24.01.2025.
//

public struct Edge {
    public init(from source: Node, to destination: Node, weight: Double?) {
        self.source = source
        self.destination = destination
        self.weight = weight
    }
    
    public let source: Node
    public let destination: Node
    public let weight: Double?
}
