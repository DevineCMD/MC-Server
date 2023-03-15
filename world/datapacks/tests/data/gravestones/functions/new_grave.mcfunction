# @s = item_display with gravestone stick item
say new grave
# Write gametime into gravestone to recognize interaction entity later.
execute store result storage gravestones:data gametime long 1 run time query gametime
data modify entity @s item.tag.gametime set from storage gravestones:data gametime
## copy own saved id (related to creator/player) to temp variable to be able to use id_match predicate to search for player
scoreboard players operation $tempID gravestones_ids = @s gravestones_ids
say I was found by
execute as @a[predicate=gravestones:id_match] run say me! 
# Move gravestone to player death position. TODO forceload chunks like in Oyster's datapack
execute store result entity @s Pos[0] double 1 run data get entity @a[predicate=gravestones:id_match,limit=1] LastDeathLocation{dimension:"minecraft:overworld"}.pos[0]
execute store result entity @s Pos[1] double 1 run data get entity @a[predicate=gravestones:id_match,limit=1] LastDeathLocation{dimension:"minecraft:overworld"}.pos[1]
execute store result entity @s Pos[2] double 1 run data get entity @a[predicate=gravestones:id_match,limit=1] LastDeathLocation{dimension:"minecraft:overworld"}.pos[2]
execute at @s run tp @s ~.5 ~.5 ~.5
# TODO create interaction
tag @s remove fresh