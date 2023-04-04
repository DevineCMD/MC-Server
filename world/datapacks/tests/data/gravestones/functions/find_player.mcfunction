# @s = item_display of an interaction entity being in the SAME block that just has been clicked by ANY player
execute store result score $tempID gravestones.IDs run data get entity @s item.tag.playerID
execute if entity @a[predicate=gravestones:id_match] run say FOUND @a[predicate=gravestones:id_match]