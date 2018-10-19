#priority 970

#start of the alloy processing unifying minetweaker script

#Imports
	import crafttweaker.item.IItemStack;
	import crafttweaker.item.IIngredient;
	import crafttweaker.item.WeightedItemStack;
	import crafttweaker.liquid.ILiquidStack;
	import crafttweaker.oredict.IOreDict;
	import crafttweaker.oredict.IOreDictEntry;
	import mods.immersiveengineering.AlloySmelter;
	import mods.immersiveengineering.ArcFurnace;
	import mods.immersiveengineering.BlastFurnace;
	import mods.immersiveengineering.Crusher;
	import mods.immersiveengineering.MetalPress;
	import mods.tconstruct.Alloy;
	import mods.thermalexpansion.Centrifuge;
	import mods.thermalexpansion.InductionSmelter;
	import mods.thermalexpansion.Pulverizer;
	
	import scripts.CT_001_Lists.metalNames;
	import scripts.CT_001_Lists.outputNuggets;
	import scripts.CT_001_Lists.outputIngots;
	import scripts.CT_001_Lists.outputBlocks;
	import scripts.CT_001_Lists.outputTinyDusts;
	import scripts.CT_001_Lists.outputDusts;
	import scripts.CT_001_Lists.moltenMetals;
	
	import scripts.CT_001_Lists.alloyOutputIndexes;
	import scripts.CT_001_Lists.alloyOutputAmounts;
	import scripts.CT_001_Lists.alloyOutputLiqAmounts;
	import scripts.CT_001_Lists.alloyInput1Indexes;
	import scripts.CT_001_Lists.alloyInput1Amounts;
	import scripts.CT_001_Lists.alloyInput1LiqAmounts;
	import scripts.CT_001_Lists.alloyInput2Indexes;
	import scripts.CT_001_Lists.alloyInput2Amounts;
	import scripts.CT_001_Lists.alloyInput2LiqAmounts;
	import scripts.CT_001_Lists.alloyInput3Bools;
	import scripts.CT_001_Lists.alloyInput3Indexes;
	import scripts.CT_001_Lists.alloyInput3Amounts;
	import scripts.CT_001_Lists.alloyInput3LiqAmounts;
	
	import scripts.CT_005_Functions.addStorageRecipeBothWays;
	import scripts.CT_005_Functions.addStorageRecipeBothWaysSimple;
	
#Variables
	var anyDustIron = <ore:anyDustIron>;
	var anyDustCopper = <ore:anyDustCopper>;
	var anyDustSilver = <ore:anyDustSilver>;
	var anyDustTin = <ore:anyDustTin>;
	var anyDustLead = <ore:anyDustLead>;
	var anyDustPlatinum = <ore:anyDustPlatinum>;
		
#Recipe removal
		for outputIndex in alloyOutputIndexes {
			Alloy.removeRecipe(moltenMetals[outputIndex]);
		}
		BlastFurnace.removeRecipe(<immersiveengineering:storage:8>); #Steel
	
#Recipe creation
	#steel
		recipes.addShapeless(<thermalfoundation:material:96>, [anyDustIron ,<ore:dustCoal> ,<ore:dustCoal> ,<ore:dustCoal> ,<ore:dustCoal>]);
		BlastFurnace.addRecipe(<thermalfoundation:storage_alloy:0>, <ore:blockIron>, 16000, <thermalfoundation:material:864> * 9);
	#signalum
		recipes.addShapeless(<thermalfoundation:material:101> * 4, [anyDustCopper ,anyDustCopper ,anyDustCopper ,anyDustSilver, 
			<forge:bucketfilled>.withTag( {Amount : 1000, FluidName : "redstone"} )]);
	#lumium
		recipes.addShapeless(<thermalfoundation:material:102> * 4, [anyDustTin ,anyDustTin ,anyDustTin ,anyDustSilver, 
			<forge:bucketfilled>.withTag( {Amount : 1000, FluidName : "glowstone"} )]);
	#enderium
		recipes.addShapeless(<thermalfoundation:material:103> * 4, [anyDustLead ,anyDustLead ,anyDustLead ,anyDustPlatinum, 
			<forge:bucketfilled>.withTag( {Amount : 1000, FluidName : "ender"} )]);
			
	#New Ingredient variants
		addStorageRecipeBothWaysSimple(<tconstruct:edible:2>, <contenttweaker:purple_slime_tiny_ball>); #Purple Slime Ball
		addStorageRecipeBothWaysSimple(<ic2:dust:15>, <contenttweaker:stone_tiny_dust>); #Stone Dust
		addStorageRecipeBothWays(<ore:anyBaseBlood>, <minecraft:rotten_flesh>, <ore:anySmallBlood>, <contenttweaker:rotten_flesh_nugget>); #Rotten Flesh
		addStorageRecipeBothWaysSimple(<minecraft:clay_ball>, <contenttweaker:clay_tiny_ball>); #Clay Ball
		addStorageRecipeBothWaysSimple(<minecraft:prismarine_crystals>, <contenttweaker:prismarine_nugget>); #Prismarine
		addStorageRecipeBothWaysSimple(<contenttweaker:compressed_clay>, <minecraft:clay_ball>); #Compressed Clay
		addStorageRecipeBothWaysSimple(<contenttweaker:compressed_mercury>, <basemetals:mercury_ingot>); #Compressed Mercury
		addStorageRecipeBothWays(<ore:anyBlockBlood>, <thaumcraft:flesh_block>, <ore:anyBaseBlood>, <minecraft:rotten_flesh>); #Block of Flesh
		
	#List
		for i, outputIndex in alloyOutputIndexes {
			#Getting variables
				var input1Index = alloyInput1Indexes[i];
				var input2Index = alloyInput2Indexes[i];
				var input3Index = alloyInput3Indexes[i];
				
				var outputAmount = alloyOutputAmounts[i];
				var input1Amount = alloyInput1Amounts[i];
				var input2Amount = alloyInput2Amounts[i];
				var input3Amount = alloyInput3Amounts[i];
				
				var outputLiqAmount = alloyOutputLiqAmounts[i];
				var input1LiqAmount = alloyInput1LiqAmounts[i];
				var input2LiqAmount = alloyInput2LiqAmounts[i];
				var input3LiqAmount = alloyInput3LiqAmounts[i];
				
				var outputName = metalNames[outputIndex];
				var input1Name = "" as string;
				if (input1Index < metalNames.length) {
					input1Name = metalNames[input1Index];
				}
				var input2Name = "" as string;
				if (input2Index < metalNames.length) {
					input2Name = metalNames[input2Index];
				}
				var input3Name = "" as string;
				if (input3Index < metalNames.length) {
					input3Name = metalNames[input3Index];
				}
				
				var input3Bool as bool = alloyInput3Bools[i];
				
			#Dust Table Blending
				if (input1Amount + input2Amount + input3Amount <= 9) {
					var inputTinyDusts as IIngredient[] = [];
					var inputDusts as IIngredient[] = [];
					
					var dustTiny as IIngredient;
					var dust as IIngredient;
					if (input1Index < metalNames.length) {
						dustTiny = oreDict.get("dustTiny" + input1Name);
						dust = oreDict.get("anyDust" + input1Name);
					} else {
						dustTiny = outputTinyDusts[input1Index];
						dust = outputDusts[input1Index];
					}
					for i in 0 to input1Amount {
						inputTinyDusts += dustTiny;
						inputDusts += dust;
					}
					
					if (input2Index < metalNames.length) {
						dustTiny = oreDict.get("dustTiny" + input2Name);
						dust = oreDict.get("anyDust" + input2Name);
					} else {
						dustTiny = outputTinyDusts[input2Index];
						dust = outputDusts[input2Index];
					}
					for i in 0 to input2Amount {
						inputTinyDusts += dustTiny;
						inputDusts += dust;
					}
					
					if (input3Bool) { #only if there is a third input
						if (input3Index < metalNames.length) {
							dustTiny = oreDict.get("dustTiny" + input3Name);
							dust = oreDict.get("anyDust" + input3Name);
						} else {
							dustTiny = outputTinyDusts[input3Index];
							dust = outputDusts[input3Index];
						}
						for i in 0 to input3Amount {
							inputTinyDusts += dustTiny;
							inputDusts += dust;
						}
					}
					recipes.addShapeless(outputTinyDusts[outputIndex] * outputAmount, inputTinyDusts);
					recipes.addShapeless(outputDusts[outputIndex] * outputAmount, inputDusts);
				}
				
			#Alloy Smelters and TF Centrifuge
				var inputSmall1 as IIngredient;
				var inputSmall2 as IIngredient;
				var inputBase1 as IIngredient;
				var inputBase2 as IIngredient;
				var inputLarge1 as IIngredient;
				var inputLarge2 as IIngredient;
				
				if (input1Index < metalNames.length) {
					inputSmall1 = oreDict.get("anySmall" + input1Name);
					inputBase1 = oreDict.get("anyBase" + input1Name);
					inputLarge1 = oreDict.get("block" + input1Name);
				} else {
					inputSmall1 = outputNuggets[input1Index];
					inputBase1 = outputIngots[input1Index];
					inputLarge1 = outputBlocks[input1Index];
				}
				
				if (input2Index < metalNames.length) {
					inputSmall2 = oreDict.get("anySmall" + input2Name);
					inputBase2 = oreDict.get("anyBase" + input2Name);
					inputLarge2 = oreDict.get("block" + input2Name);
				} else {
					inputSmall2 = outputNuggets[input2Index];
					inputBase2 = outputIngots[input2Index];
					inputLarge2 = outputBlocks[input2Index];
				}
				
				var arcFurnaceInputSmall as IIngredient[];
				var arcFurnaceInputBase as IIngredient[];
				var arcFurnaceInputLarge as IIngredient[];
				var smelteryAlloyInputLiquids as ILiquidStack[];
				var teCentrifugeOutput as WeightedItemStack[];
				
				if (input3Bool) { #only if there is a third input
					var inputSmall3 as IIngredient;
					var inputBase3 as IIngredient;
					var inputLarge3 as IIngredient;
					
					if (input3Index < metalNames.length) {
						inputSmall3 = oreDict.get("anySmall" + input3Name);
						inputBase3 = oreDict.get("anyBase" + input3Name);
						inputLarge3 = oreDict.get("block" + input3Name);
					} else {
						inputSmall3 = outputNuggets[input3Index];
						inputBase3 = outputIngots[input3Index];
						inputLarge3 = outputBlocks[input3Index];
					}
					arcFurnaceInputSmall = [inputSmall2 * input2Amount, inputSmall3 * input3Amount]; #alloying nuggets
					arcFurnaceInputBase = [inputBase2 * input2Amount, inputBase3 * input3Amount]; #alloying ingots
					arcFurnaceInputLarge = [inputLarge2 * input2Amount, inputLarge3 * input3Amount]; #alloying blocks
					smelteryAlloyInputLiquids = [
						moltenMetals[input1Index] * input1LiqAmount,
						moltenMetals[input2Index] * input2LiqAmount,
						moltenMetals[input3Index] * input3LiqAmount]; #smeltery alloying
					teCentrifugeOutput = [
						outputDusts[input1Index] * input1Amount,
						outputDusts[input2Index] * input2Amount,
						outputDusts[input3Index] * input3Amount];
				} else { #if there is no third input
					#Nuggets
						AlloySmelter.addRecipe(outputNuggets[outputIndex] * outputAmount, inputSmall1 * input1Amount, inputSmall2 * input2Amount, outputAmount * 200); #alloying
						arcFurnaceInputSmall = [inputSmall2 * input2Amount]; #alloying
						for input1 in inputSmall1.itemArray{
							for input2 in inputSmall2.itemArray{
								InductionSmelter.addRecipe(outputNuggets[outputIndex] * outputAmount, input1 * input1Amount, input2 * input2Amount, outputAmount * 100); #Induction Furnace
							}
						}
					#Ingots
						AlloySmelter.addRecipe(outputIngots[outputIndex] * outputAmount, inputBase1 * input1Amount, inputBase2 * input2Amount, outputAmount * 1600); #alloying
						arcFurnaceInputBase = [inputBase2 * input2Amount]; #alloying
						for input1 in inputBase1.itemArray{
							for input2 in inputBase2.itemArray{
								InductionSmelter.addRecipe(outputIngots[outputIndex] * outputAmount, input1 * input1Amount, input2 * input2Amount, outputAmount * 800); #Induction Furnace
							}
						}
					#Blocks
						AlloySmelter.addRecipe(outputBlocks[outputIndex] * outputAmount, inputLarge1 * input1Amount, inputLarge2 * input2Amount, outputAmount * 12800); #alloying
						arcFurnaceInputLarge = [inputLarge2 * input2Amount]; #alloying
						for input1 in inputLarge1.itemArray{
							for input2 in inputLarge2.itemArray{
								InductionSmelter.addRecipe(outputBlocks[outputIndex] * outputAmount, input1 * input1Amount, input2 * input2Amount, outputAmount * 6400); #Induction Furnace
							}
						}
					smelteryAlloyInputLiquids = [
						moltenMetals[input1Index] * input1LiqAmount,
						moltenMetals[input2Index] * input2LiqAmount]; #smeltery alloying
					teCentrifugeOutput = [
						outputDusts[input1Index] * input1Amount,
						outputDusts[input2Index] * input2Amount];
				}
				ArcFurnace.addRecipe(outputNuggets[outputIndex] * outputAmount, inputSmall1 * input1Amount, null, outputAmount * 10, 512, arcFurnaceInputSmall, "Alloying"); #alloying nuggets
				ArcFurnace.addRecipe(outputIngots[outputIndex] * outputAmount, inputBase1 * input1Amount, null, outputAmount * 80, 512, arcFurnaceInputBase, "Alloying"); #alloying ingots
				ArcFurnace.addRecipe(outputBlocks[outputIndex] * outputAmount, inputLarge1 * input1Amount, null, outputAmount * 640, 512, arcFurnaceInputLarge, "Alloying"); #alloying blocks
				Alloy.addRecipe(moltenMetals[outputIndex] * outputLiqAmount, smelteryAlloyInputLiquids); #TiC smeltery alloying
				for inputDust in oreDict.get("dust" + outputName).itemArray{
					Centrifuge.addRecipe(teCentrifugeOutput, inputDust * outputAmount, null, 2000 * outputAmount);
					#todo do this for tiny dusts as well once the zombie flesh etc. ar correct in the lists
				}
		}
		
#todo:
	#1. replace ie and ic2 slag completely with tf slag?
	#2. sagmill still creates ic2 lapis dust
	#3. Arc Furnace Recycling still yields IE nuggets and ingots
