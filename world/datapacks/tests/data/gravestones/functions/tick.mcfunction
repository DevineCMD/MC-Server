setblock 43 79 -86 minecraft:acacia_log
# Add glowing when needed
execute as @e[type=item_display, tag=grave] run data modify entity @s Glowing set value 0
execute as @e[type=item_display, tag=grave] at @s unless block ~ ~ ~ air run data modify entity @s Glowing set value 1