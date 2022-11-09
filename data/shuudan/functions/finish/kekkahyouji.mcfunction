execute as @a if score 最大トークンの数: takoyaki = @s takoyaki run team join yuushou @s
scoreboard objectives setdisplay sidebar takoyaki
title @a title {"selector":"@a[team=yuushou]"}
tellraw @a [{"selector":"@a[team=yuushou]"},{"text":"\u3055\u3093\u306e\u52dd\u5229\uff01\uff01","bold":true,"color":"dark_red"}]
effect give @a[team=yuushou] glowing 10000 255 true