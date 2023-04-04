tellraw @a {"text": "LOADED (v.0.4)", "color": "#961DFB"}
# TODO: test with multiple people dying in the same tick. If any bugs occur, we might need to split "gravestones" into multiple scoreboards.
scoreboard objectives add gravestones.Data dummy
scoreboard objectives add gravestones.IDs dummy
# Set up $nextPlayerID variable to be able to give IDs to gravestones, unless such a variable is already present.
execute unless score $nextPlayerID gravestones.IDs matches 0.. run scoreboard players set $nextPlayerID gravestones.IDs 0
# Set up $nextGravestoneID variable to ID graves. Used to create a link between the interaction and display entity of a specific grave.
execute unless score $nextGravestoneID gravestones.IDs matches 0.. run scoreboard players set $nextGravestoneID gravestones.IDs 0
gamerule keepInventory true