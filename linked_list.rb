class Node
  attr_accessor :value, :next

  def initialize(value = nil, _next = nil)
    @value = value
    @next = _next
  end

end

class LinkedList

  def initialize(first = nil)
    if first
      @first = Node.new(first)
      @size = 1
    else
      @first = nil
      @size = 0
    end
  end

  def size
    if @size > 0
      @size
    elsif !@first
      0
    else
      @size = 1
      node = first(false)
      while node.next != nil
        @size += 1
        node = node.next
      end
      @size
    end
  end
  alias :length :size

  def nth(n, value = true)
    return nil if n > size-1
    node = @first
    n.times do
      node = node.next
    end

    if value
      node.value
    else
      node
    end
  end

  def first(value = true)
    nth(0, value)
  end

  def last(value = true)
    return nil if size == 0
    nth(size-1, value)
  end

  def pop
    return nil if size == 0
    nth(size-1, false).next = nil
    @size -= 1
  end

  def push(value = nil)
    node = Node.new(value)
    if @first
      last(false).next = node
    else
      @first = Node.new(value)
    end
    @size += 1
  end
  alias :add :push

  def shift
    return nil if size == 0
    @first = nth(1, false)
    @size -= 1
  end

  def unshift(value = nil)
    temp = @first
    @first = Node.new(value)
    @first.next = temp
    @size += 1
  end

end
