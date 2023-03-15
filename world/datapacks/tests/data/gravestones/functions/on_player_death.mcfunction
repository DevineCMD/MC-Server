# @s = player who died
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
## TODO forceload chunk if needed ("execute unless loaded")
summon minecraft:item_display 0 -10 0 {item:{id:"minecraft:stick",Count:1b,tag:{CustomModelData:1,gametime:-1L,id:-1}},brightness:{sky:15,block:15},shadow_radius:0.45f,shadow_strength:0.8f,Tags:["grave","fresh"]}

## Write ID into gravestone to recognize player unless they already have an ID. Update next available ID in the same command for the next use.
execute unless entity @s[scores={gravestones_ids=0..}] store result score @s gravestones_ids run scoreboard players add $nextID gravestones_ids 1
## Copy ID from player into display entity. We're copying it into NBT instead of the score so when the entity's chunk unloads, it doesn't use up data.
execute store result entity @e[type=minecraft:item_display,tag=fresh,limit=1] item.tag.id int 1 run scoreboard players get @s gravestones_ids
## TODO Prepare grave ID by using the player's ID and the gametime, see line 4 in new_grave


# Execute setup commands as gravestone (item_display)
execute as @e[type=item_display,tag=fresh,limit=1] run function gravestones:new_grave

# Clean up
scoreboard players set @s gravestones 0
