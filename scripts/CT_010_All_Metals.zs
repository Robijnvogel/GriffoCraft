#priority 990

#Imports
	import crafttweaker.item.IItemStack;
	import crafttweaker.item.IIngredient;
	import crafttweaker.liquid.ILiquidStack;
	import crafttweaker.oredict.IOreDict;
	import mods.immersiveengineering.AlloySmelter;
	import mods.immersiveengineering.ArcFurnace;
	import mods.immersiveengineering.Crusher as IECrusher;
	import mods.immersiveengineering.MetalPress;
	import mods.mekanism.crusher as MKCrusher;
	import mods.tconstruct.Casting;
	import mods.thermalexpansion.Compactor;
	import mods.thermalexpansion.InductionSmelter;
	import mods.thermalexpansion.Pulverizer;
	import mods.thermalexpansion.RedstoneFurnace;
	
	import scripts.CT_001_Lists.metalNames;
	import scripts.CT_001_Lists.outputNuggets;
	import scripts.CT_001_Lists.outputIngots;
	import scripts.CT_001_Lists.outputBlocks;
	import scripts.CT_001_Lists.outputTinyDusts;
	import scripts.CT_001_Lists.outputDusts;
	
	import scripts.CT_001_Lists.moltenMetals;
	
	import scripts.CT_001_Lists.outputPlates;
	import scripts.CT_001_Lists.outputGears;
	
	import scripts.CT_005_Functions.addIngotDustRecipes;
	import scripts.CT_005_Functions.addNormalCrushingRecipes;
	import scripts.CT_005_Functions.addNormalSmeltingRecipes;
	import scripts.CT_005_Functions.addStorageRecipeBothWays;
	
#All metals
for i, metalName in metalNames {

	#Ore dictionary entries
		var dictNugget = oreDict.get("nugget" + metalName);
		var dictIngot = oreDict.get("ingot" + metalName);
		var dictBlock = oreDict.get("block" + metalName);
		var dictDustTiny = oreDict.get("dustTiny" + metalName);
		var dictDust = oreDict.get("dust" + metalName);
		
		var dictAnyDust = oreDict.get("anyDust" + metalName);
		
		var dictPlate = oreDict.get("plate" + metalName);
		var dictGear = oreDict.get("gear" + metalName);
		
	#Recipe removal
		for nugget in dictNugget.itemArray {
			recipes.remove(nugget); #Ingots
			furnace.remove(nugget, <*>); #Furnace
			Casting.removeTableRecipe(nugget); #Tinkers Smeltery
		}
		
		for ingot in dictIngot.itemArray {
			recipes.remove(ingot); #nuggets, blocks, ic2 credits, pyrotheum and petro/pyrotheum
			furnace.remove(ingot, <*>); #Furnace
			Casting.removeTableRecipe(ingot); #Tinkers Smeltery
			ArcFurnace.removeRecipe(ingot); #IE Arc Furnace (includes some alloys)
			AlloySmelter.removeRecipe(ingot); #alloying as well as smelting dust
			Compactor.removeStorageRecipe(ingot); #TE Compactor Ingot -> Plate
		}
		
		for block in dictBlock.itemArray {
			recipes.remove(block); #Ingots
			Casting.removeBasinRecipe(block); #Tinkers Smeltery
		}
		
		for tinyDust in dictDustTiny.itemArray {
			recipes.remove(tinyDust); #Dusts
			#todo unify Base Metals crushing?
		}
		
		for dust in dictDust.itemArray {
			recipes.remove(dust); #Tiny dusts, IE Engineers Hammer, petrotheum dust and ic2 forge hammer
			IECrusher.removeRecipe(dust); #IE crusher
		}
		
		for plate in dictPlate.itemArray {
			recipes.remove(plate); #IE Engineers Hammer, IC2 forge hammer and 3 ingots
			MetalPress.removeRecipe(plate);
			Casting.removeTableRecipe(plate); #Tinkers Smeltery
		}
		
		for gear in dictGear.itemArray {
			recipes.remove(gear);
			MetalPress.removeRecipe(gear);
			Casting.removeTableRecipe(gear); #Tinkers Smeltery
		}
		
	#Recipe creation
		addStorageRecipeBothWays(dictIngot, outputIngots[i], dictNugget, outputNuggets[i]);
		addStorageRecipeBothWays(dictBlock, outputBlocks[i], dictIngot, outputIngots[i]);
		addIngotDustRecipes(dictNugget, outputNuggets[i], dictDustTiny, outputTinyDusts[i]);
		#todo add missing recipes?
		#Nuggets ->
			recipes.addShapeless(outputTinyDusts[i] * 8, [<thermalfoundation:material:1027>, dictNugget, dictNugget, dictNugget, dictNugget, dictNugget, dictNugget, dictNugget, dictNugget]); #Petrotheum dust
			recipes.addShapeless(outputTinyDusts[i] * 8, [<immersiveengineering:tool:0>, dictNugget, dictNugget, dictNugget, dictNugget, dictNugget, dictNugget, dictNugget, dictNugget]); #IE Engineers Hammer
			recipes.addShapeless(outputTinyDusts[i] * 8, [<ic2:forge_hammer>.anyDamage().transformDamage(), dictNugget, dictNugget, dictNugget, dictNugget, dictNugget, dictNugget, dictNugget, dictNugget]); #ic2 Forge Hammer
			
		#Ingots ->
			#Dusts #addNormalCrushingRecipes() would also add hammer recipes from ingot -> dust, but we want those to result in plates
				recipes.addShapeless(outputDusts[i], [<thermalfoundation:material:1027>, dictIngot]); #Petrotheum dust
				IECrusher.addRecipe(outputDusts[i], dictIngot, 1000); #IE Crusher
				for inputSpecific in dictIngot.itemArray{
					MKCrusher.addRecipe(inputSpecific, outputDusts[i]); #MK Crusher
					Pulverizer.addRecipe(outputDusts[i], inputSpecific, 1100); #Pulverizer 
				}
				#ic2 macerator must be done in config
				
			#Plates
				recipes.addShapeless(outputPlates[i], [<immersiveengineering:tool:0>, dictIngot]); #IE Engineers Hammer
				recipes.addShapeless(outputPlates[i], [<ic2:forge_hammer>.anyDamage().transformDamage(), dictIngot]); #ic2 Forge Hammer
				MetalPress.addRecipe(outputPlates[i], dictIngot, <immersiveengineering:mold>, 2400);
				Compactor.addPressRecipe(outputPlates[i], dictIngot.firstItem, 4000);
				
			#Gears
				recipes.addShaped(outputGears[i], [
					[null, dictIngot, null],
					[dictIngot, <ore:ingotIron>, dictIngot],
					[null, dictIngot, null] ]);
				recipes.addShaped(outputGears[i], [
					[null, dictIngot, null],
					[dictIngot, <ore:gearStone>, dictIngot],
					[null, dictIngot, null] ]);
				Compactor.addGearRecipe(outputGears[i], dictIngot.firstItem * 4, 4000);
				
		#AnyDusts ->
			addNormalSmeltingRecipes(dictAnyDust, outputIngots[i]); #Crushing recipes would also add hammer recipes from ingot -> dust, but we want those to result in plates
			
		#Plates ->
			recipes.addShapeless(outputDusts[i], [<thermalfoundation:material:1027>, dictPlate]); #Petrotheum dust
			IECrusher.addRecipe(outputDusts[i], dictPlate, 2500); #IE Crusher
			#ic2 macerator must be done in config
			
		#Gears ->
			addIngotDustRecipes(dictGear, outputIngots[i] * 2, dictGear, outputDusts[i] * 3); #Recycling of Gears by smelting as well as crushing
		
		#Liquid / Molten Metal ->
			Casting.addTableRecipe(outputNuggets[i], <tconstruct:cast_custom:1>, moltenMetals[i], 16);
			Casting.addTableRecipe(outputIngots[i], <tconstruct:cast_custom>, moltenMetals[i], 144);
			Casting.addBasinRecipe(outputBlocks[i], null, moltenMetals[i], 1296);
			
			Casting.addTableRecipe(outputPlates[i], <tconstruct:cast_custom:3>, moltenMetals[i], 144);
			Casting.addTableRecipe(outputGears[i], <tconstruct:cast_custom:4>, moltenMetals[i], 576);
		
}
#Exceptions
	#Recipe removal
		recipes.removeShaped(<thaumcraft:plate:2>); #Thaumium
		recipes.removeShaped(<thaumcraft:plate:3>); #Void Metal
	
	#Recipe creation
		#Other
			furnace.addRecipe(<minecraft:iron_ingot>, <galacticraftplanets:item_basic_asteroids:3>); #Furnace
			furnace.addRecipe(<minecraft:iron_ingot> * 2, <actuallyadditions:item_misc:20>); #Furnace
			furnace.addRecipe(<minecraft:iron_nugget>, <extrautils2:ironwood_planks:*>); #Furnace
			#todo re-add sheet metal -> plate recipes
