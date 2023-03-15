tellraw @a {"text": "LOADED (v.0.2)", "color": "#961DFB"}
# TODO test with multiple people dying in the same tick. If any bugs occur, we might need to split "gravestones" into multiple scoreboards.
scoreboard objectives add gravestones deathCount
scoreboard objectives add gravestones_ids dummy
# Set up $nextID variable to be able to give IDs to gravestones, unless such a variable is already present.
execute unless score $nextID gravestones_ids matches 0.. run scoreboard players set $nextID gravestones_ids 0
gamerule keepInventory true