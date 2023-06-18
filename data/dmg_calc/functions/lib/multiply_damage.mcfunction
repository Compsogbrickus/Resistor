execute if score @s calc.dmg matches ..0 run return 0
execute if score $calc.do calc.reduction matches 100.. run scoreboard players set @s calc.dmg 0
execute if score $calc.do calc.reduction matches 100.. run return 1

scoreboard players operation $calc.do calc.dmg = @s calc.dmg
scoreboard players operation $calc.do calc.dmg *= $calc.do calc.reduction
scoreboard players operation @s calc.dmg *= $calc.const 100
scoreboard players operation @s calc.dmg -= $calc.do calc.dmg
scoreboard players operation @s calc.dmg /= $calc.const 100