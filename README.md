# FastHeart (ROBLOX ONLY)
FastHeart is just like Heartbeat but it more faster!

# Benchmark (Rblx Server)
#### Heartbeat: 0.03296373412013054 ms 
#### (Activity: 0.3%> Rate 30/s)
#### FastHeart: 0.0000019073486328125 ms 
#### (Activity: 0.3%> Rate 30/s)

# How to use
```lua
local module = require(path2module)

module:Connect(function(ms)
  print(ms)
end)

module:Wait(3) --Will wait 3 seconds without freeze game.
module:Sleep(3) --Will wait 3 seconds with freeze game.
```
