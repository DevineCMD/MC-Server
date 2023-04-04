# @s = (any loaded) interaction entity
say find gravestone
# TODO: search for other interaction entities 
# if more interaction entities are found, copy attack&interaction nbt tag to all on the same block so they get triggered too
data modify storage gravestones:data interaction set from entity @s interaction
data modify storage gravestones:data attack set from entity @s attack
execute at @s as @e[type=interaction,distance=0] run function gravestones:process_interaction

