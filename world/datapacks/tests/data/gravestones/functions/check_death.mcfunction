setblock 44 79 -82 minecraft:redstone_block
execute if score @s deaths > @s deathsBuffer run function gravestones:on_player_death