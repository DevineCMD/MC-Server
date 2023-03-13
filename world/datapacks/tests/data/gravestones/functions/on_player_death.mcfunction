# TODO copy items into gravestone instead of storage, then move clear @s accordingly
data modify storage gravestones:holder Items set from entity @s Inventory
clear @s

# Saving coordinates to display in chat
## for now, assuming the player died in the overworld. TODO other dimensions
execute store result score $x gravestones run data get entity @s LastDeathLocation{dimension:"minecraft:overworld"}.pos[0]
execute store result score $y gravestones run data get entity @s LastDeathLocation{dimension:"minecraft:overworld"}.pos[1]
execute store result score $z gravestones run data get entity @s LastDeathLocation{dimension:"minecraft:overworld"}.pos[2]
tellraw @a [{"selector":"@s","bold":true}," ",{"text":"died at ","bold":false}, {"color":"red", "score":{"name":"$x","objective":"gravestones"}}, " ", {"color":"green", "score":{"name":"$y","objective":"gravestones"}}, " ", {"color":"blue", "score":{"name":"$z","objective":"gravestones"}}]

# Actually summon gravestone
## TODO insert ids, timestamp etc
summon minecraft:item_display 0 -10 0 {item:{id:"minecraft:stick",Count:1b,tag:{CustomModelData:1,gametime:-1L,uuid0:-1}},brightness:{sky:15,block:15},shadow_radius:0.45f,shadow_strength:0.8f,Tags:["grave","fresh"]}
## Write UUID into gravestone to recognize player. Grab only the first part as more is not neccessary, probably.
data modify entity @e[type=minecraft:item_display,tag=fresh,limit=1] item.tag.UUID0 set from entity @s UUID[0]
## Maybe possible with two commands. One for saving all pos, one for writing all pos. But LastDeathLocation saves ints. :/
execute store result storage gravestones:data deathX double 1 run data get entity @s LastDeathLocation{dimension:"minecraft:overworld"}.pos[0]
execute store result storage gravestones:data deathY double 1 run data get entity @s LastDeathLocation{dimension:"minecraft:overworld"}.pos[1]
execute store result storage gravestones:data deathZ double 1 run data get entity @s LastDeathLocation{dimension:"minecraft:overworld"}.pos[2]
execute as @e[type=item_display,tag=fresh,limit=1] run function gravestones:new_grave

# Clean up
scoreboard players set @s gravestones 0
