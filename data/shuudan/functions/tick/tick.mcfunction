execute if score 1 tick matches 1 run scoreboard players remove kaisi tick 1
execute if score 1 tick matches 1 run scoreboard players operation 開始まで: time = kaisi tick
execute if score 1 tick matches 1 run scoreboard players operation 開始まで: time /= 20 20
execute if score 1 tick matches 1 if score kaisi tick matches 1 run function shuudan:main/main
execute if score 1 tick matches 1 if score kaisi tick matches 1 run scoreboard players set 4 tick 1
execute if score 1 tick matches 1 if score kaisi tick matches 1 run scoreboard players set 16 tick 1
execute if score 1 tick matches 1 if score kaisi tick matches 1 run scoreboard players set 17 tick 1
execute if score 1 tick matches 1 if score kaisi tick matches 1 run scoreboard players set 18 tick 1
execute if score 1 tick matches 1 if score kaisi tick matches 1 run scoreboard players set 19 tick 1
execute if score 1 tick matches 1 if score kaisi tick matches 1 run scoreboard players set 20 tick 1
execute if score 1 tick matches 1 if score kaisi tick matches 1 run scoreboard players set @a juuden 0
execute if score 1 tick matches 1 if score kaisi tick matches 1 run scoreboard players reset 開始まで: time
execute if score 1 tick matches 1 if score kaisi tick matches 1 run scoreboard players set 1 tick 0

#ロビー
#execute if score Map: settime matches 1 at @e[tag=finish] run scoreboard players set @a[distance=..10] lobby 1
#execute if score Map: settime matches 1 at @e[tag=finish] run scoreboard players set @a[distance=10..] lobby 0
#execute if score Map: settime matches 2 at @e[tag=lobby2] run scoreboard players set @a[distance=..10] lobby 1
#execute if score Map: settime matches 2 at @e[tag=lobby2] run scoreboard players set @a[distance=10..] lobby 0
#execute if score Map: settime matches 3 at @e[tag=lobby3] run scoreboard players set @a[distance=..10] lobby 1
#execute if score Map: settime matches 3 at @e[tag=lobby3] run scoreboard players set @a[distance=10..] lobby 0
#矢
kill @e[type=minecraft:spectral_arrow,nbt={inGround:1b}]

execute at @e[tag=adv] run gamemode adventure @a[gamemode=spectator,distance=..1,limit=1]
execute if score Map: settime matches 1 at @e[tag=adv] run tp @a[distance=..1,limit=1] @e[tag=finish,limit=1]
execute if score Map: settime matches 2 at @e[tag=adv] run tp @a[distance=..1,limit=1] @e[tag=lobby2,limit=1]
execute if score Map: settime matches 3 at @e[tag=adv] run tp @a[distance=..1,limit=1] @e[tag=lobby3,limit=1]
execute if score Map: settime matches 4 at @e[tag=adv] run tp @a[distance=..1,limit=1] @e[tag=lobby4,limit=1]

effect give @a[team=saisho] minecraft:saturation 1 255 true
effect give @a[team=saisho] minecraft:resistance 1 255 true
#tag @p[gamemode=creative] add lit_to
#execute as @p[tag=lit_to,gamemode=adventure] run tag @p[tag=lit_to] remove lit_to
execute as @a[gamemode=creative,tag=!admin] run function shuudan:reset/admin
team join admin @a[tag=admin]
#team join saisho @a[gamemode=spectator,tag=!admin,team=!yuushou]
execute as @a[gamemode=adventure] run tellraw @s[tag=admin] {"text":"\u53c2\u52a0\u8005\u306b\u306a\u308a\u307e\u3057\u305f","color":"aqua"}
execute as @a[gamemode=adventure,tag=admin] run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~
execute as @a[gamemode=adventure] run tag @s[tag=admin] remove admin
team leave @a[tag=!admin,team=admin]
#execute if score Map: settime matches 1 at @e[tag=finish] run team join saisho @a[distance=..10,gamemode=adventure,team=!yuushou]
#execute if score Map: settime matches 1 at @e[tag=lobby1] run team join saisho @a[distance=..10,gamemode=adventure,team=!yuushou]
#execute if score Map: settime matches 1 at @e[tag=lobby2] run team join saisho @a[distance=..10,gamemode=adventure,team=!yuushou]
team join saisho @a[gamemode=adventure,team=!yuushou,team=!admin,team=!yowai,team=!bousou]
#function shuudan:book/map/vote