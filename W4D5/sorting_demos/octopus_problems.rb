fishies = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(fishies)
    fishies.each do |fishy|
        return fishy if fishies.all? { |f2| fishy.length >= f2.length }
    end
end

def dominant_octopus(fishies)
    fishies.sort{|a,b|b.length<=>a.length}[0]
end

def clever_octopus(fishies)
    fishy = ""
    fishies.each { |fish| fishy = fish if fish.length > fishy.length}
    fishy
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(dir, tiles_array)
    tiles_array.each_with_index { |tile, i| return i if dir == tile }
end

new_tiles_data_structure = { "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7 }

def fast_dance(dir, new_tiles_data_structure)
    new_tiles_data_structure[dir]
end