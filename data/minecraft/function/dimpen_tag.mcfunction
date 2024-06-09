# Gives this Shulker Bullet a tag depending on which dimension it is currently in
# If you get hit a Shulker Bullet that has all three tags, you will get the Dimension Penetration advancement (see the advancement json file)
tag @s[predicate=minecraft:in_the_overworld] add dimpen_overworld
tag @s[predicate=minecraft:in_the_nether] add dimpen_nether
tag @s[predicate=minecraft:in_the_end] add dimpen_end