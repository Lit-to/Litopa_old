#人数
execute if score 4 tick matches 1 run scoreboard players set players players 0
execute if score 4 tick matches 1 at @a[tag=!admin,gamemode=adventure] run scoreboard players add players players 1 

#死んだらスペク
execute if score 4 tick matches 1 at @e[tag=finish] run gamemode spectator @a[gamemode=adventure,distance=..5]
execute if score 4 tick matches 1 at @e[tag=lobby1] run gamemode spectator @a[gamemode=adventure,distance=..5]
execute if score 4 tick matches 1 at @e[tag=lobby2] run gamemode spectator @a[gamemode=adventure,distance=..5] 

#タイマー
execute if score 2 tick matches 1 run scoreboard players remove game tick 1
execute if score 2 tick matches 1 run scoreboard players operation 残り時間: time = game tick
execute if score 2 tick matches 1 run scoreboard players operation 残り時間: time /= 20 20
execute if score 2 tick matches 1 if score game tick matches 1 run scoreboard players set 5 tick 1
execute if score 2 tick matches 1 if score game tick matches 1 run function shuudan:finish/finish

#特殊アイテム
execute if score 2 tick matches 1 at @e[type=item,nbt={Item:{id:"minecraft:iron_horse_armor",Count:1b}}] run effect give @a[distance=..2] minecraft:speed 3 7 true
execute if score 2 tick matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:iron_horse_armor",Count:1b}}]

execute if score 2 tick matches 1 at @e[type=item,nbt={Item:{id:"minecraft:golden_horse_armor",Count:1b}}] run effect give @a[distance=..2] minecraft:invisibility 5 1 true
execute if score 2 tick matches 1 at @e[type=item,nbt={Item:{id:"minecraft:golden_horse_armor",Count:1b}}] run particle minecraft:squid_ink ~ ~ ~ 2 2 2 0.1 1000
execute if score 2 tick matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:golden_horse_armor",Count:1b}}]

execute if score 2 tick matches 1 at @e[type=item,nbt={Item:{id:"minecraft:minecart",Count:1b}}] run effect give @a[distance=..2,team=yowai] minecraft:blindness 5 255 true
execute if score 2 tick matches 1 at @e[type=item,nbt={Item:{id:"minecraft:minecart",Count:1b}}] run effect give @a[distance=..2,tag=bousou] minecraft:slowness 5 5 true
execute if score 2 tick matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:minecart",Count:1b}}]

execute if score 2 tick matches 1 if score Map: settime matches 1 at @e[type=item,nbt={Item:{id:"minecraft:lead",Count:1b}}] run tp @p[tag=bousou,distance=..2] @e[sort=random,limit=1,tag=spawn]
execute if score 2 tick matches 1 if score Map: settime matches 2 at @e[type=item,nbt={Item:{id:"minecraft:lead",Count:1b}}] run tp @p[tag=bousou,distance=..2] @e[sort=random,limit=1,tag=spawn2]
execute if score 2 tick matches 1 if score Map: settime matches 3 at @e[type=item,nbt={Item:{id:"minecraft:lead",Count:1b}}] run tp @p[tag=bousou,distance=..2] @e[sort=random,limit=1,tag=spawn3]
execute if score 2 tick matches 1 if score Map: settime matches 4 at @e[type=item,nbt={Item:{id:"minecraft:lead",Count:1b}}] run tp @p[tag=bousou,distance=..2] @e[sort=random,limit=1,tag=spawn4]
execute if score 2 tick matches 1 at @e[type=item,nbt={Item:{id:"minecraft:lead",Count:1b}}] run playsound minecraft:entity.enderman.teleport master @p[tag=bousou,distance=..2] ~ ~ ~
execute if score 2 tick matches 1 at @e[type=item,nbt={Item:{id:"minecraft:lead",Count:1b}}] run particle minecraft:portal ~ ~ ~ 1 1 1 3 5000
execute if score 2 tick matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:lead",Count:1b}}]



#ここまで

execute if score 2 tick matches 1 if score game tick matches 1 run scoreboard players set 2 tick 0

#たこ焼きトークン作れるやつ
execute if score 4 tick matches 1 as @a[nbt={Inventory:[{id:"minecraft:orange_dye"}]}] run give @s yellow_dye{display:{Name:'{"text":"たこやきのもと","color":"dark_aqua","bold":true}',Lore:['{"text":"かまどで焼いて使用","color":"white"}']}} 1
execute if score 4 tick matches 1 as @a[nbt={Inventory:[{id:"minecraft:orange_dye"}]}] run clear @s orange_dye 1

execute if score 4 tick matches 1 as @a[nbt={Inventory:[{id:"minecraft:bowl"}]}] run give @s magma_cream{display:{Name:'{"text":"たこやきトークン","color":"gold","bold":true}',Lore:['{"text":"おいしそう","color":"white"}']},Enchantments:[{}],AttributeModifiers:[{AttributeName:"generic.max_health",Name:"generic.max_health",Amount:1,Operation:0,UUID:[I;-1767179414,-1950396937,-1665965454,-2107688778],Slot:"offhand"}]} 1
execute if score 4 tick matches 1 as @a[nbt={Inventory:[{id:"minecraft:bowl"}]}] run scoreboard players add @s takoyaki 1
execute if score 4 tick matches 1 as @a[nbt={Inventory:[{id:"minecraft:bowl"}]}] run scoreboard players operation 最大トークンの数: takoyaki > @s takoyaki
execute if score 4 tick matches 1 at @a[nbt={Inventory:[{id:"minecraft:bowl"}]}] run particle flame ~ ~ ~ 1 1 1 100
execute if score 4 tick matches 1 as @a[nbt={Inventory:[{id:"minecraft:bowl"}]}] run tellraw @a[team=admin] ["",{"selector":"@s","color":"green"},{"text":"\u304c\u305f\u3053\u713c\u304d\u30c8\u30fc\u30af\u30f3\u3092\u4f5c\u3063\u305f","color":"green"}]
execute if score 4 tick matches 1 as @a[nbt={Inventory:[{id:"minecraft:bowl"}]}] run clear @s bowl

execute if score 4 tick matches 1 run scoreboard players remove chest tick 1
execute if score 4 tick matches 1 run scoreboard players operation 補充まで: time = chest tick
execute if score 4 tick matches 1 run scoreboard players operation 補充まで: time /= 20 20
execute if score 4 tick matches 1 if score chest tick matches 1 run function shuudan:chest/loot
execute if score 4 tick matches 1 if score chest tick matches 1 run tellraw @a {"text":"\u30c1\u30a7\u30b9\u30c8\u306b\u88dc\u5145\u3055\u308c\u305f\uff01","bold":true,"color":"gold"}
execute if score 4 tick matches 1 if score chest tick matches 1 run scoreboard players operation chest tick = res_chest tick

execute if score 4 tick matches 1 run tag @p[nbt={Inventory:[{id:"minecraft:end_crystal"}]},gamemode=adventure] add bousou
#execute if score 4 tick matches 1 as @p[tag=bousou,nbt={Inventory:[{id:"minecraft:end_crystal"}]}] run tellraw @a [{"text":"暴走した！","color":"aqua"}]
execute if score 4 tick matches 1 as @p[tag=bousou,nbt={Inventory:[{id:"minecraft:end_crystal"}]}] run tellraw @a ["",{"selector":"@a[tag=bousou]","color":"aqua"},{"text":"\u304c\u66b4\u8d70\u3057\u305f\uff01","color":"aqua"}]
execute if score 4 tick matches 1 at @p[tag=bousou,nbt={Inventory:[{id:"minecraft:end_crystal"}]}] run playsound minecraft:entity.wither.spawn master @a ~ ~ ~

execute if score 4 tick matches 1 if score 16 tick matches 1 as @a[tag=bousou] run function shuudan:bousou/level1
execute if score 4 tick matches 1 if score 11 tick matches 1 as @a[tag=bousou] run give @p[tag=bousou] oak_planks{display:{Name:'{"text":"暴走中！！！！","color":"gold","bold":true}'},Unbreakable:1b,Enchantments:[{id:"minecraft:binding_curse",lvl:1s}]} 1
execute if score 4 tick matches 1 if score 11 tick matches 1 as @a[tag=bousou] run effect give @p[tag=bousou] instant_health 20 25 true
execute if score 4 tick matches 1 if score 11 tick matches 1 as @a[tag=bousou] run effect give @p[tag=bousou] health_boost 1000000 9 true
execute if score 4 tick matches 1 if score 11 tick matches 1 as @a[tag=bousou] run scoreboard players set 6 tick 1
execute if score 4 tick matches 1 if score 11 tick matches 1 as @a[tag=bousou] run scoreboard players set 16 tick 0
execute if score 4 tick matches 1 if score 11 tick matches 1 as @a[tag=bousou] run scoreboard players set 11 tick 0

execute if score 4 tick matches 1 if score 17 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:3b}]}] run function shuudan:bousou/level2
execute if score 4 tick matches 1 if score 12 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:3b}]}] run clear @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:3}]}] oak_planks
execute if score 4 tick matches 1 if score 12 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:3b}]}] run give @p[tag=bousou] cobblestone{display:{Name:'{"text":"暴走中！！！！","color":"gold","bold":true}'},Unbreakable:1b,Enchantments:[{id:"minecraft:binding_curse",lvl:1s}]} 1
execute if score 4 tick matches 1 if score 12 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:3b}]}] run tellraw @a {"text":"\u66b4\u8d70\u304c\u6b62\u307e\u3089\u306a\u3044\u30fb\u30fb\uff01\u6c17\u3092\u4ed8\u3051\u308d\uff01\uff01","bold":true,"color":"aqua"}
execute if score 4 tick matches 1 if score 12 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:3b}]}] run effect give @p[tag=bousou] health_boost 1000000 11 true
execute if score 4 tick matches 1 if score 12 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:3b}]}] run effect give @p[tag=bousou] minecraft:regeneration 20 3 true
execute if score 4 tick matches 1 if score 12 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:3b}]}] run scoreboard players set 7 tick 1
execute if score 4 tick matches 1 if score 12 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:3b}]}] run scoreboard players set 17 tick 0
execute if score 4 tick matches 1 if score 12 tick matches 1 as @a[tag=bousou] run scoreboard players set 12 tick 0

execute if score 4 tick matches 1 if score 18 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:5b}]}] run function shuudan:bousou/level3
execute if score 4 tick matches 1 if score 13 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:5b}]}] run clear @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:5}]}] cobblestone
execute if score 4 tick matches 1 if score 13 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:5b}]}] run give @p[tag=bousou] iron_block{display:{Name:'{"text":"暴走中！！！！","color":"gold","bold":true}'},Unbreakable:1b,Enchantments:[{id:"minecraft:binding_curse",lvl:1s}]} 1
execute if score 4 tick matches 1 if score 13 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:5b}]}] run tellraw @a {"text":"\u66b4\u8d70\u304c\u6b62\u307e\u3089\u306a\u3044\u30fb\u30fb\uff01\u6c17\u3092\u4ed8\u3051\u308d\uff01\uff01","bold":true,"color":"light_purple"}
execute if score 4 tick matches 1 if score 13 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:5b}]}] run effect give @p[tag=bousou] health_boost 1000000 14 true
execute if score 4 tick matches 1 if score 13 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:5b}]}] run effect give @p[tag=bousou] minecraft:regeneration 20 3 true
execute if score 4 tick matches 1 if score 13 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:5b}]}] run scoreboard players set 8 tick 1
execute if score 4 tick matches 1 if score 13 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:5b}]}] run scoreboard players set 18 tick 0
execute if score 4 tick matches 1 if score 13 tick matches 1 as @a[tag=bousou] run scoreboard players set 13 tick 0

execute if score 4 tick matches 1 if score 19 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:7b}]}] run function shuudan:bousou/level4
execute if score 4 tick matches 1 if score 14 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:7b}]}] run clear @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:7}]}] iron_block
execute if score 4 tick matches 1 if score 14 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:7b}]}] run give @p[tag=bousou] gold_block{display:{Name:'{"text":"暴走中！！！！","color":"gold","bold":true}'},Unbreakable:1b,Enchantments:[{id:"minecraft:binding_curse",lvl:1s}]} 1
execute if score 4 tick matches 1 if score 14 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:7b}]}] run tellraw @a {"text":"\u66b4\u8d70\u304c\u6b62\u307e\u3089\u306a\u3044\u30fb\u30fb\uff01\u6c17\u3092\u4ed8\u3051\u308d\uff01\uff01","bold":true,"color":"dark_red"}
execute if score 4 tick matches 1 if score 14 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:7b}]}] run effect give @p[tag=bousou] health_boost 1000000 16 true
execute if score 4 tick matches 1 if score 14 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:7b}]}] run effect give @p[tag=bousou] minecraft:regeneration 20 3 true
execute if score 4 tick matches 1 if score 14 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:7b}]}] run scoreboard players set 9 tick 1
execute if score 4 tick matches 1 if score 14 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:7b}]}] run scoreboard players set 19 tick 0
execute if score 4 tick matches 1 if score 14 tick matches 1 as @a[tag=bousou] run scoreboard players set 14 tick 0

execute if score 4 tick matches 1 if score 20 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:9b}]}] run function shuudan:bousou/level5
execute if score 4 tick matches 1 if score 15 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:9b}]}] run clear @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:9}]}] gold_block
execute if score 4 tick matches 1 if score 15 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:9b}]}] run give @p[tag=bousou] diamond_block{display:{Name:'{"text":"暴走中！！！！","color":"gold","bold":true}'},Unbreakable:1b,Enchantments:[{id:"minecraft:binding_curse",lvl:1s}]} 1
execute if score 4 tick matches 1 if score 15 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:9b}]}] run tellraw @a {"text":"\u66b4\u8d70\u304c\u6b62\u307e\u3089\u306a\u3044\u30fb\u30fb\uff01\u6c17\u3092\u4ed8\u3051\u308d\uff01\uff01","bold":true,"color":"black"}
execute if score 4 tick matches 1 if score 15 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:9b}]}] run effect give @p[tag=bousou] health_boost 1000000 19 true
execute if score 4 tick matches 1 if score 15 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:9b}]}] run effect give @p[tag=bousou] minecraft:regeneration 20 3 true
execute if score 4 tick matches 1 if score 15 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:9b}]}] run scoreboard players set 10 tick 1
execute if score 4 tick matches 1 if score 15 tick matches 1 as @a[tag=bousou,nbt={Inventory:[{id:"minecraft:magma_cream",Count:9b}]}] run scoreboard players set 20 tick 0
execute if score 4 tick matches 1 if score 15 tick matches 1 as @a[tag=bousou] run scoreboard players set 15 tick 0

execute if score 4 tick matches 1 as @a[tag=bousou] run scoreboard players add @a[tag=bousou] nigetime 1

execute if score 4 tick matches 1 if score players players matches 1 as @p[tag=bousou] run give @a[tag=bousou] magma_cream{display:{Name:'{"text":"たこやきトークン","color":"gold","bold":true}',Lore:['{"text":"おいしそう","color":"white"}']},Enchantments:[{}],AttributeModifiers:[{AttributeName:"generic.max_health",Name:"generic.max_health",Amount:1,Operation:0,UUID:[I;-1767179414,-1950396937,-1665965454,-2107688778],Slot:"offhand"}]} 64
execute if score 4 tick matches 1 if score players players matches 1 as @p[tag=bousou] run give @a[tag=bousou] magma_cream{display:{Name:'{"text":"たこやきトークン","color":"gold","bold":true}',Lore:['{"text":"おいしそう","color":"white"}']},Enchantments:[{}],AttributeModifiers:[{AttributeName:"generic.max_health",Name:"generic.max_health",Amount:1,Operation:0,UUID:[I;-1767179414,-1950396937,-1665965454,-2107688778],Slot:"offhand"}]} 64
execute if score 4 tick matches 1 if score players players matches 1 as @p[tag=bousou] run scoreboard players add @p[tag=bousou] takoyaki 128
execute if score 4 tick matches 1 if score players players matches 1 as @p[tag=bousou] run scoreboard players operation 最大トークンの数: takoyaki > @s takoyaki
execute if score 4 tick matches 1 if score players players matches 1 as @p[tag=bousou] run function shuudan:finish/finish

execute if score 4 tick matches 1 as @p[tag=bousou] run clear @p[tag=bousou] minecraft:end_crystal 1
execute if score 4 tick matches 1 at @p[tag=bousou] run team join bousou @p[tag=bousou,team=!yuushou]
execute if score 4 tick matches 1 as @p[tag=bousou] run team join yowai @a[tag=!bousou,gamemode=adventure,team=!yuushou]
execute if score 4 tick matches 1 if score game tick matches 0 run scoreboard players set 4 tick 0

execute at @p[tag=bousou,scores={juuden=300}] run give @p[tag=bousou] magma_cream{display:{Name:'{"text":"たこやきトークン","color":"gold","bold":true}',Lore:['{"text":"おいしそう","color":"white"}']},Enchantments:[{}],AttributeModifiers:[{AttributeName:"generic.max_health",Name:"generic.max_health",Amount:1,Operation:0,UUID:[I;-1767179414,-1950396937,-1665965454,-2107688778],Slot:"offhand"}]} 1
execute as @p[tag=bousou,scores={juuden=300}] run scoreboard players add @p[tag=bousou,scores={juuden=300}] takoyaki 1
execute as @p[tag=bousou,scores={juuden=300}] run scoreboard players operation 最大トークンの数: takoyaki > @s takoyaki
execute as @p[tag=bousou,scores={juuden=300}] run scoreboard players add @p[tag=bousou,scores={juuden=300}] bo 1
execute as @p[tag=bousou,scores={juuden=300..}] run scoreboard players set @p[tag=bousou,scores={juuden=300..}] juuden 0
execute at @p[tag=bousou,scores={juuden=299..}] run playsound minecraft:entity.firework_rocket.launch master @p[scores={juuden=299..}]
execute at @p[tag=bousou,scores={juuden=200}] run playsound minecraft:entity.experience_orb.pickup master @p[scores={juuden=200}]
execute at @p[tag=bousou,scores={juuden=100}] run playsound minecraft:entity.experience_orb.pickup master @p[scores={juuden=100}]

clear @a[team=bousou] golden_axe
clear @a[team=bousou] golden_sword
clear @a[team=bousou] bow
clear @a[team=bousou] arrow

execute if score @p[tag=bousou] kill matches 1 run scoreboard players set 5 tick 1
execute if score 5 tick matches 1 run function shuudan:kill/kill