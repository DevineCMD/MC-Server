setblock 43 79 -85 minecraft:stone
execute as @a[scores={gravestones.Deaths=1..}] at @s run function gravestones:on_player_death