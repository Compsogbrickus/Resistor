execute store result score $calc.do calc.generic run data get storage dmg_calc:armor item.tag.Enchantments[{id:"minecraft:protection"}].lvl
scoreboard players operation @s calc.generic += $calc.do calc.generic

execute store result score $calc.do calc.generic run data get storage dmg_calc:armor item.tag.Enchantments[{id:"minecraft:projectile_protection"}].lvl
scoreboard players operation @s calc.projectile += $calc.do calc.generic

execute store result score $calc.do calc.generic run data get storage dmg_calc:armor item.tag.Enchantments[{id:"minecraft:blast_protection"}].lvl
scoreboard players operation @s calc.blast += $calc.do calc.generic

execute store result score $calc.do calc.generic run data get storage dmg_calc:armor item.tag.Enchantments[{id:"minecraft:fire_protection"}].lvl
scoreboard players operation @s calc.fire += $calc.do calc.generic

execute store result score $calc.do calc.generic run data get storage dmg_calc:armor item.tag.Enchantments[{id:"minecraft:feather_falling"}].lvl
scoreboard players operation @s calc.fall += $calc.do calc.generic