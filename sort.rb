class Array

  def quicksort
    array = *self
    return array if array.size <= 1

    pivot = pivot()
    less_than, middle, greater_than = [], [], []
    array.each do |element|
      if element < pivot
        less_than << element
      elsif element > pivot
        greater_than << element
      else
        middle << element
      end
    end

    return less_than.quicksort + middle + greater_than.quicksort
  end

  def mergesort
    if self.size <= 1
      return self
    end

    begining, ending = break_in_two
    begining = begining.mergesort
    ending = ending.mergesort

    return begining.merge(ending)
  end

protected

  def merge(array2)
    array1 = *self
    merged = []

    while !array1.empty? && !array2.empty?
      if array1[0] < array2[0]
        merged << array1.shift
      else
        merged << array2.shift
      end
    end

    if array1.empty?
      merged.concat array2
    else
      merged.concat array1
    end

    merged
  end

private

  def pivot
    self[0]
  end

  def break_in_two
    middle = self.size/2
    return self[0...middle], self[middle..-1]
  end

end
