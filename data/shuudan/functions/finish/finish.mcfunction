title @a title {"text":"==\u7d42\u4e86==","bold":true,"color":"white"}
execute if score Map: settime matches 1 at @e[tag=finish] run tp @a ~ ~ ~
execute if score Map: settime matches 2 at @e[tag=lobby2] run tp @a ~ ~ ~
execute if score Map: settime matches 3 at @e[tag=lobby3] run tp @a ~ ~ ~
execute if score Map: settime matches 4 at @e[tag=lobby4] run tp @a ~ ~ ~
scoreboard players set 4 tick 0
schedule function shuudan:finish/kekkahyouji 5s
execute if score Map: settime matches 1 run summon armor_stand -56 20 62 {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["adv"]}
execute if score Map: settime matches 2 run summon armor_stand -52 21 133 {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["adv"]} 
execute if score Map: settime matches 3 run summon armor_stand -56 23 221 {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["adv"]}
execute if score Map: settime matches 4 run summon armor_stand -98 22 75 {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["adv"]}