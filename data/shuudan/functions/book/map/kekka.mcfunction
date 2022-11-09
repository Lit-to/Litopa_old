scoreboard objectives setdisplay sidebar mapvote
execute as @a[scores={votepl=1}] run scoreboard players add MAP1: mapvote 1
execute as @a[scores={votepl=2}] run scoreboard players add MAP2: mapvote 1
execute as @a[scores={votepl=3}] run scoreboard players add MAP3: mapvote 1
function shuudan:book/tellraw/mapkettei