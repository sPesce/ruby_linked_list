
class LinkedList

  attr_reader :first
  
  #adds data to start
  def unshift(data)
    if first == nil
      @first = Node.new(data)
    else
      @first = Node.new(data,first)
    end
  end

  #removes from start
  def shift
    if self.first == nil
      return false
    else
      this_first = self.first
      @first = self.first.next
      return this_first
    end
  end

  #adds data to end of Linked List
  def push(data)
    if first == nil
      @first = Node.new(data)
    else
      #set last nodes 'next' to this data
      self.last.next = Node.new(data)
    end
  end

  #returns and removes last element
  def pop
    #empty list
    if self.empty?
      return false
    elsif self.first.next == nil
        current = @first
        @first = nil
        return current        
    else
      current = self.first
      until (current.next.next == nil)
        current = current.next
      end
      last = current.next
      current.next = nil
      return last
    end
  end

  #get the last node
  def last
    return false if self.empty?
    node = self.first
    while (node.next != nil)
      node = node.next
    end
    node
  end

  #insert a node with data "data" after the node with data "original_data"
  #original_data: node that new node is being inserted after
  def insert_after(original_data,data)
    found = self.find(original_data)
    if !found
      return false
    else
      new_node = Node.new(data,found.next)
      found.next = new_node
      return true 
    end     
  end

  ##insert a node with data "data" before the node with "original_data"
  def insert_before(original_data,data)
    if self.empty? 
      return false
    else
      current = self.first
      until (current.next == nil)        
        #found data
        if current.next.data == original_data
          after = current.next
          current.next = Node.new(data,after)
          return true
        end
        current = current.next
      end
    end
    return false   
  end

  def find(data)
    current = self.first
    until(current == nil || current.next == nil || current.data == data) do
      current = current.next     
    end
    return false if current == nil
    return current
  end

  def empty?
    if self.first == nil
      return true
    end
    return false
  end

  #make array from LL
  def to_a
    return [] if self.empty?
    current = self.first
    a = []    
    while (current != nil)
      a << current
      if current.next = nil
        return a
      else
        current = current.next
      end
    end
  end
end
