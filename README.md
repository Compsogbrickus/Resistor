# Resistor

Resistor is a datapack for Minecraft 1.20 that implements an extendable custom player damage library primarily aimed at simulating damage reduction.

This repository functions as a datapack that can be dropped into a Minecraft world's "datapacks" folder. Once placed into the datapacks folder and once the world is exited and entered again, you will be able to start using it.

## Documentation

To report a bug or suggest a feature, use the Issues tracker on Github. Issues are forwarded to my email. For more detailed questions, you can reach me at compsogbrickus@gmail.com or on Discord as compsogbrickus.

### API

The vast majority of functions you will need are found under `dmg_calc:lib`. 

To start tracking damage on a player, run `dmg_calc:lib/start_tracking` (preferred) or add the tag `calc.track` to them (this method has a one-tick delay). To end tracking, run `dmg_calc:lib/end_tracking`. Note that ending tracking will clear all resistance effects from the player.

The function `dmg_calc:lib/apply_damage` handles all core damage logic outside of some bug fixes and other ticking code. It uses function tags to allow for api calls from other datapacks. The steps it takes (in order) are specified in the following list.
1. Get the current post-armor reduction damage buffer in tenths and store it in `calc.dmg`.
2. Tag the player with all types of damage they are taking. These tags are specified in `minecraft/tags/dmg_calc/damage_tag` with both commands to grant and revoke each type as well as all types. 
3. Check if the current attack should be skipped based on the damage type by running functions specified in `minecraft/tags/dmg_calc/calculate/skip_pre` and checking if the tag `calc.skip` has been applied to the player. If it has, the function exits and `dmg_calc:lib/skip_reset` automatically runs.
4. Add or subtract any flat damage amounts from the functions specified in `minecraft/tags/dmg_calc/calculate/additive_pre`. It is assumed you will manually add to or subtract from `calc.dmg`.
5. Multiply any damage reductions from the functions specified in `minecraft/tags/dmg_calc/calculate/multiplicative`. To do this, simply set the `calc.reduction` score on the fake player `$calc.do` to the whole number percentage damage reduction you wish to apply and then run the function `dmg_calc:lib/multiply_damage`. Reductions of 100 or more will set `calc.dmg` to 0.
6. Add or subtract any flat damage amounts from the functions specified in `minecraft/tags/dmg_calc/calculate/additive_post`.
7. Do rounding for the current value of `calc.dmg`, which is stored as tenths. Since we would prefer to deal whole number amounts of damage, a separate buffer is used to handle decimal damage amounts.
8. Check if the current attack should be skipped based on the damage type and damage amount by running functions specified in `minecraft/tags/dmg_calc/calculate/skip_post` and checking if the tag `calc.skip` has been applied to the player.
9. Deal damage to the player via the function `dmg_calc:lib/damage_tree`. Due to a quirk in how Minecraft handles damage types, this also cancels the sound event for thorns damage. This function can also be manually called to deal damage to the player equal to the value of `calc.dmg`.
10. Reset all scoreboards and damage type tags. The function `dmg_calc:lib/skip_reset` does this, but also removes the `calc.skip` tag from the player.

In terms of examples, it should be sufficient to follow the function tags and their sources. Please let me know if this is not the case, and I can provide more accurate help.

## Credits

**Compsogbrickus** - Datapack Creator.

**PearUhDox** - Implementation help, primarily based off of Second Wind from https://github.com/pearuhdox/Cartographer. Resistor uses a roughly similar pattern for implementation, but does it in a much more general way, using significantly modified logic.

**Forite** - Inspiration! This datapack was originally made to recreate a sword blocking mechanic that was unfortunately lost. It does far more than that now.

**Additional Credits**
- Misode, for the tools at https://misode.github.io/, which made this pack easier to develop.
- 5uso, for a binary tree writer I roughly based mine off of, found in https://github.com/5uso/Artificial-Natspawns.