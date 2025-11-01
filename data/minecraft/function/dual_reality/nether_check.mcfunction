execute if predicate minecraft:in_structure/fortress run scoreboard players add @s bacaped_in_struct_summary 1
execute if predicate minecraft:in_structure/bastion run scoreboard players add @s bacaped_in_struct_summary 1
execute if predicate minecraft:in_structure/ruined_portal run scoreboard players add @s bacaped_in_struct_summary 1

execute if score @s bacaped_in_struct_summary matches 2.. run advancement grant @s only minecraft:adventure/dual_reality