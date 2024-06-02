execute if score goal bac_settings matches 1 run function bc_rewards:msg/statistics/sheriff_firearm
execute if score goal bac_settings matches -1 unless score minecraft:stats/sheriff_firearm bac_obtained matches 1.. run function bc_rewards:msg/statistics/sheriff_firearm
