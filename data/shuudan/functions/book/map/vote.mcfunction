execute at @a[scores={voteok=0}] if score @s votepl matches 1 run scoreboard players add MAP1: 1
execute at @a[scores={voteok=0}] if score @s votepl matches 2 run scoreboard players add MAP2: 1
execute at @a[scores={voteok=0}] if score @s votepl matches 3 run scoreboard players add MAP3: 1
execute at @a[scores={voteok=0}] if score @s votepl matches 1.. run playsound entity.player.levelup master @s ~ ~ ~
execute at @a[scores={voteok=0}] if score @s votepl matches 1.. run scoreboard players set @s voteok 1