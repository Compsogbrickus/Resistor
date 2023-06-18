execute if score @s calc.dmg matches ..0 run return 0

scoreboard players set @s calc.generic 0
scoreboard players set @s calc.projectile 0
scoreboard players set @s calc.blast 0
scoreboard players set @s calc.fire 0
scoreboard players set @s calc.fall 0

data modify storage dmg_calc:armor item set value {}
data modify storage dmg_calc:armor item set from entity @s Inventory[{Slot:103b}]
function dmg_calc:calculate/protection/add
data modify storage dmg_calc:armor item set from entity @s Inventory[{Slot:102b}]
function dmg_calc:calculate/protection/add
data modify storage dmg_calc:armor item set from entity @s Inventory[{Slot:101b}]
function dmg_calc:calculate/protection/add
data modify storage dmg_calc:armor item set from entity @s Inventory[{Slot:100b}]
function dmg_calc:calculate/protection/add

scoreboard players operation @s calc.projectile *= $calc.const 2
scoreboard players operation @s calc.blast *= $calc.const 2
scoreboard players operation @s calc.fire *= $calc.const 2
scoreboard players operation @s calc.fall *= $calc.const 3

execute if entity @s[tag=calc.dmg_fire] run scoreboard players operation @s calc.generic += @s calc.fire
execute if entity @s[tag=calc.dmg_projectile] run scoreboard players operation @s calc.generic += @s calc.projectile
execute if entity @s[tag=calc.dmg_blast] run scoreboard players operation @s calc.generic += @s calc.blast
execute if entity @s[tag=calc.dmg_fall] run scoreboard players operation @s calc.generic += @s calc.fall

scoreboard players set @s[scores={calc.generic=21..}] calc.generic 20

scoreboard players operation $calc.do calc.reduction = @s calc.generic
scoreboard players operation $calc.do calc.reduction *= $calc.const 4

function dmg_calc:lib/multiply_damage