import Cocoa

public class Node<Value: Equatable> {
    
    public var value: Value
    public var next: Node?
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
          return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
      }
}



public struct LinkedList<Value: Equatable> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public mutating func push(value: Value) {
        let node = Node(value: value, next: head)
        if head == nil {
            tail = node
        }
        head = node
    }
    
    public mutating func append(value: Value) {
        if tail != nil {
            tail?.next = Node(value: value, next: nil)
            tail = tail?.next
        } else {
            head = Node(value: value, next: tail)
            tail = head
        }
    }
    
    public mutating func insertAfter(value: Value, what: Value) {
        var tmpPointer = head
        while tmpPointer?.next != nil {
            if tmpPointer?.value == value {
                let node = Node(value: what, next: tmpPointer?.next)
                tmpPointer?.next = node
                break
            } else {
                tmpPointer = tmpPointer?.next
            }
        
        }
        return
    }
    
    public mutating func removeValue(value: Value) {
        var tmpPointer = head
        while tmpPointer?.next != nil {
            if tmpPointer?.next?.value == value {
                tmpPointer?.next = tmpPointer?.next?.next
                break
            } else {
                tmpPointer = tmpPointer?.next
            }
        
        }
    }
       
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}

var linkedlist = LinkedList<Int>()
linkedlist.append(value: 1)
linkedlist.append(value: 2)
linkedlist.append(value: 3)
linkedlist.append(value: 4)
linkedlist.append(value: 5)
print(linkedlist.description)
linkedlist.removeValue(value: 3)
