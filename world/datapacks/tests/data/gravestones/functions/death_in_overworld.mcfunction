# @s = player who just died
execute store result score $x gravestones.Deaths run data get entity @s LastDeathLocation{dimension:"minecraft:overworld"}.pos[0]
execute store result score $y gravestones.Deaths run data get entity @s LastDeathLocation{dimension:"minecraft:overworld"}.pos[1]
execute store result score $z gravestones.Deaths run data get entity @s LastDeathLocation{dimension:"minecraft:overworld"}.pos[2]
execute if entity @s[nbt={LastDeathLocation:{dimension:"minecraft:overworld"}}] run tellraw @a [{"selector":"@s","bold":true}," ",{"text":"died at ","bold":false}, {"color":"red", "score":{"name":"$x","objective":"gravestones.Deaths"}}, " ", {"color":"green", "score":{"name":"$y","objective":"gravestones.Deaths"}}, " ", {"color":"blue", "score":{"name":"$z","objective":"gravestones.Deaths"}}]
execute in minecraft:overworld run function gravestones:summon_gravestone
