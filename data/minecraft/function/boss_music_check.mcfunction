# If the Ender Dragon is within 150 blocks of the player, you get this advancement
execute if entity @e[type=ender_dragon,distance=..150] run advancement grant @s only minecraft:end/why_do_i_hear_boss_music

advancement revoke @s only minecraft:technical/boss_music_check