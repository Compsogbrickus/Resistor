execute if score @s calc.dmg matches ..0 run return 0

scoreboard players operation $calc.do calc.reduction = @s calc.res.amplifier
scoreboard players add $calc.do calc.reduction 1
scoreboard players operation $calc.do calc.reduction *= $calc.const 20

function dmg_calc:lib/multiply_damage