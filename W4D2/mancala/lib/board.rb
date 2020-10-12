class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new(4, :stone)}
    @cups[6], @cups[13] = [], []
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if !start_pos.between?(0, 13)
      raise 'Invalid starting cup'
    elsif @cups[start_pos].empty?
      raise 'Starting cup is empty'
    end
  end
  
  def make_move(start_pos, current_player_name)
    held = @cups[start_pos]
    @cups[start_pos] = []
    final_i = nil

    (start_pos+1..Float::INFINITY).each do |i|
      idx = i % 14
      if current_player_name == @name1
        @cups[idx] << held.shift unless idx == 13
      else
        @cups[idx] << held.shift unless idx == 6
      end
      if held.empty?
        final_i = idx
        break
      end
    end
    render

    next_turn(final_i)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length > 1
      ending_cup_idx
    else
      :switch
    end
    
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if @cups[0..6].all?(&:empty?) || @cups[8..13].all?(&:empty?)
      return true
    end
    false
  end

  def winner
    if @cups[6].length > @cups[13].length
      @name1
    elsif @cups[6].length < @cups[13].length
      @name2
    else
      :draw
    end
  end
end
