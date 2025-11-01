# Firefox
execute as @a[gamemode=!spectator,advancements={minecraft:nether/firefox=false}] at @s if dimension minecraft:the_nether if entity @e[predicate=minecraft:is_red_fox,distance=..16] run advancement grant @s only minecraft:nether/firefox

# Dual Reality
execute as @a[gamemode=!spectator,advancements={minecraft:adventure/dual_reality=false}] at @s run function minecraft:dual_reality/clear_all
execute as @a[gamemode=!spectator,advancements={minecraft:adventure/dual_reality=false}] at @s if dimension minecraft:overworld run function minecraft:dual_reality/overworld_check
execute as @a[gamemode=!spectator,advancements={minecraft:adventure/dual_reality=false}] at @s if dimension minecraft:the_nether run function minecraft:dual_reality/nether_check
scoreboard players set @a[gamemode=!spectator] bacaped_in_struct_summary 0