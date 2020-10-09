class Stack
    def initialize
      # create ivar to store stack here!
      @spells = []
    end

    def push(el)
      # adds an element to the stack
      @spells.push(el)
    end

    def pop
      # removes one element from the stack
      @spells.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @spells[-1]
    end
end