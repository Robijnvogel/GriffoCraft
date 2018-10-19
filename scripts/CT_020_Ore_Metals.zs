#priority 980

#Imports
	import crafttweaker.item.IItemStack;
	import crafttweaker.item.IIngredient;
	import crafttweaker.liquid.ILiquidStack;
	import crafttweaker.oredict.IOreDict;
	import mods.immersiveengineering.ArcFurnace;
	import mods.immersiveengineering.Crusher as IECrusher;
	import mods.immersiveengineering.MetalPress;
	import mods.mekanism.chemical.crystallizer;
	import mods.mekanism.chemical.dissolution;
	import mods.mekanism.chemical.injection;
	import mods.mekanism.chemical.washer;
	import mods.mekanism.crusher as MKCrusher;
	import mods.mekanism.enrichment;
	import mods.mekanism.purification;
	import mods.tconstruct.Casting;
	import mods.tconstruct.Melting;
	import mods.thaumcraft.Crucible;
	import mods.thermalexpansion.Pulverizer;
	import mods.thermalexpansion.RedstoneFurnace;
	
	import scripts.CT_001_Lists.outputOres;
	import scripts.CT_001_Lists.secondaryDusts;
	import scripts.CT_001_Lists.secondaryIngots;
	import scripts.CT_001_Lists.secondaryNuggets;
	import scripts.CT_001_Lists.secondaryTinyDusts;
	
	import scripts.CT_001_Lists.outputCrystals;
	import scripts.CT_001_Lists.outputShards;
	import scripts.CT_001_Lists.outputClumps;
	import scripts.CT_001_Lists.outputDirtyDusts;
	import scripts.CT_001_Lists.outputClusters;
	
	import scripts.CT_001_Lists.metalNames;
	import scripts.CT_001_Lists.outputNuggets;
	import scripts.CT_001_Lists.outputIngots;
	import scripts.CT_001_Lists.outputBlocks;
	import scripts.CT_001_Lists.outputTinyDusts;
	import scripts.CT_001_Lists.outputDusts;
	import scripts.CT_001_Lists.moltenMetals;
	
	import scripts.CT_003_List_Gases.slurries;
	import scripts.CT_003_List_Gases.cleanSlurries;
	
	import scripts.CT_005_Functions.addOreSmeltingRecipes;
	import scripts.CT_005_Functions.addComplexCrushingRecipes;
	import scripts.CT_005_Functions.addOreCrushingRecipes;
	import scripts.CT_005_Functions.addOreProcessingRecipes;
	
for i, outputOre in outputOres {

	#Ore dictionary entries
		var metalName = metalNames[i];
		var dictOre = oreDict.get("ore" + metalName);
		var dictCrystal = oreDict.get("crystal" + metalName);
		var dictShard = oreDict.get("shard" + metalName);
		var dictClump = oreDict.get("clump" + metalName);
		var dictDirtyDust = oreDict.get("dustDirty" + metalName);
		var dictCluster = oreDict.get("cluster" + metalName);
		var dictCrushed = oreDict.get("crushed" + metalName);
		var dictPurified = oreDict.get("crushedPurified" + metalName);

	#Recipe removal
		for ore in dictOre.itemArray{
			mods.mekanism.combiner.removeRecipe(ore);
		}

	#Recipe creation
		#Ores ->
			#todo make ore crushing always result in ic2 crushed ore?
			addOreProcessingRecipes(dictOre, outputIngots[i], secondaryIngots[i], outputDusts[i], secondaryDusts[i], 1, 20);
			for ore in dictOre.itemArray{
				dissolution.addRecipe(ore, slurries[i] * 1000); #Chemical Dissolution
				injection.addRecipe(ore, <gas:hydrogenchloride> * 175, outputShards[i] * 4); #chemical injection (ore -> 4 shards)
				purification.addRecipe(ore, <gas:oxygen> * 175, outputClumps[i] * 3); #purification (ore -> 3 clumps)
			}
			Crucible.registerRecipe("cluster" + metalName + "Custom", "METALPURIFICATION", outputClusters[i], dictOre, [<aspect:ordo> * 5, <aspect:metallum> * 5]); #Thaumcraft ore processing (ore -> cluster)
			
		#Slurries
			washer.addRecipe(slurries[i], cleanSlurries[i]); #Chemical Washing
			crystallizer.addRecipe(slurries[i] * 300, outputCrystals[i]); #Chemical Crystalisation
		#Clean Slurries
			crystallizer.addRecipe(cleanSlurries[i] * 200, outputCrystals[i]); #Chemical Crystalisation
		#Crystals (4n) ->
			addOreProcessingRecipes(dictCrystal, outputNuggets[i], secondaryNuggets[i], outputTinyDusts[i], secondaryTinyDusts[i], 4, 10);
			for crystal in dictCrystal.itemArray{
				injection.addRecipe(crystal, <gas:hydrogenchloride> * 175, outputShards[i]); #chemical injection
			}
			Melting.addRecipe(moltenMetals[i] * 16 * 4, dictCrystal);
		#Shards (5n) ->
			addOreProcessingRecipes(dictShard, outputNuggets[i], secondaryNuggets[i], outputTinyDusts[i], secondaryTinyDusts[i], 5, 12);
			for shard in dictShard.itemArray{
				purification.addRecipe(shard, <gas:oxygen> * 175, outputClumps[i]); #purification
			}
			Melting.addRecipe(moltenMetals[i] * 16 * 5, dictShard);
		#Clumps (7n) ->
			addOreSmeltingRecipes(dictClump, outputNuggets[i], secondaryNuggets[i], 7, 14);
			addComplexCrushingRecipes(dictClump, outputDirtyDusts[i], secondaryDusts[i], 25, 10, 0.1);
			Melting.addRecipe(moltenMetals[i] * 16 * 7, dictClump);
		#Dirty Dusts (8n) ->
			addOreSmeltingRecipes(dictDirtyDust, outputNuggets[i], secondaryNuggets[i], 8, 16);
			for dDust in dictDirtyDust.itemArray{
				enrichment.addRecipe(dDust, outputDusts[i]); #enrichment
			}
			Melting.addRecipe(moltenMetals[i] * 16 * 8, dictDirtyDust);
			
		#Clusters (2i) ->
			addOreProcessingRecipes(dictCluster, outputIngots[i], secondaryIngots[i], outputDusts[i], secondaryDusts[i], 2, 40);
			for cluster in dictCluster.itemArray{
				dissolution.addRecipe(cluster, slurries[i] * 1200); #Chemical Dissolution
				injection.addRecipe(cluster, <gas:hydrogenchloride> * 300, outputShards[i] * 5); #chemical injection (ore -> 4 shards)
				purification.addRecipe(cluster, <gas:oxygen> * 300, outputClumps[i] * 4); #purification (ore -> 3 clumps)
			}
			Melting.addRecipe(moltenMetals[i] * 432, dictCluster);
		
		#Crushed
			addOreSmeltingRecipes(dictCrushed, outputIngots[i], secondaryIngots[i], 1, 20);
			for crushedOre in dictCrushed.itemArray{
				dissolution.addRecipe(crushedOre, slurries[i] * 550); #Chemical Dissolution
			}
			Melting.addRecipe(moltenMetals[i] * 180, dictCrushed);
		#Purified
			addOreSmeltingRecipes(dictPurified, outputIngots[i], secondaryIngots[i], 1, 20);
			for purifiedOre in dictPurified.itemArray{
				dissolution.addRecipe(purifiedOre, slurries[i] * 600); #Chemical Dissolution
				injection.addRecipe(purifiedOre, <gas:hydrogenchloride> * 200, outputShards[i] * 2); #chemical injection
			}
			Melting.addRecipe(moltenMetals[i] * 180, dictPurified);
}
