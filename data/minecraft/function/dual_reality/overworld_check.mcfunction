execute if predicate minecraft:in_structure/ancient_city run scoreboard players add @s bacaped_in_struct_summary 1
execute if predicate minecraft:in_structure/desert_pyramid run scoreboard players add @s bacaped_in_struct_summary 1
execute if predicate minecraft:in_structure/igloo run scoreboard players add @s bacaped_in_struct_summary 1
execute if predicate minecraft:in_structure/jungle_pyramid run scoreboard players add @s bacaped_in_struct_summary 1
execute if predicate minecraft:in_structure/mansion run scoreboard players add @s bacaped_in_struct_summary 1
execute if predicate minecraft:in_structure/mineshaft run scoreboard players add @s bacaped_in_struct_summary 1
execute if predicate minecraft:in_structure/monument run scoreboard players add @s bacaped_in_struct_summary 1
execute if predicate minecraft:in_structure/ocean_ruin run scoreboard players add @s bacaped_in_struct_summary 1
execute if predicate minecraft:in_structure/pillager_outpost run scoreboard players add @s bacaped_in_struct_summary 1
execute if predicate minecraft:in_structure/ruined_portal run scoreboard players add @s bacaped_in_struct_summary 1
execute if predicate minecraft:in_structure/stronghold run scoreboard players add @s bacaped_in_struct_summary 1
execute if predicate minecraft:in_structure/swamp_hut run scoreboard players add @s bacaped_in_struct_summary 1
execute if predicate minecraft:in_structure/trail_ruins run scoreboard players add @s bacaped_in_struct_summary 1
execute if predicate minecraft:in_structure/trial_chambers run scoreboard players add @s bacaped_in_struct_summary 1
execute if predicate minecraft:in_structure/village run scoreboard players add @s bacaped_in_struct_summary 1
execute if predicate minecraft:in_structure/shipwreck run scoreboard players add @s bacaped_in_struct_summary 1

execute if score @s bacaped_in_struct_summary matches 2.. run advancement grant @s only minecraft:adventure/dual_reality