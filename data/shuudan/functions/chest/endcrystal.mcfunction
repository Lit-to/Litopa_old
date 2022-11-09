tag @e[tag=crystal] remove crystal
tag @e[tag=lead] remove lead

execute if score Map: settime matches 1 run tag @e[tag=chest,sort=random,limit=1] add crystal
execute if score Map: settime matches 2 run tag @e[tag=chest2,sort=random,limit=1] add crystal
execute if score Map: settime matches 3 run tag @e[tag=chest3,sort=random,limit=1] add crystal
execute if score Map: settime matches 4 run tag @e[tag=chest4,sort=random,limit=1] add crystal
execute at @e[tag=crystal] run loot insert ~ ~ ~ loot shuudan:endcrystal

execute if score Map: settime matches 1 run tag @e[tag=chest,sort=random,limit=1] add lead
execute if score Map: settime matches 2 run tag @e[tag=chest2,sort=random,limit=1] add lead
execute if score Map: settime matches 3 run tag @e[tag=chest3,sort=random,limit=1] add lead
execute if score Map: settime matches 4 run tag @e[tag=chest4,sort=random,limit=1] add lead
execute at @e[tag=lead] run loot insert ~ ~ ~ loot shuudan:lead