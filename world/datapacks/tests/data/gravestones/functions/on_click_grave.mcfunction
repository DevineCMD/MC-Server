# @s = player who clicked
say triggered

tag @s add this
execute as @e[type=interaction] store success score @s gravestones.Data run data get entity @s attack
execute as @e[type=interaction] if score @s gravestones.Data matches 0 store success score @s gravestones.Data run data get entity @s interaction
execute as @e[type=interaction,scores={gravestones.Data=1},limit=1] run function gravestones:find_gravestone
tag @s remove this

# revoke said advancement
advancement revoke @a only gravestones:player_interacted_left
advancement revoke @a only gravestones:player_interacted_right