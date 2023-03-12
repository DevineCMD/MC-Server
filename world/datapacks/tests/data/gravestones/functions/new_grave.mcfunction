say new grave
# @s = item_display with gravestone stick item
data modify entity @s Pos[0] set from storage gravestones:death_pos x
data modify entity @s Pos[1] set from storage gravestones:death_pos y
data modify entity @s Pos[2] set from storage gravestones:death_pos z
execute at @s run tp @s ~.5 ~.5 ~.5
# TODO create interaction
tag @s remove fresh