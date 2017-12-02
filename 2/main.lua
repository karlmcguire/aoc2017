local input = require "input"

function checksum (s)
  local sum, max, min, num, ini = 0, 0, 0, 0, true

  s:gsub("([^\n]*)\n?", function(l)
    l:gsub("%w+", function(n)
      num = tonumber(n)
      max = (num > max and num or max)
      min = (((num < min) or first) and num or min)
      ini = false 
    end)
    sum = sum + (max - min)
    max, min, ini = 0, 0, true
  end)

  return sum
end

print(checksum(input))
