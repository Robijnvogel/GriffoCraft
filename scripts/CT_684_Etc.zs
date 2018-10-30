#priority 316

#Imports
	import crafttweaker.item.IItemStack;
	import crafttweaker.item.IIngredient;
	import crafttweaker.liquid.ILiquidStack;
	import crafttweaker.oredict.IOreDict;
	import crafttweaker.oredict.IOreDictEntry;
	import mods.immersiveengineering.Crusher;
	import mods.tconstruct.Fuel;
	import mods.thermalexpansion.Pulverizer;
	
	import scripts.CT_002_Lists as L;	
	import scripts.CT_006_Functions as F;

#Items
	var tinyObsidian = <ic2:dust:25>; #todo make this oredict
	var tinySulfur = <ic2:dust:27>;

#Oredict
	var oreObsRod = <ore:rodObsidian>;
	var obsToolRod = <tconstruct:tool_rod>.withTag({Material: "obsidian"});
	oreObsRod.add(obsToolRod);
	
#Recipe removal
	#Dusts
		for dust in L.otherDusts {
			recipes.remove(dust); #dust alloying, hammering and tiny-combining
			Crusher.removeRecipe(dust); #IE crusher
		}
		furnace.remove(<ic2:dust:2>); //coal dust
		Pulverizer.removeRecipe(<minecraft:dye:4>); //lapis -> lapis dust
		Crusher.removeRecipe(<minecraft:sand>); #for nitrate
		Crusher.removeRecipe(<minecraft:blaze_powder>); #for sulfur
		Crusher.removeRecipe(<minecraft:dye:4>); #for sulfur
		Crusher.removeRecipe(<minecraft:quartz>); #for sulfur
		#sagmill still creates ic2 lapis dust
		#replace ie and ic2 slag completely with tf slag

#Recipe creation
	#Dusts
		#obsidian
			recipes.addShapeless(<thermalfoundation:material:770>, [tinyObsidian, tinyObsidian, tinyObsidian, tinyObsidian, tinyObsidian, tinyObsidian, tinyObsidian, tinyObsidian, tinyObsidian]);
			recipes.addShapeless(<thermalfoundation:material:770> * 4, [<immersiveengineering:tool:0>, <ore:obsidian>]); #IE Engineers Hammer
			recipes.addShapeless(<thermalfoundation:material:770> * 4, [<ic2:forge_hammer>.anyDamage().transformDamage(), <ore:obsidian>]); #ic2 Forge Hammer
		#saltpeter
			Crusher.addRecipe(<minecraft:sand> * 2, <ore:sandstone>, 500, <thermalfoundation:material:772>, 0.5); #IE Crusher
		#sulfur
			recipes.addShapeless(<thermalfoundation:material:771>, [tinySulfur, tinySulfur, tinySulfur, tinySulfur, tinySulfur, tinySulfur, tinySulfur, tinySulfur, tinySulfur]);
			Crusher.addRecipe(<minecraft:blaze_powder> * 4, <ore:rodBlaze>, 500, <thermalfoundation:material:771>, 0.5); #IE Crusher
			Crusher.addRecipe(<minecraft:dye:4> * 9, <ore:oreLapis>, 1000, <thermalfoundation:material:771>, 0.15); #IE Crusher
			Crusher.addRecipe(<minecraft:quartz> * 3, <ore:oreQuartz>, 1000, <thermalfoundation:material:771>, 0.15); #IE Crusher
		#coal
			furnace.addRecipe(<thermalfoundation:material:768>, <ic2:dust:3>); //hydrated coal dust
		#lapis
			Pulverizer.addRecipe(<enderio:item_material:32>, <minecraft:dye:4>, 2000); //lapis lazuli
		#other metal dusts
			for i, input in L.crushInputIngots {			
				Crusher.addRecipe(L.crushOutputDusts[i], input, 1000); #IE Crusher
			}
			
	#TiC Smeltery Fuel
		Fuel.registerFuel(<liquid:pyrotheum> * 2, 300);
		
	#MoC Silver Sword
		recipes.addShaped("MoCSilverSword", <mocreatures:silversword>.withDamage(-50), [
			[<tconstruct:large_sword_blade>.withTag({Material: "silver"})],
			[<tconstruct:cross_guard>.withTag({Material: "silver"})],
			[oreObsRod]
		]);
		
	#Test
		F.addNormalSmeltingRecipes(<ore:dustDiamond>, <minecraft:diamond>);
		F.addIngotDustRecipesSimple(<basemetals:redstone_ingot>, <minecraft:redstone>);
