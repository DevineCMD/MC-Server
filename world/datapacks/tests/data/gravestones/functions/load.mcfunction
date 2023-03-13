tellraw @a {"text": "LOADED (v.0.2)", "color": "#961DFB"}
# TODO test with multiple people dying in the same tick. If any bugs occur, we might need to split "gravestones" into multiple scoreboards.
scoreboard objectives add gravestones deathCount
scoreboard objectives add gravestones_ids dummy
gamerule keepInventory true