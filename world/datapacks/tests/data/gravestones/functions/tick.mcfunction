setblock 43 79 -86 minecraft:acacia_log
execute at @a as @p run function gravestones:check_death
tellraw @a[tag=temp] "Test2"