execute unless entity @s[predicate=!minecraft:is_on_ground,predicate=minecraft:wear_dragon_head] run function minecraft:dveps_fail
execute if entity @s[advancements={minecraft:technical/fail_dragon_vs=true}] run function minecraft:dveps_fail
execute at @s if block ~ ~ ~ #minecraft:climbable run function minecraft:dveps_fail
execute at @s if block ~ ~-0.25 ~ #minecraft:climbable run function minecraft:dveps_fail