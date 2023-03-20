# @s = player who just died
# TODO copy items into gravestone instead of storage, then move clear @s accordingly
data modify storage gravestones:holder Items set from entity @s Inventory
clear @s

# Saving coordinates to display in chat. This will be done in here until Mojang adds storage support in tellraw.
## for now, assuming the player died in the overworld. TODO other dimensions
execute as @s[nbt={LastDeathLocation:{dimension:"minecraft:overworld"}}] run function gravestones:death_in_overworld
execute as @s[nbt={LastDeathLocation:{dimension:"minecraft:the_nether"}}] run function gravestones:death_in_nether
execute as @s[nbt={LastDeathLocation:{dimension:"minecraft:the_end"}}] run function gravestones:death_in_end

# Clean up
scoreboard players set @s gravestones.Deaths 0
