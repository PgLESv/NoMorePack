execute if score challenge bac_settings matches 1 run function bc_rewards:msg/statistics/xp_grinder
execute if score challenge bac_settings matches -1 unless score minecraft:stats/xp_grinder bac_obtained matches 1.. run function bc_rewards:msg/statistics/xp_grinder
