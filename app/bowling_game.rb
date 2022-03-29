class BowlingGame
  def score scores
    @scores = scores

    @strikes = @scores.count {|n| n == 10}

    total = 0
    @scores.each_with_index do |n,i|
      total += n if !last_counted_throw?(i) 
      total += n if had_strike?(i, offset: 1)
      total += n if had_strike?(i, offset: 2)
      total += n if had_spare?(i) 
    end

    return total
  end

  def last_counted_throw?(i)
    i > 20 - @strikes
  end

  def had_strike?(i, offset: 1)
    (i >= offset && @scores[i - offset] == 10)
  end

  def had_spare?(i)
    return false if i < 2 || !in_same_frame?(i) || spare_scores(i).index(10)
    spare_scores(i).sum == 10
  end

  def spare_scores(i)
    @scores[(i-2)...i]
  end

  def in_same_frame?(i)
    @strikes.even? == i.even?
  end

end