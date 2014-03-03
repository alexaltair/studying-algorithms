# Implement a hash table using only arrays.

class HashTable
  attr_reader :size
  def initialize(size, collision_resolution=false)
    @size = size
    @array = []
  end

  def search(key)
    index = hash(key)
    @array[index]
  end
  alias :[] :search

  def insert(key, value)
    index = hash(key)
    @array[index] = value
  end
  alias :[]= :insert

  def delete(key)
    self.insert(key, nil)
  end

private

  def hash(key)
    key.object_id % size
  end

end
