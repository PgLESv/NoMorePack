# Function runs once per second

# # Trigger commands

# Statistics
scoreboard players enable @a bac_statistics
execute as @a if score @s bac_statistics matches 1.. run function minecraft:statistics_trigger

# Timers
scoreboard players enable @a bac_timers
execute as @a if score @s bac_timers matches 1.. run function minecraft:timers_trigger

# # Free Diver and Sleep with the Fishes (stay underwater)
execute as @a[gamemode=!spectator] at @s run function minecraft:stay_underwater

# # If leashing a boat, bac_leashing_boat score is set to 1 (used for Lead Zeppelin)
scoreboard players set @a bac_leashing_boat 0
execute as @e[type=#minecraft:all_boats] on leasher run scoreboard players set @s[type=player] bac_leashing_boat 1

# All mobs with Wave set to 1 or higher (part of a raid) get given a special tag for being detected by advancements
# THESE COMMANDS HAVE BEEN COMMENTED OUT - AS OF MC 1.20.5, THE HAS_RAID TYPE_SPECIFIC RAIDER SUB-PREDICATE HAS BEEN ADDED AND ACCOMPLISHES WHAT THIS ONCE DID
#execute as @e[type=#minecraft:raiders] store result score @s bac_part_of_raid run data get entity @s Wave
#tag @e[type=#minecraft:raiders,scores={bac_part_of_raid=1..}] add part_of_raid


# # A Wizard's Breakfast
# If the player eats chorus fruit their timer score begins to go down
scoreboard players remove @a[scores={bac_wiz_break=1..,bac_chorus_reset=1..}] bac_chorus_reset 1
execute as @a[advancements={minecraft:technical/a_wizards_breakfast=true}] run function minecraft:a_wizards_breakfast

# If the player reaches 64 chorus fruit they obtain the advancement
advancement grant @a[scores={bac_wiz_break=64..}] only minecraft:end/a_wizards_breakfast

# If the player eats anything while in progress OR the time runs out they lose their progress
execute as @a[advancements={minecraft:technical/a_wizards_breakfast_fail=true}] run function minecraft:a_wizards_breakfast_fail
execute as @a[scores={bac_chorus_reset=0}] run function minecraft:a_wizards_breakfast_fail


# # I yearned for the mines
# If the player is below y-level 32 in the overworld, their score goes up once per second
scoreboard players add @a[gamemode=!spectator,predicate=minecraft:i_yearned_for_the_mines] bac_i_yearned_for_the_mines 1

# After five days (one hour and forty minutes) they obtain the advancement
advancement grant @a[scores={bac_i_yearned_for_the_mines=6000..}] only minecraft:mining/i_yearned_for_the_mines

# If the player is not below y-level 32 they lose their progress
execute as @a unless entity @s[predicate=minecraft:i_yearned_for_the_mines] run scoreboard players set @s bac_i_yearned_for_the_mines 0


# # Loser!
# Counts up once per second
scoreboard players add @a bac_loser 1

# If a player dies the count is reset. If less than 10 seconds are on the count, the "Loser!" advancement is granted
execute as @a[gamemode=!spectator,scores={bac_loser_death=1..}] run function minecraft:loser_death


# # Art Gallery
# If a player places a painting, it checks all paintings within 8 blocks
execute as @a[scores={bac_painting=1..}] at @s run function minecraft:check_paintings


# # Bone-to-Party
execute as @a[gamemode=!spectator] at @s if entity @e[type=skeleton_horse,distance=..5] if entity @e[type=wither,distance=..5] if entity @e[type=stray,distance=..5] if entity @e[type=bogged,distance=..5] if entity @e[type=wither_skeleton,distance=..5] if entity @e[type=skeleton,distance=..5] run advancement grant @s only minecraft:combate/bone_to_party


# # Redemption Arc
execute as @e[type=pillager,predicate=minecraft:no_crossbow] at @s run advancement grant @a[gamemode=!spectator,distance=..5] only minecraft:combate/redemption_arc


# # Not Afraid of Heights
execute as @e[type=warden,predicate=minecraft:at_world_height] at @s run advancement grant @a[gamemode=!spectator,distance=..10] only minecraft:combate/not_afraid_of_heights


# # Animal Kingdom
execute as @a[gamemode=!spectator] at @s if entity @e[type=mule,distance=..32] run function minecraft:animal_kingdom_check


# # Unending Hell
execute as @a[advancements={minecraft:technical/unending_hell_end=true}] at @s run function minecraft:unending_hell_check


# # Event Horizon
advancement revoke @a[predicate=!minecraft:in_the_end] only minecraft:technical/below_void

# A player gains the score '1' in event_horizon upon going below the void
execute as @a[gamemode=!spectator,scores={bac_health=1..},advancements={minecraft:technical/below_void=true}] run function minecraft:below_void

# If the player dies they lose the score
## Command in tick

# If the player makes it above y = 0 they gain the advancement
execute as @a[gamemode=!spectator,advancements={minecraft:technical/return_from_void=true},scores={bac_eventhorizon=1}] run advancement grant @s only minecraft:end/event_horizon


# # Dragon vs Dragon II: Electric Boogaloo
# A player gains the score '1' in bac_dvd2eb upon respawning the dragon
execute as @a[advancements={minecraft:technical/respawn_dragon=true}] run function minecraft:dvd2eb_start

# It is set back to '0' if they touch the ground OR are not wearing a dragon head, which will disqualify their eligibility for obtaining this advancement
# Players are also disqualified for touching water, lava, or riding any vehicle
execute as @a[scores={bac_dvd2eb=1}] run function minecraft:dvd2eb_fail_check

# If the player successfully kills the Ender Dragon still with a score of '1' they will gain the advancement
execute as @a[advancements={minecraft:technical/kill_dragon=true},scores={bac_dvd2eb=1}] run advancement grant @s only minecraft:desafios/dragon_vs_dragon_ii_electric_boogaloo
execute as @a[advancements={minecraft:technical/kill_dragon=true}] run advancement revoke @s only minecraft:technical/kill_dragon



# # The Perfect Run
# When spawning a Dragon, Wither or a Raid, the player has a time limit of thirty seconds to spawn the other two
execute as @a[advancements={minecraft:technical/spawn_perfect_one=true}] unless score @s bac_pr_tl matches 1.. run function minecraft:perfect_run_start
execute as @a[advancements={minecraft:technical/spawn_perfect_one=false}] run advancement revoke @s only minecraft:technical/spawn_perfect_all

# If all three are successfully spawned before thirty seconds elapses, the countdown timer stops
execute as @a[scores={bac_pr_tl=1..}] unless entity @s[advancements={minecraft:technical/spawn_perfect_all=true}] run scoreboard players remove @s bac_pr_tl 1

# If the countdown timer reaches 0 then the player is disqualified
execute as @a[advancements={minecraft:technical/spawn_perfect_one=true},scores={bac_pr_tl=0}] run function minecraft:perfect_run_fail

# If the player takes damage at any stage then the player is disqualified
execute as @a[advancements={minecraft:technical/spawn_perfect_one=true},scores={bac_pr_dmgt=1..}] run function minecraft:perfect_run_fail
execute as @a[advancements={minecraft:technical/spawn_perfect_one=true},scores={bac_pr_dmga=1..}] run function minecraft:perfect_run_fail
execute as @a[advancements={minecraft:technical/spawn_perfect_one=true},scores={bac_pr_dmgr=1..}] run function minecraft:perfect_run_fail

# If the player successfully lands the killing blow on the Dragon, Wither, and wins the Raid, the advancement is granted
# Once all three are spawned, the player has unlimited time to do all of these. The only condition is that they cannot take damage


# # Riddle Me This
# For the third line, if you are NOT riding an upside-down mount the scoreboards reset
execute as @a unless predicate minecraft:third_line run function minecraft:riddle/third_line_reset

# For the tenth line, it only starts counting once the player has completed the ninth line
execute as @a if entity @s[advancements={minecraft:technical/riddle_ninth_line=false}] run scoreboard players set @s bac_1000th_item 0

# Once they have placed 1000 Warped Buttons, the tenth line is complete
execute as @a if entity @s[advancements={minecraft:technical/riddle_ninth_line=true}] if score @s bac_1000th_item matches 1000.. run advancement grant @s only minecraft:technical/riddle_tenth_line


# Runs the ten_second_timer every 10 times
scoreboard players add ten_second bac_timer 1
execute if score ten_second bac_timer matches 10.. run function minecraft:ten_second_timer

schedule function minecraft:one_second_timer 1s