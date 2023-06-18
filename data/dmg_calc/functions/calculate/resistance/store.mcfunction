data modify storage dmg_calc:res effect set value {}
data modify storage dmg_calc:res effect set from entity @s ActiveEffects[{Id:11}]

execute store result score @s calc.res.duration run data get storage dmg_calc:res effect.Duration
execute store result score @s calc.res.amplifier run data get storage dmg_calc:res effect.Amplifier

execute if score @s calc.res.amplifier matches 4.. if score @s calc.res.duration matches -1 if data storage dmg_calc:res effect.HiddenEffect run data modify storage dmg_calc:res effect set from storage dmg_calc:res effect.HiddenEffect

execute store result score @s calc.res.duration run data get storage dmg_calc:res effect.Duration
execute store result score @s calc.res.amplifier run data get storage dmg_calc:res effect.Amplifier

execute if score @s calc.res.amplifier matches 4.. if score @s calc.res.duration matches -1 run scoreboard players set @s calc.res.amplifier 0
execute if score @s calc.res.amplifier matches 4.. if score @s calc.res.duration matches -1 run scoreboard players set @s calc.res.duration 0