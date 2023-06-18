# Get the current post-armor damage buffer
scoreboard players operation @s calc.dmg = @s calc.dmg_resist
execute if score @s calc.dmg matches ..0 run return 0

# Give damage tags to the player
function #dmg_calc/damage_tag/grant/all

# Check if based on tags we should skip this attack
function #dmg_calc/calculate/skip_pre
execute if entity @s[tag=calc.skip] run return 2

# Function tags do not necessarily run in order
# This enforces the following possible steps
function #dmg_calc/calculate/additive_pre
function #dmg_calc/calculate/multiplicative
function #dmg_calc/calculate/additive_post

# Damage is in tenths, but we need whole numbers for damage dealt
# We store tenths seperately and handle them over time
function dmg_calc:lib/rounding

# Check if based on tags and damage dealt we should skip this attack
function #dmg_calc/calculate/skip_post
execute if entity @s[tag=calc.skip] run return 3

# Apply damage to the player
# We need a stopsound to prevent duplicate damage sounds
# This unfortunately interferes with mobs wearing thorns
execute as @s[scores={calc.dmg=1..}] run function dmg_calc:lib/damage_tree

# Reset everything
scoreboard players set @s calc.dmg 0
scoreboard players set @s calc.dmg_resist 0
function #dmg_calc/damage_tag/revoke/all
return -1