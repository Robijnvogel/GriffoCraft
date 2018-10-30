#priority 994

#Imports
	import crafttweaker.item.IItemStack;
	import crafttweaker.item.IIngredient;
	import crafttweaker.liquid.ILiquidStack;
	
	import mods.immersiveengineering.AlloySmelter;
	import mods.immersiveengineering.ArcFurnace;
	import mods.immersiveengineering.Crusher as IECrusher;
	import mods.mekanism.crusher as MKCrusher;
	import mods.mekanism.enrichment;
	import mods.tconstruct.Melting;
	import mods.thermalexpansion.Crucible as TECrucible;
	import mods.thermalexpansion.InductionSmelter;
	import mods.thermalexpansion.Pulverizer;
	import mods.thermalexpansion.RedstoneFurnace;

#Storage recipes
	function addStorageRecipeBigToSmall(bigItem as IIngredient, smallItem as IItemStack) {
		recipes.addShapeless(smallItem * 9, [bigItem]);
	}
	
	function addStorageRecipeSmallToBig(bigItem as IItemStack, smallItem as IIngredient) {
		var inputs as IIngredient[] = [];
		for i in 0 to 9 {
			inputs += smallItem;
		}
		recipes.addShapeless(bigItem, inputs);
	}
	
	function addStorageRecipeBothWays(bigItem as IIngredient, bigItemStack as IItemStack, smallItem as IIngredient, smallItemStack as IItemStack) as int {
		addStorageRecipeBigToSmall(bigItem, smallItemStack);
		addStorageRecipeSmallToBig(bigItemStack, smallItem);
		return 0;
	}
	
	function addStorageRecipeBothWaysSimple(bigItem as IItemStack, smallItem as IItemStack) {
		addStorageRecipeBothWays(bigItem, bigItem, smallItem, smallItem);
	}

#Smelting recipes
	function addComplexSmeltingRecipes(input as IIngredient, output as IItemStack, slagOutput as bool, energyMultiplier as int, secondaryChanceIS as int, experience as double) {
			var slagItem = null;
			if (slagOutput) {
				slagItem = <thermalfoundation:material:864>;
			}
			
			furnace.addRecipe(output, input, experience); #Furnace
			recipes.addShapeless(output, [<thermalfoundation:material:1024>, input]); #Pyrotheum dust
			ArcFurnace.addRecipe(output, input, slagItem, 10 * energyMultiplier, 512); #IE Arc Furnace

			for inputSpecific in input.itemArray{
				RedstoneFurnace.addRecipe(output, inputSpecific, 150 * energyMultiplier); #Redstone Furnace
				InductionSmelter.addRecipe(output, inputSpecific, <minecraft:sand>, 100 * energyMultiplier, slagItem, 10); #Induction Furnace
			}
	}
	
	function addNormalSmeltingRecipes(input as IIngredient, output as IItemStack) {
		//default: slag as extra output, 10 * energy multiplier, 10% induction slag chance, 0.0 experience
		addComplexSmeltingRecipes(input, output, true, 10, 10, 0.0);
	}
	
	function addOreSmeltingRecipes(ore as IIngredient, output as IItemStack, secOutput as IItemStack, normalYield as int, energyMultiplier as int) {
		furnace.addRecipe(output * normalYield, ore, 0.7); #Furnace
		recipes.addShapeless(output * normalYield, [<thermalfoundation:material:1024>, ore]); #Pyrotheum dust
		recipes.addShapeless(output * (normalYield + 1), [<thermalfoundation:material:1027>, <thermalfoundation:material:1024>, ore]); #Pyrotheum and Petrotheum dust
		ArcFurnace.addRecipe(output * (normalYield + 1), ore, <thermalfoundation:material:864>, 5 * energyMultiplier, 512); #IE Arc Furnace

		for inputSpecific in ore.itemArray{
			RedstoneFurnace.addRecipe(output * normalYield, inputSpecific, 100 * energyMultiplier); #Redstone Furnace
			InductionSmelter.addRecipe(output * (normalYield + 1), inputSpecific, <minecraft:sand>, 100 * energyMultiplier, <thermalfoundation:material:865>, 5); #Induction Furnace Sand
			InductionSmelter.addRecipe(output * (normalYield + 2), inputSpecific, <thermalfoundation:material:865>, 150 * energyMultiplier, <thermalfoundation:material:864>, 75); #Induction Furnace Rich Slag
			InductionSmelter.addRecipe(output * (normalYield + 2), inputSpecific, <thermalfoundation:material:866>, 200 * energyMultiplier, secOutput, 100 * normalYield); #Induction Furnace Cinnabar
		}
	}
	
#Crushing recipes
	function addComplexCrushingRecipes(input as IIngredient, output as IItemStack, secOutput as IItemStack, energyMultiplier as int, secChanceTE as int, secChanceIE as double) {
		recipes.addShapeless(output, [<immersiveengineering:tool:0>, input]); #IE Engineers Hammer
		recipes.addShapeless(output, [<ic2:forge_hammer>.anyDamage().transformDamage(), input]); #ic2 Forge Hammer
		recipes.addShapeless(output, [<thermalfoundation:material:1027>, input]); #Petrotheum dust
		IECrusher.addRecipe(output, input, 100 * energyMultiplier, secOutput, secChanceIE); #IE Crusher
		
		for inputSpecific in input.itemArray{
			MKCrusher.addRecipe(inputSpecific, output); #MK Crusher
			Pulverizer.addRecipe(output, inputSpecific, 110 * energyMultiplier, secOutput, secChanceTE); #Pulveriser 
		}
	}
	
	function addNormalCrushingRecipes(input as IIngredient, output as IItemStack) {
		//default: no secondary output, 10 * energy multiplier, 0% secondary chance in pulverizer, 0.0 secondary chance in IE Crusher
		addComplexCrushingRecipes(input, output, null, 10, 0, 0.0);
	}
	
	function addOreCrushingRecipes(ore as IIngredient, output as IItemStack, secOutput as IItemStack, normalYield as int, energyMultiplier as int) {
		recipes.addShapeless(output * normalYield, [<immersiveengineering:tool:0>, ore]); #IE Engineers Hammer
		recipes.addShapeless(output * normalYield, [<ic2:forge_hammer>.anyDamage().transformDamage(), ore]); #ic2 Forge Hammer
		recipes.addShapeless(output * normalYield, [<thermalfoundation:material:1027>, ore]); #Petrotheum dust
		IECrusher.addRecipe(output* (normalYield + 1), ore, 100 * energyMultiplier, secOutput, 0.1 * (normalYield as double)); #IE Crusher
		
		for inputSpecific in ore.itemArray{
			enrichment.addRecipe(inputSpecific, output * (normalYield + 1)); #MK Enrichment Chamber (is used for ore crushing instead of Crusher in Mekanism, because Mekanism is weird)
			Pulverizer.addRecipe(output * (normalYield + 1), inputSpecific, 110 * energyMultiplier, secOutput, 15 * normalYield); #Pulverizer 
		}
		#ic2 macerator must be done in config
	}
	
#Ore processing (crushing and smelting)
	function addOreProcessingRecipes(ore as IIngredient, 
		outputIngot as IItemStack, 
		secOutputIngot as IItemStack, 
		outputDust as IItemStack, 
		secOutputDust as IItemStack, 
		normalYield as int, 
		energyMultiplier as int, 
		moltenMetal as ILiquidStack,
		meltingMbBase as int)
	{
		addOreSmeltingRecipes(ore, outputIngot, secOutputIngot, normalYield, energyMultiplier);
		addOreCrushingRecipes(ore, outputDust, secOutputDust, normalYield, energyMultiplier);
		
		Melting.addRecipe(moltenMetal * (meltingMbBase * (normalYield + 1)), ore);
		for inputSpecific in ore.itemArray{
			TECrucible.addRecipe(moltenMetal * (meltingMbBase * (normalYield + 1)), inputSpecific, energyMultiplier * 400);
		}
	}
	
#Ingots to dusts and vice versa
	function addIngotDustRecipes(ingot as IIngredient, ingotStack as IItemStack, dust as IIngredient, dustStack as IItemStack) {
		addNormalSmeltingRecipes(dust, ingotStack);
		addNormalCrushingRecipes(ingot, dustStack);
	}
	
	function addIngotDustRecipesSimple(ingot as IItemStack, dust as IItemStack) {
		addIngotDustRecipes(ingot, ingot, dust, dust);
	}
