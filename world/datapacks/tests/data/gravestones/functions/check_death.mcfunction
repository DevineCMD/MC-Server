setblock 43 79 -85 minecraft:stone
execute if score @s deaths > @s deathsBuffer run function gravestones:on_player_death