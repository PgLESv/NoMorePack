execute if score task bac_settings matches 1 run function bc_rewards:msg/statistics/take_to_the_skies
execute if score task bac_settings matches -1 unless score minecraft:stats/take_to_the_skies bac_obtained matches 1.. run function bc_rewards:msg/statistics/take_to_the_skies
