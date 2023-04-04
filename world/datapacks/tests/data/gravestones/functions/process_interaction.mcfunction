# @s = interaction entity that has not been clicked
say copy interaction data
data modify entity @s interaction set from storage gravestones:data interaction
data modify entity @s attack set from storage gravestones:data attack

# let all loaded item_displays load their respective graveID in the IDs scoreboard for id_match to work. 
# distance is 0.5 because of anchor height of interaction vs. item_display
execute as @e[type=item_display,distance=0.5] run execute store result score @s gravestones.IDs run data get entity @s item.tag.graveID
# load graveID (saved in PortalCooldown as only possibility) into $tempID to find the grave corresponding to this interaction entity
execute store result score $tempID gravestones.IDs run data get entity @s PortalCooldown
# prepare player to be found
execute on attacker run tag @s add this
execute on target run tag @s add this
# find player based on them being the interacted entity as well as the playerID saved in the gravestone (item_display)
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