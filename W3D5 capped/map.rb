class Map
    def initialize
        @world = {}
    end

    def set(key, value)
        @world[key] = value
    end

    def get(key)
        @world[key]
    end

    def delete(key)
        @world.delete(key)
    end
end