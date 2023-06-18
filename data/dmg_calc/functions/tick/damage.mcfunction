execute unless predicate dmg_calc:effect/calc_resistance run function dmg_calc:lib/start_tracking
function dmg_calc:calculate/resistance/store

execute unless score @s calc.tracker_lava matches 1.. store result score @s calc.dmg_result run function dmg_calc:lib/apply_damage
execute if score @s calc.dmg_result matches 2..3 run function dmg_calc:lib/skip_reset