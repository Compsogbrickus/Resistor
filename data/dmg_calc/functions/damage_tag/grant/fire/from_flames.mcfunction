execute if entity @s[tag=!calc.dmg_fire] unless predicate dmg_calc:effect/fire_resistance if entity @s[nbt=!{Fire:-20s}] run tag @s add calc.dmg_fire