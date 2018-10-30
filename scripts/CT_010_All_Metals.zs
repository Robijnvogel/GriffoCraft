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
	
	import scripts.CT_002_Lists as L;	
	import scripts.CT_006_Functions as F;
	
#All metals
for i, metalName in L.metalNames {

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
		#Ingot <-> Nuggets
			F.addStorageRecipeBothWays(dictIngot, L.outputIngots[i], dictNugget, L.outputNuggets[i]);
		#Block <-> Ingots
			F.addStorageRecipeBothWays(dictBlock, L.outputBlocks[i], dictIngot, L.outputIngots[i]);
		#Dust <-> Tiny dusts
			F.addStorageRecipeBothWays(dictDust, L.outputDusts[i], dictDustTiny, L.outputTinyDusts[i]);
		#Ingot <-> Dust
			#addIngotDustRecipes(dictIngot, dictDust) would also add hammer recipes from ingot -> dust, but we want those to result in plates
		#Nugget <-> Tiny dust
			F.addIngotDustRecipes(dictNugget, L.outputNuggets[i], dictDustTiny, L.outputTinyDusts[i]);
			
		#Nuggets ->
			recipes.addShapeless(L.outputTinyDusts[i] * 8, [<thermalfoundation:material:1027>, dictNugget, dictNugget, dictNugget, dictNugget, dictNugget, dictNugget, dictNugget, dictNugget]); #Petrotheum dust
			recipes.addShapeless(L.outputTinyDusts[i] * 8, [<immersiveengineering:tool:0>, dictNugget, dictNugget, dictNugget, dictNugget, dictNugget, dictNugget, dictNugget, dictNugget]); #IE Engineers Hammer
			recipes.addShapeless(L.outputTinyDusts[i] * 8, [<ic2:forge_hammer>.anyDamage().transformDamage(), dictNugget, dictNugget, dictNugget, dictNugget, dictNugget, dictNugget, dictNugget, dictNugget]); #ic2 Forge Hammer
			
		#Ingots ->
			#Dusts #addNormalCrushingRecipes() would also add hammer recipes from ingot -> dust, but we want those to result in plates
				recipes.addShapeless(L.outputDusts[i], [<thermalfoundation:material:1027>, dictIngot]); #Petrotheum dust
				IECrusher.addRecipe(L.outputDusts[i], dictIngot, 1000); #IE Crusher
				for inputSpecific in dictIngot.itemArray{
					MKCrusher.addRecipe(inputSpecific, L.outputDusts[i]); #MK Crusher
					Pulverizer.addRecipe(L.outputDusts[i], inputSpecific, 1100); #Pulverizer 
				}
				#ic2 macerator must be done in config
				
			#Plates
				recipes.addShapeless(L.outputPlates[i], [<immersiveengineering:tool:0>, dictIngot]); #IE Engineers Hammer
				recipes.addShapeless(L.outputPlates[i], [<ic2:forge_hammer>.anyDamage().transformDamage(), dictIngot]); #ic2 Forge Hammer
				MetalPress.addRecipe(L.outputPlates[i], dictIngot, <immersiveengineering:mold>, 2400);
				Compactor.addPressRecipe(L.outputPlates[i], dictIngot.firstItem, 4000);
				
			#Gears
				recipes.addShaped(L.outputGears[i], [
					[null, dictIngot, null],
					[dictIngot, <ore:ingotIron>, dictIngot],
					[null, dictIngot, null] ]);
				recipes.addShaped(L.outputGears[i], [
					[null, dictIngot, null],
					[dictIngot, <ore:gearStone>, dictIngot],
					[null, dictIngot, null] ]);
				Compactor.addGearRecipe(L.outputGears[i], dictIngot.firstItem * 4, 4000);
				
		#AnyDusts ->
			F.addNormalSmeltingRecipes(dictAnyDust, L.outputIngots[i]); #Crushing recipes would also add hammer recipes from ingot -> dust, but we want those to result in plates
			
		#Plates ->
			recipes.addShapeless(L.outputDusts[i], [<thermalfoundation:material:1027>, dictPlate]); #Petrotheum dust
			IECrusher.addRecipe(L.outputDusts[i], dictPlate, 2500); #IE Crusher
			#ic2 macerator must be done in config
			
		#Gears ->
			F.addIngotDustRecipes(dictGear, L.outputIngots[i] * 2, dictGear, L.outputDusts[i] * 3); #Recycling of Gears by smelting as well as crushing
		
		#Liquid / Molten Metal ->
			Casting.addTableRecipe(L.outputNuggets[i], <tconstruct:cast_custom:1>, L.moltenMetals[i], 16);
			Casting.addTableRecipe(L.outputIngots[i], <tconstruct:cast_custom>, L.moltenMetals[i], 144);
			Casting.addBasinRecipe(L.outputBlocks[i], null, L.moltenMetals[i], 1296);
			
			Casting.addTableRecipe(L.outputPlates[i], <tconstruct:cast_custom:3>, L.moltenMetals[i], 144);
			Casting.addTableRecipe(L.outputGears[i], <tconstruct:cast_custom:4>, L.moltenMetals[i], 576);
		
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
