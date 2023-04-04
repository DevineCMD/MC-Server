# @s = player who clicked
say triggered

tag @s add this
execute as @e[type=interaction,nbt={attack},limit=1] run function gravestones:find_gravestone
execute as @e[type=interaction,nbt={interaction},limit=1] run function gravestones:find_gravestone
tag @s remove this

# revoke said advancement
advancement revoke @a only gravestones:player_interacted_left
advancement revoke @a only gravestones:player_interacted_right