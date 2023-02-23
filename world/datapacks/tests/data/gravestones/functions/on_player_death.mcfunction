execute store result score @s tempX run data get entity @s Pos[0]
execute store result score @s tempY run data get entity @s Pos[1]
execute store result score @s tempZ run data get entity @s Pos[2]
tellraw @a ["",{"selector":"@s","bold":true}," ",{"text":"died at ","bold":false}, {"color":"red", "score":{"name":"@s","objective":"tempX"}}, " ", {"color":"green", "score":{"name":"@s","objective":"tempY"}}, " ", {"color":"blue", "score":{"name":"@s","objective":"tempZ"}}]
execute at @s run summon armor_stand ~ ~ ~
scoreboard players set @s deaths 0