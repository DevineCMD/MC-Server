setblock 43 79 -83 minecraft:stone
execute if score @s deaths > @s deathsBuffer run function gravestones:on_player_death