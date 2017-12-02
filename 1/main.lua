local input = require "input"
local numbers = require "numbers"

function captcha (s)
  local sum, mov, cur, nex = 0, 0, 0, 0

  for i = 1, s:len(), 1 do
    mov = (i == s:len() and 1 or i + 1)
    
    cur = numbers[s:sub(i, i):byte()]
    nex = numbers[s:sub(mov, mov):byte()]
    
    sum = (cur == nex and sum + cur or sum) 
  end
  
  return sum
end

assert(captcha("1122") == 3)
assert(captcha("1111") == 4)
assert(captcha("1234") == 0)
assert(captcha("91212129") == 9)

print(captcha(input))
