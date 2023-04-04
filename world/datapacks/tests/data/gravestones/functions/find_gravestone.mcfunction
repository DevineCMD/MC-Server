# @s = (any loaded) interaction entity
say find gravestone
# TODO: search for other interaction entities 
# if more interaction entities are found, copy attack&interaction nbt tag to all on the same block so they get triggered too
data modify storage gravestones:data interaction set from entity @s interaction
data modify storage gravestones:data attack set from entity @s attack
tag @s add this
execute at @s as @e[type=interaction,tag=!this,distance=0] run function gravestones:copy_interaction_data
tag @s remove this
# let all loaded item_displays load their respective graveID in the IDs scoreboard for id_match to work. 
# distance is 0.5 because of anchor height of interaction vs. item_display
execute as @e[type=item_display,distance=0.5] run execute store result score @s gravestones.IDs run data get entity @s item.tag.graveID
execute store result score $tempID gravestones.IDs run data get entity @s PortalCooldown
execute on attacker run tag @s add this
execute as @e[type=item_display,predicate=gravestones:id_match] run function gravestones:find_player
tag @a remove this
# execute as the item_display corresponding to this interaction entity: function which tests whether the correct player clicked

#scoreboard players set $test gravestones.Data 0
# bind @s to the player who left clicked on this entity (if any)
#execute on attacker store result score $test gravestones.Data if entity @s[tag=this]
#execute if score $test gravestones.Data matches 1 at @s run particle ash
#execute if score $test gravestones.Data matches 1 run data remove entity @s attack
#execute if score $test gravestones.Data matches 1 run data remove entity @s interaction

execute as @e[type=interaction,distance=..1] run data remove entity @s attack
execute as @e[type=interaction,distance=..1] run data remove entity @s interaction
