# Function runs at the beginning of a load

#  Adjusts gamerules to work properly with everything related to BACAP
execute in minecraft:overworld run gamerule maxCommandForkCount 20000000
execute in minecraft:overworld run gamerule maxCommandChainLength 20000000

execute in minecraft:the_nether run gamerule maxCommandForkCount 20000000
execute in minecraft:the_nether run gamerule maxCommandChainLength 20000000

execute in minecraft:the_end run gamerule maxCommandForkCount 20000000
execute in minecraft:the_end run gamerule maxCommandChainLength 20000000

# Adds/updates scoreboard objectives and settings
scoreboard objectives add bac_advancements dummy {"text":"Advancements"}
scoreboard objectives add bac_advfirst dummy {"text":"First Advancements"}
scoreboard objectives add bac_obtained dummy
scoreboard objectives add bac_settings dummy
scoreboard objectives add bac_trophy_given dummy
scoreboard objectives add bac_quit minecraft.custom:minecraft.leave_game

# The following are related to teams
scoreboard objectives add bac_advancements_team dummy {"text":"Team Advancements"}
scoreboard objectives add bac_advfirst_team_sum dummy {"text":"Total Team Advancements"}
scoreboard objectives add bac_advfirst_sum dummy {"text":"Team First Advancements"}
scoreboard objectives add bac_advfirst_team dummy {"text":"First Advancements in Team"}

scoreboard objectives add bac_obtained_black dummy
scoreboard objectives add bac_obtained_dark_blue dummy
scoreboard objectives add bac_obtained_dark_green dummy
scoreboard objectives add bac_obtained_dark_aqua dummy
scoreboard objectives add bac_obtained_dark_red dummy
scoreboard objectives add bac_obtained_dark_purple dummy
scoreboard objectives add bac_obtained_gold dummy
scoreboard objectives add bac_obtained_gray dummy
scoreboard objectives add bac_obtained_dark_gray dummy
scoreboard objectives add bac_obtained_blue dummy
scoreboard objectives add bac_obtained_green dummy
scoreboard objectives add bac_obtained_aqua dummy
scoreboard objectives add bac_obtained_red dummy
scoreboard objectives add bac_obtained_light_purple dummy
scoreboard objectives add bac_obtained_yellow dummy
scoreboard objectives add bac_obtained_white dummy

team add bac_team_black {"translate":"Black Team"}
team add bac_team_dark_blue {"translate":"Dark Blue Team"}
team add bac_team_dark_green {"translate":"Dark Green Team"}
team add bac_team_dark_aqua {"translate":"Dark Aqua Team"}
team add bac_team_dark_red {"translate":"Dark Red Team"}
team add bac_team_dark_purple {"translate":"Dark Purple Team"}
team add bac_team_gold {"translate":"Gold Team"}
team add bac_team_gray {"translate":"Gray Team"}
team add bac_team_dark_gray {"translate":"Dark Gray Team"}
team add bac_team_blue {"translate":"Blue Team"}
team add bac_team_green {"translate":"Green Team"}
team add bac_team_aqua {"translate":"Aqua Team"}
team add bac_team_red {"translate":"Red Team"}
team add bac_team_light_purple {"translate":"Light Purple Team"}
team add bac_team_yellow {"translate":"Yellow Team"}
team add bac_team_white {"translate":"White Team"}

team modify bac_team_black color black
team modify bac_team_dark_blue color dark_blue
team modify bac_team_dark_green color dark_green
team modify bac_team_dark_aqua color dark_aqua
team modify bac_team_dark_red color dark_red
team modify bac_team_dark_purple color dark_purple
team modify bac_team_gold color gold
team modify bac_team_gray color gray
team modify bac_team_dark_gray color dark_gray
team modify bac_team_blue color blue
team modify bac_team_green color green
team modify bac_team_aqua color aqua
team modify bac_team_red color red
team modify bac_team_light_purple color light_purple
team modify bac_team_yellow color yellow
team modify bac_team_white color white

team join bac_team_black Black_Team
team join bac_team_dark_blue Dark_Blue_Team
team join bac_team_dark_green Dark_Green_Team
team join bac_team_dark_aqua Dark_Aqua_Team
team join bac_team_dark_red Dark_Red_Team
team join bac_team_dark_purple Dark_Purple_Team
team join bac_team_gold Gold_Team
team join bac_team_gray Gray_Team
team join bac_team_dark_gray Dark_Gray_Team
team join bac_team_blue Blue_Team
team join bac_team_green Green_Team
team join bac_team_aqua Aqua_Team
team join bac_team_red Red_Team
team join bac_team_light_purple Light_Purple_Team
team join bac_team_yellow Yellow_Team
team join bac_team_white White_Team

# The following are used for statistical advancements
scoreboard objectives add bac_day_count dummy
scoreboard objectives add bac_current_time dummy
scoreboard objectives add bac_underwater dummy
scoreboard objectives add bac_painting minecraft.used:minecraft.painting
scoreboard objectives add bac_stat_loot_chest dummy
scoreboard objectives add bac_stat_food dummy
scoreboard objectives add bac_consume_honey_bottle dummy
scoreboard objectives add bac_consume_poisonous_potato dummy
scoreboard objectives add bac_consume_spider_eye dummy

# The following are used for other advancements
scoreboard objectives add bac_castaway dummy
scoreboard objectives add bac_just_keep dummy
scoreboard objectives add bac_let_me_out dummy
scoreboard objectives add bac_ten_withers dummy
scoreboard objectives add bac_dvd dummy
scoreboard objectives add bac_dvd2eb dummy
scoreboard objectives add bac_dveps dummy
scoreboard objectives add bac_withercool dummy
scoreboard objectives add bac_eventhorizon dummy
scoreboard objectives add bac_event_death deathCount
scoreboard objectives add bac_loser dummy
scoreboard objectives add bac_loser_death deathCount
scoreboard objectives add bac_loser_hurt minecraft.custom:minecraft.damage_taken
scoreboard objectives add bac_loser_count dummy
scoreboard objectives add bac_unending_death deathCount
scoreboard objectives add bac_part_of_raid dummy
scoreboard objectives add bac_health health
scoreboard objectives add bac_wiz_break dummy
scoreboard objectives add bac_chorus_reset dummy
scoreboard objectives add bac_hh_life dummy
scoreboard objectives add bac_apple_eaten minecraft.used:minecraft.apple
scoreboard objectives add bac_apple_days dummy
scoreboard objectives add bac_apple_a_day trigger
scoreboard objectives add bac_statistics trigger
scoreboard objectives add bac_timers trigger
scoreboard objectives add bac_pr_tl dummy
scoreboard objectives add bac_pr_dmgt minecraft.custom:minecraft.damage_taken
scoreboard objectives add bac_pr_dmga minecraft.custom:minecraft.damage_absorbed
scoreboard objectives add bac_pr_dmgr minecraft.custom:minecraft.damage_resisted
scoreboard objectives add bac_pigling dummy
scoreboard objectives add bac_captain_america dummy
scoreboard objectives add bac_warden_count dummy
scoreboard objectives add bac_overwarden_count dummy
scoreboard objectives add bac_oar_start_x dummy
scoreboard objectives add bac_oar_start_z dummy
scoreboard objectives add bac_oar_current_x dummy
scoreboard objectives add bac_oar_current_z dummy
scoreboard objectives add bac_oar_eligible_x dummy
scoreboard objectives add bac_oar_eligible_z dummy
scoreboard objectives add bac_third_line_horse minecraft.custom:minecraft.horse_one_cm
scoreboard objectives add bac_third_line_pig minecraft.custom:minecraft.pig_one_cm
scoreboard objectives add bac_third_line_strider minecraft.custom:minecraft.strider_one_cm
scoreboard objectives add bac_1000th_item minecraft.used:minecraft.warped_button
scoreboard objectives add bac_inv_check dummy
scoreboard objectives add bac_inv_artillery dummy
scoreboard objectives add bac_inv_chestful_of_cobblestone dummy
scoreboard objectives add bac_inv_rocketman dummy
scoreboard objectives add bac_inv_immortal dummy
scoreboard objectives add bac_factorio_count dummy
scoreboard objectives add bac_vault_hunter_count dummy
scoreboard objectives add bac_whack_a_mole_count dummy
scoreboard objectives add bac_divers_dozen_count dummy
scoreboard objectives add bac_i_yearned_for_the_mines dummy
scoreboard objectives add bac_leashing_boat dummy
scoreboard objectives add bac_creaking_count dummy
scoreboard objectives add bac_oh_baby_a_triple dummy
scoreboard objectives add bac_splatfest_egg dummy
scoreboard objectives add bac_egg_count dummy
scoreboard objectives add bac_egg_brown_count dummy
scoreboard objectives add bac_egg_blue_count dummy

# If a setting for advancement message visibility is not found, it is set to its default (which is all on)
execute unless score task bac_settings matches ..1000 run scoreboard players set task bac_settings 1
execute unless score goal bac_settings matches ..1000 run scoreboard players set goal bac_settings 1
execute unless score challenge bac_settings matches ..1000 run scoreboard players set challenge bac_settings 1
execute unless score super_challenge bac_settings matches ..1000 run scoreboard players set super_challenge bac_settings 1
execute unless score milestone bac_settings matches ..1000 run scoreboard players set milestone bac_settings 1


# If a setting is set to anything other than off, /gamerule announceAdvancements is set to false
# (This is done in all dimensions because on some kinds of servers this is required)
execute unless score task bac_settings matches 0 run execute in the_end run gamerule announceAdvancements false
execute unless score task bac_settings matches 0 run execute in overworld run gamerule announceAdvancements false 
execute unless score task bac_settings matches 0 run execute in the_nether run gamerule announceAdvancements false
execute unless score goal bac_settings matches 0 run execute in the_end run gamerule announceAdvancements false
execute unless score goal bac_settings matches 0 run execute in overworld run gamerule announceAdvancements false 
execute unless score goal bac_settings matches 0 run execute in the_nether run gamerule announceAdvancements false
execute unless score challenge bac_settings matches 0 run execute in the_end run gamerule announceAdvancements false
execute unless score challenge bac_settings matches 0 run execute in overworld run gamerule announceAdvancements false 
execute unless score challenge bac_settings matches 0 run execute in the_nether run gamerule announceAdvancements false
execute unless score super_challenge bac_settings matches 0 run execute in the_end run gamerule announceAdvancements false
execute unless score super_challenge bac_settings matches 0 run execute in overworld run gamerule announceAdvancements false 
execute unless score super_challenge bac_settings matches 0 run execute in the_nether run gamerule announceAdvancements false
execute unless score milestone bac_settings matches 0 run execute in the_end run gamerule announceAdvancements false
execute unless score milestone bac_settings matches 0 run execute in overworld run gamerule announceAdvancements false 
execute unless score milestone bac_settings matches 0 run execute in the_nether run gamerule announceAdvancements false


# # Starts timers
scoreboard objectives add bac_timer dummy

function minecraft:one_second_timer
function minecraft:ten_second_timer

# # This function sets base scoreboards when loading a world for the first time
scoreboard objectives add bac_created dummy
execute unless score bac_created bac_created matches 1 run function minecraft:new_world

# # This function sets scoreboard number format. This function is also run for a player when they log onto the world for the first time and gain the root of the minecraft's Advancements tab
execute as @a run function minecraft:config/update_number_format