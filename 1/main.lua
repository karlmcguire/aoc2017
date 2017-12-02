-- puzzle input string
local input = require "input"
-- little ascii number lookup table
local numbers = require "numbers"

-- captcha takes a string input and returns the special captcha sum
function captcha (s)
  local sum, mov, cur, nex = 0, 0, 0, 0

  for i = 1, s:len(), 1 do
    -- if it's the last digit, compare to the first digit
    mov = (i == s:len() and 1 or i + 1)
    -- convert current digit to number
    cur = numbers[s:sub(i, i):byte()]
    -- convert next digit to number
    nex = numbers[s:sub(mov, mov):byte()]
    -- add to sum if the current digit equals the next digit
    sum = (cur == nex and sum + cur or sum) 
  end
  
  return sum
end

-- tests
assert(captcha("1122") == 3)
assert(captcha("1111") == 4)
assert(captcha("1234") == 0)
assert(captcha("91212129") == 9)

-- send the puzzle input
print(captcha(input))
