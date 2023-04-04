# @s = gravestone TODO call this via advancement
say triggered
# Write saved UUID to scoreboard to be able to use id_match scoreboard
execute store result score $tempID gravestones.Deaths run data get entity @s item.tag.playerID
# find player via UUID match
say Found @a[predicate=gravestones:id_match] with my id
# TODO advancement revoke said advancement
advancement revoke @a only gravestones:player_interacted_left
advancement revoke @a only gravestones:player_interacted_right