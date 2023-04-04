# @s = item_display of an interaction entity being in the SAME block that just has been clicked by ANY player
say find player
execute store result score $tempID gravestones.IDs run data get entity @s item.tag.playerID
execute if entity @a[predicate=gravestones:id_match,tag=this] run say FOUND @a[predicate=gravestones:id_match]