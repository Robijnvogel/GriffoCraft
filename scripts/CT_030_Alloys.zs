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
	
	import scripts.CT_002_Lists as L;
	import scripts.CT_006_Functions as F;
	
#Variables
	var anyDustIron = <ore:anyDustIron>;
	var anyDustCopper = <ore:anyDustCopper>;
	var anyDustSilver = <ore:anyDustSilver>;
	var anyDustTin = <ore:anyDustTin>;
	var anyDustLead = <ore:anyDustLead>;
	var anyDustPlatinum = <ore:anyDustPlatinum>;
		
#Recipe removal
		for outputIndex in L.alloyOutputIndexes {
			Alloy.removeRecipe(L.moltenMetals[outputIndex]);
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
		F.addStorageRecipeBothWaysSimple(<tconstruct:edible:2>, <contenttweaker:purple_slime_tiny_ball>); #Purple Slime Ball
		F.addStorageRecipeBothWaysSimple(<ic2:dust:15>, <contenttweaker:stone_tiny_dust>); #Stone Dust
		F.addStorageRecipeBothWays(<ore:anyBaseBlood>, <minecraft:rotten_flesh>, <ore:anySmallBlood>, <contenttweaker:rotten_flesh_nugget>); #Rotten Flesh
		F.addStorageRecipeBothWaysSimple(<minecraft:clay_ball>, <contenttweaker:clay_tiny_ball>); #Clay Ball
		F.addStorageRecipeBothWaysSimple(<minecraft:prismarine_crystals>, <contenttweaker:prismarine_nugget>); #Prismarine
		F.addStorageRecipeBothWaysSimple(<contenttweaker:compressed_clay>, <minecraft:clay_ball>); #Compressed Clay
		F.addStorageRecipeBothWaysSimple(<contenttweaker:compressed_mercury>, <basemetals:mercury_ingot>); #Compressed Mercury
		F.addStorageRecipeBothWays(<ore:anyBlockBlood>, <thaumcraft:flesh_block>, <ore:anyBaseBlood>, <minecraft:rotten_flesh>); #Block of Flesh
		
	#List
		for i, outputIndex in L.alloyOutputIndexes {
			#Getting variables
				var input1Index = L.alloyInput1Indexes[i];
				var input2Index = L.alloyInput2Indexes[i];
				var input3Index = L.alloyInput3Indexes[i];
				
				var outputAmount = L.alloyOutputAmounts[i];
				var input1Amount = L.alloyInput1Amounts[i];
				var input2Amount = L.alloyInput2Amounts[i];
				var input3Amount = L.alloyInput3Amounts[i];
				
				var outputLiqAmount = L.alloyOutputLiqAmounts[i];
				var input1LiqAmount = L.alloyInput1LiqAmounts[i];
				var input2LiqAmount = L.alloyInput2LiqAmounts[i];
				var input3LiqAmount = L.alloyInput3LiqAmounts[i];
				
				var outputName = L.metalNames[outputIndex];
				var input1Name = "" as string;
				if (input1Index < L.metalNames.length) {
					input1Name = L.metalNames[input1Index];
				}
				var input2Name = "" as string;
				if (input2Index < L.metalNames.length) {
					input2Name = L.metalNames[input2Index];
				}
				var input3Name = "" as string;
				if (input3Index < L.metalNames.length) {
					input3Name = L.metalNames[input3Index];
				}
				
				var input3Bool as bool = L.alloyInput3Bools[i];
				
			#Dust Table Blending
				if (input1Amount + input2Amount + input3Amount <= 9) {
					var inputTinyDusts as IIngredient[] = [];
					var inputDusts as IIngredient[] = [];
					
					var dustTiny as IIngredient;
					var dust as IIngredient;
					if (input1Index < L.metalNames.length) {
						dustTiny = oreDict.get("dustTiny" + input1Name);
						dust = oreDict.get("anyDust" + input1Name);
					} else {
						dustTiny = L.outputTinyDusts[input1Index];
						dust = L.outputDusts[input1Index];
					}
					for i in 0 to input1Amount {
						inputTinyDusts += dustTiny;
						inputDusts += dust;
					}
					
					if (input2Index < L.metalNames.length) {
						dustTiny = oreDict.get("dustTiny" + input2Name);
						dust = oreDict.get("anyDust" + input2Name);
					} else {
						dustTiny = L.outputTinyDusts[input2Index];
						dust = L.outputDusts[input2Index];
					}
					for i in 0 to input2Amount {
						inputTinyDusts += dustTiny;
						inputDusts += dust;
					}
					
					if (input3Bool) { #only if there is a third input
						if (input3Index < L.metalNames.length) {
							dustTiny = oreDict.get("dustTiny" + input3Name);
							dust = oreDict.get("anyDust" + input3Name);
						} else {
							dustTiny = L.outputTinyDusts[input3Index];
							dust = L.outputDusts[input3Index];
						}
						for i in 0 to input3Amount {
							inputTinyDusts += dustTiny;
							inputDusts += dust;
						}
					}
					recipes.addShapeless(L.outputTinyDusts[outputIndex] * outputAmount, inputTinyDusts);
					recipes.addShapeless(L.outputDusts[outputIndex] * outputAmount, inputDusts);
				}
				
			#Alloy Smelters and TF Centrifuge
				var inputSmall1 as IIngredient;
				var inputSmall2 as IIngredient;
				var inputBase1 as IIngredient;
				var inputBase2 as IIngredient;
				var inputLarge1 as IIngredient;
				var inputLarge2 as IIngredient;
				
				if (input1Index < L.metalNames.length) {
					inputSmall1 = oreDict.get("anySmall" + input1Name);
					inputBase1 = oreDict.get("anyBase" + input1Name);
					inputLarge1 = oreDict.get("block" + input1Name);
				} else {
					inputSmall1 = L.outputNuggets[input1Index];
					inputBase1 = L.outputIngots[input1Index];
					inputLarge1 = L.outputBlocks[input1Index];
				}
				
				if (input2Index < L.metalNames.length) {
					inputSmall2 = oreDict.get("anySmall" + input2Name);
					inputBase2 = oreDict.get("anyBase" + input2Name);
					inputLarge2 = oreDict.get("block" + input2Name);
				} else {
					inputSmall2 = L.outputNuggets[input2Index];
					inputBase2 = L.outputIngots[input2Index];
					inputLarge2 = L.outputBlocks[input2Index];
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
					
					if (input3Index < L.metalNames.length) {
						inputSmall3 = oreDict.get("anySmall" + input3Name);
						inputBase3 = oreDict.get("anyBase" + input3Name);
						inputLarge3 = oreDict.get("block" + input3Name);
					} else {
						inputSmall3 = L.outputNuggets[input3Index];
						inputBase3 = L.outputIngots[input3Index];
						inputLarge3 = L.outputBlocks[input3Index];
					}
					arcFurnaceInputSmall = [inputSmall2 * input2Amount, inputSmall3 * input3Amount]; #alloying nuggets
					arcFurnaceInputBase = [inputBase2 * input2Amount, inputBase3 * input3Amount]; #alloying ingots
					arcFurnaceInputLarge = [inputLarge2 * input2Amount, inputLarge3 * input3Amount]; #alloying blocks
					smelteryAlloyInputLiquids = [
						L.moltenMetals[input1Index] * input1LiqAmount,
						L.moltenMetals[input2Index] * input2LiqAmount,
						L.moltenMetals[input3Index] * input3LiqAmount]; #smeltery alloying
					teCentrifugeOutput = [
						L.outputDusts[input1Index] * input1Amount,
						L.outputDusts[input2Index] * input2Amount,
						L.outputDusts[input3Index] * input3Amount];
				} else { #if there is no third input
					#Nuggets
						AlloySmelter.addRecipe(L.outputNuggets[outputIndex] * outputAmount, inputSmall1 * input1Amount, inputSmall2 * input2Amount, outputAmount * 200); #alloying
						arcFurnaceInputSmall = [inputSmall2 * input2Amount]; #alloying
						for input1 in inputSmall1.itemArray{
							for input2 in inputSmall2.itemArray{
								InductionSmelter.addRecipe(L.outputNuggets[outputIndex] * outputAmount, input1 * input1Amount, input2 * input2Amount, outputAmount * 100); #Induction Furnace
							}
						}
					#Ingots
						AlloySmelter.addRecipe(L.outputIngots[outputIndex] * outputAmount, inputBase1 * input1Amount, inputBase2 * input2Amount, outputAmount * 1600); #alloying
						arcFurnaceInputBase = [inputBase2 * input2Amount]; #alloying
						for input1 in inputBase1.itemArray{
							for input2 in inputBase2.itemArray{
								InductionSmelter.addRecipe(L.outputIngots[outputIndex] * outputAmount, input1 * input1Amount, input2 * input2Amount, outputAmount * 800); #Induction Furnace
							}
						}
					#Blocks
						AlloySmelter.addRecipe(L.outputBlocks[outputIndex] * outputAmount, inputLarge1 * input1Amount, inputLarge2 * input2Amount, outputAmount * 12800); #alloying
						arcFurnaceInputLarge = [inputLarge2 * input2Amount]; #alloying
						for input1 in inputLarge1.itemArray{
							for input2 in inputLarge2.itemArray{
								InductionSmelter.addRecipe(L.outputBlocks[outputIndex] * outputAmount, input1 * input1Amount, input2 * input2Amount, outputAmount * 6400); #Induction Furnace
							}
						}
					smelteryAlloyInputLiquids = [
						L.moltenMetals[input1Index] * input1LiqAmount,
						L.moltenMetals[input2Index] * input2LiqAmount]; #smeltery alloying
					teCentrifugeOutput = [
						L.outputDusts[input1Index] * input1Amount,
						L.outputDusts[input2Index] * input2Amount];
				}
				ArcFurnace.addRecipe(L.outputNuggets[outputIndex] * outputAmount, inputSmall1 * input1Amount, null, outputAmount * 10, 512, arcFurnaceInputSmall, "Alloying"); #alloying nuggets
				ArcFurnace.addRecipe(L.outputIngots[outputIndex] * outputAmount, inputBase1 * input1Amount, null, outputAmount * 80, 512, arcFurnaceInputBase, "Alloying"); #alloying ingots
				ArcFurnace.addRecipe(L.outputBlocks[outputIndex] * outputAmount, inputLarge1 * input1Amount, null, outputAmount * 640, 512, arcFurnaceInputLarge, "Alloying"); #alloying blocks
				Alloy.addRecipe(L.moltenMetals[outputIndex] * outputLiqAmount, smelteryAlloyInputLiquids); #TiC smeltery alloying
				for inputDust in oreDict.get("dust" + outputName).itemArray{
					Centrifuge.addRecipe(teCentrifugeOutput, inputDust * outputAmount, null, 2000 * outputAmount);
					#todo do this for tiny dusts as well once the zombie flesh etc. ar correct in the lists
				}
		}
		
#todo:
	#1. replace ie and ic2 slag completely with tf slag?
	#2. sagmill still creates ic2 lapis dust
	#3. Arc Furnace Recycling still yields IE nuggets and ingots
