# Function runs once per tick
execute as @a[scores={bac_event_death=1..}] run function minecraft:event_horizon_fail

# # Dimension Penetration
execute as @e[type=arrow] at @s run function minecraft:dimpen_tag