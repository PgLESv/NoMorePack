# At the beginning of each day:
scoreboard players add @a bac_day_count 1

advancement grant @a[scores={bac_day_count=100..}] only minecraft:statistics/passing_the_time
advancement grant @a[scores={bac_day_count=365..}] only minecraft:statistics/happy_new_year