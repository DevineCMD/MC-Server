# TODO copy items into gravestone instead of storage, then move clear @s accordingly
data modify storage gravestones:holder Items set from entity @s Inventory
clear @s

# Saving coordinates to display in chat
## for now, assuming the player died in the overworld. TODO other dimensions
execute store result score $x gravestones_deaths run data get entity @s LastDeathLocation{dimension:"minecraft:overworld"}.pos[0]
execute store result score $y gravestones_deaths run data get entity @s LastDeathLocation{dimension:"minecraft:overworld"}.pos[1]
execute store result score $z gravestones_deaths run data get entity @s LastDeathLocation{dimension:"minecraft:overworld"}.pos[2]
tellraw @a [{"selector":"@s","bold":true}," ",{"text":"died at ","bold":false}, {"color":"red", "score":{"name":"$x","objective":"gravestones_deaths"}}, " ", {"color":"green", "score":{"name":"$y","objective":"gravestones_deaths"}}, " ", {"color":"blue", "score":{"name":"$z","objective":"gravestones_deaths"}}]

# Actually summon gravestone
## TODO insert ids, timestamp etc
summon minecraft:item_display 0 -10 0 {item:{id:"minecraft:stick",Count:1b,tag:{CustomModelData:1}},brightness:{sky:15,block:15},Tags:[fresh]}
## Maybe possible with two commands. One for saving all pos, one for writing all pos. But LastDeathLocation saves ints. :/
execute store result storage gravestones:death_pos x double 1 run data get entity @s LastDeathLocation{dimension:"minecraft:overworld"}.pos[0]
execute store result storage gravestones:death_pos y double 1 run data get entity @s LastDeathLocation{dimension:"minecraft:overworld"}.pos[1]
execute store result storage gravestones:death_pos z double 1 run data get entity @s LastDeathLocation{dimension:"minecraft:overworld"}.pos[2]
execute as @e[type=item_display,tag=fresh,limit=1] at @e[type=item_display,tag=fresh,limit=1] run function gravestones:new_grave

# Clean up
scoreboard players set @s gravestones_deaths 0
