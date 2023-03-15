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

### BIG TODO HERE, ONLY KEEP ONE OF THESE
## Write ID into gravestone to recognize player. Store next available ID into scoreboard. How does it recognize the player then? (+performance?)
execute store result score @e[type=minecraft:item_display,tag=fresh,limit=1] gravestones_ids run scoreboard players add $nextID gravestones_ids 1
# TODO OR store next available ID into entity. How does it recognize the player then?
execute store result entity @e[type=minecraft:item_display,tag=fresh,limit=1] item.tag.id int 1 run scoreboard players add $nextID gravestones_ids 1
# TODO OR grab last part of UUID of player (apparently this is the most random single part of a UUID?)
data modify entity @e[type=minecraft:item_display,tag=fresh,limit=1] item.tag.UUID3 set from entity @s UUID[3]

# Add gravestone id (scoreboard) of corresponding player to this gravestone
execute store result score @e[type=minecraft:item_display,tag=fresh,limit=1] gravestones_ids run scoreboard players get @s gravestones_ids
# Execute setup commands as gravestone (item_display)
execute as @e[type=item_display,tag=fresh,limit=1] run function gravestones:new_grave

# Clean up
scoreboard players set @s gravestones 0
