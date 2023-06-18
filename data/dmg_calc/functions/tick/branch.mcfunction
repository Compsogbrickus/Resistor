execute unless score @s[tag=!calc.track] calc.dmg_resist matches 0 run scoreboard players set @s calc.dmg_resist 0
execute as @s[tag=calc.track] run function dmg_calc:tick/damage

execute unless entity @s[scores={calc.tracker_lava=1..}] as @s at @s run function dmg_calc:tick/tracker_lava
execute as @s[scores={calc.tracker_lava=1..}] run scoreboard players remove @s calc.tracker_lava 1