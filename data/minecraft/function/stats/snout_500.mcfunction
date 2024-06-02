execute if score goal bac_settings matches 1 run function bc_rewards:msg/statistics/snout_500
execute if score goal bac_settings matches -1 unless score minecraft:stats/snout_500 bac_obtained matches 1.. run function bc_rewards:msg/statistics/snout_500
