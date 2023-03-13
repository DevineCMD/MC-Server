# @s = item_display with gravestone stick item
say new grave
# Write gametime into gravestone to recognize interaction entity later.
execute store result storage gravestones:data gametime long 1 run time query gametime
data modify entity @e[type=minecraft:item_display,tag=fresh,limit=1] item.tag.gametime set from storage gravestones:data gametime
# Move gravestone to player death position. TODO forceload chunks like in Oyster's datapack
data modify entity @s Pos[0] set from storage gravestones:data deathX
data modify entity @s Pos[1] set from storage gravestones:data deathY
data modify entity @s Pos[2] set from storage gravestones:data deathZ
execute at @s run tp @s ~.5 ~.5 ~.5
# TODO create interaction
tag @s remove fresh