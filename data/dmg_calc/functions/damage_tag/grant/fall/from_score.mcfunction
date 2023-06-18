execute if entity @s[tag=!calc.dmg_fall] if score @s calc.tag_fall matches 1.. run tag @s add calc.dmg_fall
scoreboard players set @s calc.tag_fall 0