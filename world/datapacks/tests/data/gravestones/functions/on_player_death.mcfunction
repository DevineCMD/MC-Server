# @s = player who died
# TODO copy items into gravestone instead of storage, then move clear @s accordingly
data modify storage gravestones:holder Items set from entity @s Inventory
clear @s

# Saving coordinates to display in chat. This will be done in here until Mojang adds storage support in tellraw.
## for now, assuming the player died in the overworld. TODO other dimensions
execute store result score $x gravestones.Deaths run data get entity @s LastDeathLocation{dimension:"minecraft:overworld"}.pos[0]
execute store result score $y gravestones.Deaths run data get entity @s LastDeathLocation{dimension:"minecraft:overworld"}.pos[1]
execute store result score $z gravestones.Deaths run data get entity @s LastDeathLocation{dimension:"minecraft:overworld"}.pos[2]
tellraw @a [{"selector":"@s","bold":true}," ",{"text":"died at ","bold":false}, {"color":"red", "score":{"name":"$x","objective":"gravestones.Deaths"}}, " ", {"color":"green", "score":{"name":"$y","objective":"gravestones.Deaths"}}, " ", {"color":"blue", "score":{"name":"$z","objective":"gravestones.Deaths"}}]

# Actually summon gravestone. Set temporary attributes in item.tag to see errors more clearly (-1 as error value).
## TODO forceload chunk if needed ("execute unless loaded")
summon minecraft:item_display 0 -10 0 {item:{id:"minecraft:stick",Count:1b,tag:{CustomModelData:1,graveID:-1,playerID:-1}},brightness:{sky:15,block:15},shadow_radius:0.45f,shadow_strength:0.8f,Tags:["grave","fresh"]}

# Give player an ID unless they already have one. Update next available ID in the same command for the next use.
execute unless entity @s[scores={gravestones.IDs=0..}] store result score @s gravestones.IDs run scoreboard players add $nextPlayerID gravestones.IDs 1
# Copy that same ID into display entity. We're copying it into NBT instead of the score so when the entity's chunk unloads, it's data isn't in RAM, too.
## Alternatively, this could be done by saving this data into storage, then writing it to the entity in new_grave via @s to possibly save performance. Idk.
execute store result entity @e[type=item_display,tag=fresh,limit=1] item.tag.playerID int 1 run scoreboard players get @s gravestones.IDs

# Execute setup commands as gravestone (item_display)
execute as @e[type=item_display,tag=fresh,limit=1] run function gravestones:new_grave

# Clean up
scoreboard players set @s gravestones.Deaths 0
