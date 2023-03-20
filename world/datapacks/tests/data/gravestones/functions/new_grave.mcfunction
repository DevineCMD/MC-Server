# @s = item_display with gravestone stick item
say [DEBUG] new grave created
# Give grave an ID so the interaction and display entities can find each other, even if two graves are on the same block.
execute store result entity @s item.tag.graveID int 1 run scoreboard players add $nextGravestoneID gravestones.IDs 1

# Copy own saved id (related to creator/player) to temp variable to be able to use id_match predicate to search for player
execute store result score $tempID gravestones.IDs run data get entity @s item.tag.playerID

# Move gravestone to player death position. @a[predicate=gravestones:id_match,limit=1] => the player this grave belongs to
execute store result entity @s Pos[0] double 1 run data get entity @a[predicate=gravestones:id_match,limit=1] LastDeathLocation.pos[0]
execute store result entity @s Pos[1] double 1 run data get entity @a[predicate=gravestones:id_match,limit=1] LastDeathLocation.pos[1]
execute store result entity @s Pos[2] double 1 run data get entity @a[predicate=gravestones:id_match,limit=1] LastDeathLocation.pos[2]
execute at @s run tp @s ~.5 ~.5 ~.5

# TODO create interaction
# Reset tempID to be sure the player won't be found outside of this context. Not really needed but still.
scoreboard players reset $tempID gravestones.IDs
tag @s remove fresh
