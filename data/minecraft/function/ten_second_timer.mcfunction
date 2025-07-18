# Function runs once every ten seconds

# Checks if there is a player who has quit and just now rejoined the game. If there is and Cooperative mode is enabled, updates shared advancements
execute if score coop bac_settings matches 1 if entity @p[scores={bac_quit=1..}] run function minecraft:config/coop_update
execute if score coop bac_settings matches 2 as @a[scores={bac_quit=1..}] run function minecraft:config/coop_update_team
scoreboard players set @a bac_quit 0

# For "An Apple a Day" if an apple is eaten it increases the score. bac_apple_eaten is then set to 100
execute as @a[scores={bac_apple_eaten=1..99}] run scoreboard players add @s bac_apple_days 1
execute as @a[scores={bac_apple_eaten=1..}] run scoreboard players set @s bac_apple_eaten 100


# Day count is increased by 1 at each sunrise
scoreboard players operation previous bac_current_time = time bac_current_time
execute store result score time bac_current_time run time query daytime
execute if score time bac_current_time matches 0..200 run function minecraft:increase_day



# Gives Striders ridden by a Zombified Piglin a unique tag for the "This One's Mine!" advancement. Those that don't have one are given a different tag so they aren't checked anymore
execute as @e[type=strider,tag=!zp_ridden,tag=!not_zp_ridden] at @s run function minecraft:strider_check

# Gives baby zombie variants the 'baby' tag if they are a baby (Used for the "Family Reunion" advancement)
execute as @e[type=#minecraft:zombies,tag=!bac_baby] run tag @s[predicate=minecraft:is_baby] add bac_baby

# The World Is Ending (counts ten withers)
execute as @a[gamemode=!spectator] at @s store result score @s bac_ten_withers run execute if entity @e[type=wither,distance=..128]
execute as @a[gamemode=!spectator] if score @s bac_ten_withers matches 10.. run advancement grant @s only minecraft:desafios/the_world_is_ending


scoreboard players set ten_second bac_timer 0

#schedule function minecraft:ten_second_timer 10s