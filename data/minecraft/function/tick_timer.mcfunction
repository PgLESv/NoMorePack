# Function runs once per tick
execute as @a[scores={bac_event_death=1..}] run function minecraft:event_horizon_fail

execute as @a[scores={bac_whack_a_mole_count=1..}] if predicate minecraft:is_on_ground run scoreboard players set @s bac_whack_a_mole_count 0