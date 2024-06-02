tellraw @s {"color":"gray","italic":"true","translate":"You have unlocked the root of the Statistics tab"}
execute if score reward bac_settings matches 1 run function bc_rewards:reward/statistics/root
execute if score reward bac_settings matches -1 unless score minecraft:stats/root bac_obtained matches 1.. run function bc_rewards:reward/statistics/root