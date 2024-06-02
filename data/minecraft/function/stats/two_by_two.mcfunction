execute if score challenge bac_settings matches 1 run function bc_rewards:msg/statistics/two_by_two
execute if score challenge bac_settings matches -1 unless score minecraft:stats/two_by_two bac_obtained matches 1.. run function bc_rewards:msg/statistics/two_by_two
