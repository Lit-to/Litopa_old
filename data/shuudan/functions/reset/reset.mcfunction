gamemode adventure @a[tag=!admin]
tag @a remove bousou
tag @a remove bousou1
tag @a remove bousou2
tag @a remove bousou3
tag @a remove bousou4
tag @a remove bousou5
effect clear @a[gamemode=adventure]
effect give @a[gamemode=adventure] minecraft:saturation 10 255 true
effect give @a[gamemode=adventure] minecraft:instant_health 10 255 true
clear @a[gamemode=adventure]
execute at @e[tag=chest] run setblock ~ ~ ~ chest
execute at @e[tag=chest2] run setblock ~ ~ ~ chest
execute at @e[tag=chest3] run setblock ~ ~ ~ chest
execute at @e[tag=chest4] run setblock ~ ~ ~ chest
execute at @e[tag=finish,limit=1] run spawnpoint @a ~ ~ ~
execute at @e[tag=lobby2,limit=1] run spawnpoint @a ~ ~ ~
execute at @e[tag=lobby3,limit=1] run spawnpoint @a ~ ~ ~
execute at @e[tag=lobby4,limit=1] run spawnpoint @a ~ ~ ~

#スコアチーム削除
scoreboard objectives remove tick
scoreboard objectives remove juuden
scoreboard objectives remove 20
scoreboard objectives remove 0
scoreboard objectives remove yuushou
scoreboard objectives remove kill
scoreboard objectives remove motteru
scoreboard objectives remove 0
scoreboard objectives remove kekka
scoreboard objectives remove yuushou
scoreboard objectives remove takoyaki
scoreboard objectives remove bonus
scoreboard players reset 残り時間: time
scoreboard players reset 開始まで: time
scoreboard objectives remove bo
scoreboard objectives remove mapvote
scoreboard objectives remove votepl
scoreboard objectives remove nigetime
scoreboard objectives remove players
scoreboard objectives remove lobby
team remove bousou
team remove yowai
team remove saisho
team remove yuushou
#
#つくりなおし
scoreboard objectives add tick dummy
scoreboard objectives add juuden minecraft.custom:minecraft.sneak_time
scoreboard objectives add 20 dummy
scoreboard players set 100 20 100
scoreboard players set 70 20 70
scoreboard players set 50 20 50
scoreboard players set 30 20 30
scoreboard players set 20 20 20
scoreboard players set 10 20 10
scoreboard players set 9 20 9
scoreboard players set 8 20 8
scoreboard players set 7 20 7
scoreboard players set 6 20 6
scoreboard players set 5 20 5
scoreboard players set 4 20 4
scoreboard players set 3 20 3
scoreboard players set 2 20 2
scoreboard players set 1 20 1

#
scoreboard objectives add 0 dummy
scoreboard objectives add kill killedByTeam.dark_green
scoreboard objectives add motteru dummy
scoreboard objectives add 0 dummy
scoreboard players add 0 0 0
scoreboard objectives add kekka dummy
scoreboard objectives add yuushou dummy {"text":"\uff70\u30fb-\u30fb\uff70\u7d50\u679c\u30b9\u30b3\u30a2\uff70\u30fb-\u30fb\uff70","bold":true,"color":"aqua"}
scoreboard objectives add lobby dummy
scoreboard objectives add bonus teamkill.gold
scoreboard objectives add takoyaki dummy {"text":"\u305f\u3053\u3084\u304d\u30c8\u30fc\u30af\u30f3","bold":true,"color":"gold"}
scoreboard players set 最大トークンの数: takoyaki 0
scoreboard players set @a takoyaki 0
scoreboard objectives add settime dummy {"text":"\u30fc\u30fb\uff0d\u6642\u9593\u30fc\u30fb\uff0d","bold":true,"color":"gold"}
scoreboard objectives setdisplay sidebar settime
scoreboard objectives setdisplay sidebar.team.green settime
scoreboard objectives add bo dummy
scoreboard players set @a bo 0
scoreboard players operation res_chest tick = 補充時間: settime
scoreboard players operation res_chest tick *= 20 20
scoreboard players operation chest tick = res_chest tick
scoreboard players set 補充まで: time 0
scoreboard objectives add mapvote dummy {"text":"\u25a0\u25a1\u25a0MAP\u6295\u7968\u25a0\u25a1\u25a0"}
scoreboard objectives add votepl trigger
scoreboard objectives add nigetime dummy
scoreboard objectives add players dummy
scoreboard players set players players 0
function shuudan:time/set
scoreboard objectives add lobby dummy
#
#
team add saisho
team modify saisho color red
#team join saisho @a[gamemode=adventure,scores={lobby=1}]
team modify saisho friendlyFire false
#
team add bousou
team modify bousou color gold
team modify bousou nametagVisibility hideForOtherTeams
team modify bousou friendlyFire true
#
team add yowai
team modify yowai color dark_green
team modify yowai nametagVisibility hideForOtherTeams
team modify yowai friendlyFire false
#
team add admin
team modify admin color green
#
team add yuushou
team modify yuushou color gold

#gamerule
gamerule keepInventory true
gamerule spectatorsGenerateChunks false
gamerule announceAdvancements false
gamerule doImmediateRespawn true
gamerule doTileDrops false
gamerule doEntityDrops false
#
#チェスト設定
kill @e[type=armor_stand]
execute if score Map: settime matches 1 run function shuudan:setchest/map1
execute if score Map: settime matches 2 run function shuudan:setchest/map2
execute if score Map: settime matches 3 run function shuudan:setchest/map3
execute if score Map: settime matches 4 run function shuudan:setchest/map4

#スポーン設定
execute if score Map: settime matches 1 at @e[tag=finish] run setworldspawn ~ ~ ~
execute if score Map: settime matches 2 at @e[tag=lobby2] run setworldspawn ~ ~ ~
execute if score Map: settime matches 3 at @e[tag=lobby3] run setworldspawn ~ ~ ~
execute if score Map: settime matches 4 at @e[tag=lobby4] run setworldspawn ~ ~ ~
#
#tp
execute if score Map: settime matches 1 at @e[tag=finish] run tp @a[gamemode=adventure] ~ ~ ~
execute if score Map: settime matches 2 at @e[tag=lobby2] run tp @a[gamemode=adventure] ~ ~ ~
execute if score Map: settime matches 3 at @e[tag=lobby3] run tp @a[gamemode=adventure] ~ ~ ~
execute if score Map: settime matches 4 at @e[tag=lobby4] run tp @a[gamemode=adventure] ~ ~ ~

#アナウンス
tellraw @a {"text":"\u30b2\u30fc\u30e0\u3092\u30ea\u30bb\u30c3\u30c8\u3057\u307e\u3057\u305f","bold":true,"color":"yellow"}
tellraw @s ["",{"text":"=======\u308a\u3068\u305f\u3053\u3071========","bold":true},{"text":"\n"},{"text":">>\u6642\u9593\u3092\u8a2d\u5b9a\u3059\u308b<<","color":"red","clickEvent":{"action":"run_command","value":"/function shuudan:book/tellraw/time"}},{"text":"\n","color":"red"},{"text":">>\u30b2\u30fc\u30e0\u30ea\u30bb\u30c3\u30c8<<","color":"red","clickEvent":{"action":"run_command","value":"/function shuudan:book/map/kekka"}},{"text":"\n\n"},{"text":">>\u30a8\u30cd\u30eb\u30ae\u30fc\u3078\u98db\u3076<<","color":"dark_purple","clickEvent":{"action":"run_command","value":"/tp @s @e[tag=crystal,limit=1]"}},{"text":"\n","color":"dark_purple"},{"text":">>\u30d2\u30e2\u306b\u98db\u3076<<","color":"dark_purple","clickEvent":{"action":"run_command","value":"/tp @s @e[tag=lead,limit=1]"}},{"text":"\n\n"},{"text":">>\u904b\u55b6\u306b\u306a\u308b<<","color":"green","clickEvent":{"action":"run_command","value":"/gamemode creative @s"}},{"text":"\n"},{"text":">>\u53c2\u52a0\u8005\u306b\u306a\u308b<<","color":"aqua","clickEvent":{"action":"run_command","value":"/gamemode adventure @s"}},{"text":"\n\n"},{"text":">>\u30b2\u30fc\u30e0\u3092\u59cb\u3081\u308b<<","color":"dark_red","clickEvent":{"action":"run_command","value":"/function shuudan:a/a"}},{"text":"\n\n"},{"text":">>\u9014\u4e2d\u7d4c\u904e<<","color":"gold","clickEvent":{"action":"run_command","value":"/scoreboard objectives setdisplay sidebar.team.green takoyaki"}},{"text":"\n"},{"text":">>\u6642\u9593\u8868\u793a<<","color":"gold","clickEvent":{"action":"run_command","value":"/scoreboard objectives setdisplay sidebar.team.green time"}},{"text":"\n"},{"text":"=======\u308a\u3068\u305f\u3053\u3071========","bold":true},{"text":"\n "}]
playsound minecraft:entity.player.levelup master @a ~ ~ ~
tag @p[tag=lit_to] remove lit_to

#アイテムキル
kill @e[type=item]