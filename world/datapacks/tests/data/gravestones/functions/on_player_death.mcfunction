# @s = player who just died
# Saving coordinates to display in chat. This will be done in here until Mojang adds storage support in tellraw.
execute store result score $x gravestones.Deaths run data get entity @s LastDeathLocation.pos[0]
execute store result score $y gravestones.Deaths run data get entity @s LastDeathLocation.pos[1]
execute store result score $z gravestones.Deaths run data get entity @s LastDeathLocation.pos[2]
tellraw @a [{"selector":"@s","bold":true}," ",{"text":"died at ","bold":false}, {"color":"red", "score":{"name":"$x","objective":"gravestones.Deaths"}}, " ", {"color":"green", "score":{"name":"$y","objective":"gravestones.Deaths"}}, " ", {"color":"blue", "score":{"name":"$z","objective":"gravestones.Deaths"}}]
function gravestones:summon_gravestone

# Clean up
advancement revoke @s only gravestones:player_died