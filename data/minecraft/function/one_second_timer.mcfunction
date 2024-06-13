# Function runs once per second

# # Trigger commands

# An Apple a Day
scoreboard players enable @a bac_apple_a_day
execute as @a if score @s bac_apple_a_day matches 1.. run function minecraft:apple_a_day_trigger

# Statistics
scoreboard players enable @a bac_statistics
execute as @a if score @s bac_statistics matches 1.. run function minecraft:statistics_trigger

# Timers
scoreboard players enable @a bac_timers
execute as @a if score @s bac_timers matches 1.. run function minecraft:timers_trigger

# # Item and mob rename advancements
execute as @e[type=rabbit,name=Toast] at @s run advancement grant @a[distance=..5] only minecraft:husbandry/i_just_want_to_make_toast
execute as @e[name=Dinnerbone] at @s run advancement grant @a[distance=..5] only minecraft:husbandry/whats_up_doc
execute as @e[name=Grumm] at @s run advancement grant @a[distance=..5] only minecraft:husbandry/whats_up_doc
execute as @e[type=sheep,name=jeb_] at @s run advancement grant @a[distance=..5] only minecraft:husbandry/nyan_sheep
execute as @e[type=piglin_brute,name=Technoblade] at @s run advancement grant @a[distance=..5] only minecraft:nether/nerds_never_die

# # Free Diver and Sleep with the Fishes (stay underwater)
execute as @a[gamemode=!spectator] at @s run function minecraft:stay_underwater

# All mobs with Wave set to 1 or higher (part of a raid) get given a special tag for being detected by advancements
# THESE COMMANDS HAVE BEEN COMMENTED OUT - AS OF MC 1.20.5, THE HAS_RAID TYPE_SPECIFIC RAIDER SUB-PREDICATE HAS BEEN ADDED AND ACCOMPLISHES WHAT THIS ONCE DID
#execute as @e[type=#minecraft:raiders] store result score @s bac_part_of_raid run data get entity @s Wave
#tag @e[type=#minecraft:raiders,scores={bac_part_of_raid=1..}] add part_of_raid

# # Full Stomach
advancement grant @a[nbt={foodLevel:20,foodSaturationLevel:20.0f}] only minecraft:farming/full_stomach

# # Castaway
# If the player eats dried kelp their score begins to go up once per second
execute as @a[gamemode=!spectator,advancements={minecraft:technical/castaway_start=true}] run scoreboard players add @s bac_castaway 1

# After three days they obtain the advancement
advancement grant @a[scores={bac_castaway=3600..}] only minecraft:farming/castaway

# If the player eats anything other than dried kelp they lose their progress and castaway_start is cleared
execute as @a[advancements={minecraft:technical/castaway_fail=true}] run function minecraft:castaway_fail


# # Just Keeps Going
# If the player eats rabbit stew their score begins to go up once per second
scoreboard players add @a[scores={bac_just_keep=1..}] bac_just_keep 1
execute as @a[gamemode=!spectator,advancements={minecraft:technical/just_keeps_going_start=true}] run function minecraft:just_keeps_going

# After three days they obtain the advancement
advancement grant @a[scores={bac_just_keep=3600..}] only minecraft:animal/just_keeps_going

# If the player eats anything while in progress they lose their progress and just_keeps_going_start is cleared
execute as @a[advancements={minecraft:technical/just_keeps_going_fail=true}] run function minecraft:just_keeps_going_fail


# # A Wizard's Breakfast
# If the player eats chorus fruit their timer score begins to go down
scoreboard players remove @a[scores={bac_wiz_break=1..,bac_chorus_reset=1..}] bac_chorus_reset 1
execute as @a[advancements={minecraft:technical/a_wizards_breakfast=true}] run function minecraft:a_wizards_breakfast

# If the player reaches 64 chorus fruit they obtain the advancement
advancement grant @a[scores={bac_wiz_break=64..}] only minecraft:end/a_wizards_breakfast

# If the player eats anything while in progress OR the time runs out they lose their progress
execute as @a[advancements={minecraft:technical/a_wizards_breakfast_fail=true}] run function minecraft:a_wizards_breakfast_fail
execute as @a[scores={bac_chorus_reset=0}] run function minecraft:a_wizards_breakfast_fail


# # Let Me Out!
# If the player is in the Nether their score goes up once per second
scoreboard players add @a[gamemode=!spectator,predicate=minecraft:in_the_nether] bac_let_me_out 1

# After twenty days (six hours and forty minutes) they obtain the advancement
advancement grant @a[scores={bac_let_me_out=24000..}] only minecraft:nether/let_me_out

# If the player is not in the Nether they lose their progress
execute as @a unless entity @s[predicate=minecraft:in_the_nether] run scoreboard players set @s bac_let_me_out 0


# # Loser!
# Counts up once per second
scoreboard players add @a bac_loser 1

# If a player dies the count is reset. If less than 10 seconds are on the count, the "Loser!" advancement is granted
execute as @a[gamemode=!spectator,scores={bac_loser_death=1..}] run function minecraft:loser_death


# # Loser! (Hardcore version) (loser_hurt function is only in Hardcore version)
# If the player has taken damage they have a score added
execute as @a[gamemode=!spectator,scores={bac_loser_hurt=1..}] run function minecraft:loser_hurt


# # Half-Heart Life
# If the player is on half a heart of health they have a score added. Once this score reaches 60 they get the advancement
execute as @a[gamemode=!spectator] if score @s bac_health matches 1 run function minecraft:half_heart_life

# If the player is not on half a heart the score is reset
execute as @a unless score @s bac_health matches 1 run scoreboard players set @s bac_hh_life 0


# # Art Gallery
# If a player places a painting, it checks all paintings within 8 blocks
execute as @a[scores={bac_painting=1..}] at @s run function minecraft:check_paintings


# # A Piglin's Best Friend
# If a player gives gold to a piglin, a score goes up
execute as @a[advancements={minecraft:technical/give_piglin_gold=true}] at @s run function minecraft:give_piglin_gold


# # Family Reunion
execute as @a[gamemode=!spectator] at @s if entity @e[type=husk,tag=!bac_baby,distance=..5] if entity @e[type=zombie_villager,tag=!bac_baby,distance=..5] if entity @e[type=drowned,tag=!bac_baby,distance=..5] if entity @e[type=zombified_piglin,tag=!bac_baby,distance=..5] if entity @e[type=zombie,tag=!bac_baby,distance=..5] if entity @e[type=husk,tag=bac_baby,distance=..5] if entity @e[type=zombie_villager,tag=bac_baby,distance=..5] if entity @e[type=drowned,tag=bac_baby,distance=..5] if entity @e[type=zombified_piglin,tag=bac_baby,distance=..5] if entity @e[type=zombie,tag=bac_baby,distance=..5] run advancement grant @s only minecraft:monsters/family_reunion


# # Bone-to-Party
execute as @a[gamemode=!spectator] at @s if entity @e[type=skeleton_horse,distance=..5] if entity @e[type=wither,distance=..5] if entity @e[type=stray,distance=..5] if entity @e[type=wither_skeleton,distance=..5] if entity @e[type=skeleton,distance=..5] run advancement grant @s only minecraft:monsters/bone_to_party


# # Redemption Arc
execute as @e[type=pillager,predicate=minecraft:no_crossbow] at @s run advancement grant @a[gamemode=!spectator,distance=..5] only minecraft:combate/redemption_arc


# # Not Afraid of Heights
execute as @e[type=warden,predicate=minecraft:at_world_height] at @s run advancement grant @a[gamemode=!spectator,distance=..10] only minecraft:combate/not_afraid_of_heights


# # House of Freaks & Overwarden
execute as @a[gamemode=!spectator] at @s if entity @e[type=warden,distance=..16] run function minecraft:count_wardens


# # Dimension Penetration
execute as @e[type=shulker_bullet] at @s run function minecraft:dimpen_tag


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


# # Dragon vs Dragon
# A player gains the score '1' in bac_dvd upon respawning the dragon
execute as @a[advancements={minecraft:technical/respawn_dragon=true}] run scoreboard players set @s bac_dvd 1

# It is set back to '0' if they are not wearing a dragon head, which will disqualify their eligibility for obtaining this advancement
execute as @a[scores={bac_dvd=1}] unless entity @s[predicate=minecraft:wear_dragon_head] run scoreboard players set @s bac_dvd 0

# If the player successfully kills the Ender Dragon still with a score of '1' they will gain the advancement
execute as @a[advancements={minecraft:technical/kill_dragon=true},scores={bac_dvd=1}] run advancement grant @s only minecraft:end/dragon_vs_dragon


# # Dragon vs Dragon II: Electric Boogaloo
# A player gains the score '1' in bac_dvd2eb upon respawning the dragon
execute as @a[advancements={minecraft:technical/respawn_dragon=true}] run function minecraft:dvd2eb_start

# It is set back to '0' if they touch the ground OR are not wearing a dragon head, which will disqualify their eligibility for obtaining this advancement
# Players are also disqualified for touching water, lava, or riding any vehicle
execute as @a[scores={bac_dvd2eb=1}] run function minecraft:dvd2eb_fail_check

# If the player successfully kills the Ender Dragon still with a score of '1' they will gain the advancement
execute as @a[advancements={minecraft:technical/kill_dragon=true},scores={bac_dvd2eb=1}] run advancement grant @s only minecraft:desafios/dragon_vs_dragon_ii_electric_boogaloo
execute as @a[advancements={minecraft:technical/kill_dragon=true}] run advancement revoke @s only minecraft:technical/kill_dragon


# # Dragon vs Wither: The Pre-Sequel
# A player gains the score '1' in bac_dveps upon respawning the wither
execute as @a[advancements={minecraft:technical/respawn_wither=true}] run function minecraft:dveps_start

# It is set back to '0' if they touch the ground OR are not wearing a dragon head OR more than 11 seconds has passed since spawning the Wither. Failing will disqualify their eligibility for obtaining this advancement
scoreboard players remove @a[scores={bac_withercool=1..}] bac_withercool 1
execute as @a[scores={bac_dveps=1}] unless score @s bac_withercool matches 1.. run function minecraft:dveps_fail_check

scoreboard players set @s bac_dveps 0

# If the player successfully kills the Wither still with a score of '1' they will gain the advancement
execute as @a[advancements={minecraft:technical/kill_wither=true},scores={bac_dveps=1}] run advancement grant @s only minecraft:challenges/dragon_vs_wither_the_pre_sequel
execute as @a[advancements={minecraft:technical/kill_wither=true}] run advancement revoke @s only minecraft:technical/kill_wither


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
# For the tenth line, it only starts counting once the player has completed the ninth line
execute as @a if entity @s[advancements={minecraft:technical/riddle_ninth_line=false}] run scoreboard players set @s bac_1000th_item 0

# Once they have placed 1000 Warped Buttons, the tenth line is complete
execute as @a if entity @s[advancements={minecraft:technical/riddle_ninth_line=true}] if score @s bac_1000th_item matches 1000.. run advancement grant @s only minecraft:technical/riddle_tenth_line


# Runs the ten_second_timer every 10 times
scoreboard players add ten_second bac_timer 1
execute if score ten_second bac_timer matches 10.. run function minecraft:ten_second_timer

schedule function minecraft:one_second_timer 1s