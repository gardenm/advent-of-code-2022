ranges = ARGF.each_line
  .map { |str| str.split(',') }
  .map { |a, b|
    a_start, a_end = a.split('-').map { |x| Integer(x) }
    b_start, b_end = b.split('-').map { |x| Integer(x) }

    [Range.new(a_start, a_end), Range.new(b_start, b_end)]
  }

proper = ranges.select do |a, b|
  (b.first >= a.first && b.last <= a.last) || (a.first >= b.first && a.last <= b.last)
end

p proper.length
