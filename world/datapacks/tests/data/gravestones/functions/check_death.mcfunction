setblock 43 79 -85 minecraft:stone
execute if entity @a[scores={deaths=1..}] run function gravestones:on_player_death