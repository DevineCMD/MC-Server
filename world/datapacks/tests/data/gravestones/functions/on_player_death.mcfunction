execute store result score @s tempX run data get entity @s Pos[0]
execute store result score @s tempY run data get entity @s Pos[1]
execute store result score @s tempZ run data get entity @s Pos[2]
tellraw @a ["",{"selector":"@s","bold":true}," ",{"text":"died at ","bold":false}, {"score":{"name":"@s","objective":"tempX"}}, " ", {"score":{"name":"@s","objective":"tempY"}}, " ", {"score":{"name":"@s","objective":"tempZ"}}]
scoreboard players operation @s deathsBuffer > @s deaths