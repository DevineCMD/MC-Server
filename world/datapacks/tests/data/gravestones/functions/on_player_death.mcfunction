say ondeath
data modify storage holder Items set from entity @s Inventory
clear @s
execute store result score @s tempX run data get entity @s Pos[0]
execute store result score @s tempY run data get entity @s Pos[1]
execute store result score @s tempZ run data get entity @s Pos[2]
tellraw @a ["",{"selector":"@s","bold":true}," ",{"text":"died at ","bold":false}, {"color":"red", "score":{"name":"@s","objective":"tempX"}}, " ", {"color":"green", "score":{"name":"@s","objective":"tempY"}}, " ", {"color":"blue", "score":{"name":"@s","objective":"tempZ"}}]
scoreboard players set @s deaths 0