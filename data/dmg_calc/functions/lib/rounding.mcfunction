execute if score @s calc.dmg_tenths matches 1.. run scoreboard players operation @s calc.dmg += @s calc.dmg_tenths
scoreboard players operation @s calc.dmg_tenths = @s calc.dmg
scoreboard players operation @s calc.dmg /= $calc.const 10
scoreboard players operation @s calc.dmg_tenths %= $calc.const 10