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
	import mods.mekanism.combiner;
	import mods.mekanism.crusher as MKCrusher;
	import mods.mekanism.enrichment;
	import mods.mekanism.purification;
	import mods.tconstruct.Casting;
	import mods.tconstruct.Melting;
	import mods.thaumcraft.Crucible;
	import mods.thermalexpansion.Crucible as TECrucible;
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
		var dictDenseOre = oreDict.get("denseOre" + metalName);
		
		var dictDust = oreDict.get("dust" + metalName);

	#Recipe removal
		for ore in dictOre.itemArray{
			combiner.removeRecipe(ore);
		}

	#Recipe creation
		#Ores ->
			#todo make ore crushing always result in ic2 crushed ore?
			addOreProcessingRecipes(dictOre, outputIngots[i], secondaryIngots[i], outputDusts[i], secondaryDusts[i], 1, 20, moltenMetals[i], 144);
			for ore in dictOre.itemArray{
				dissolution.addRecipe(ore, slurries[i] * 1000); #Chemical Dissolution
				injection.addRecipe(ore, <gas:hydrogenchloride> * 175, outputShards[i] * 4); #chemical injection (ore -> 4 shards)
				purification.addRecipe(ore, <gas:oxygen> * 175, outputClumps[i] * 3); #purification (ore -> 3 clumps)
				combiner.addRecipe(ore * 6, null, dictDenseOre.firstItem);
			}
			Crucible.registerRecipe("cluster" + metalName + "Custom", "METALPURIFICATION",
				outputClusters[i], dictOre,
				[<aspect:ordo> * 5, <aspect:metallum> * 5]); #Thaumcraft ore processing (ore -> cluster)
			
		#Slurries
			washer.addRecipe(slurries[i], cleanSlurries[i]); #Chemical Washing
			crystallizer.addRecipe(slurries[i] * 300, outputCrystals[i]); #Chemical Crystalisation
		#Clean Slurries
			crystallizer.addRecipe(cleanSlurries[i] * 200, outputCrystals[i]); #Chemical Crystalisation
		#Crystals (4n) ->
			addOreProcessingRecipes(dictCrystal, outputNuggets[i], secondaryNuggets[i], outputTinyDusts[i], secondaryTinyDusts[i], 4, 10, moltenMetals[i], 16);
			for crystal in dictCrystal.itemArray{
				injection.addRecipe(crystal, <gas:hydrogenchloride> * 175, outputShards[i]); #chemical injection
			}
		#Shards (5n) ->
			addOreProcessingRecipes(dictShard, outputNuggets[i], secondaryNuggets[i], outputTinyDusts[i], secondaryTinyDusts[i], 5, 12, moltenMetals[i], 16);
			for shard in dictShard.itemArray{
				purification.addRecipe(shard, <gas:oxygen> * 175, outputClumps[i]); #purification
			}
		#Clumps (7n) ->
			addOreSmeltingRecipes(dictClump, outputNuggets[i], secondaryNuggets[i], 7, 14); #no crushing, because this should always yield 1 dirty dust, not multiple tiny dusts.
			addComplexCrushingRecipes(dictClump, outputDirtyDusts[i], secondaryDusts[i], 25, 10, 0.1);
			Melting.addRecipe(moltenMetals[i] * (16 * 7), dictClump);
			for inputSpecific in dictClump.itemArray{
				TECrucible.addRecipe(moltenMetals[i] * (16 * 7), inputSpecific, 14 * 400);
			}
			recipes.addShapeless(outputNuggets[i] * (7 + 1), [<thermalfoundation:material:1027>, <thermalfoundation:material:1024>, dictClump]); #Pyrotheum and Petrotheum dust
		#Dirty Dusts (8n) ->
			addOreSmeltingRecipes(dictDirtyDust, outputNuggets[i], secondaryNuggets[i], 8, 16);
			for dDust in dictDirtyDust.itemArray{
				enrichment.addRecipe(dDust, outputDusts[i]); #enrichment
			}
			Melting.addRecipe(moltenMetals[i] * (16 * 8), dictDirtyDust);
			for inputSpecific in dictDirtyDust.itemArray{
				TECrucible.addRecipe(moltenMetals[i] * (16 * 8), inputSpecific, 16 * 400);
			}
			
		#Clusters (2i) ->
			addOreProcessingRecipes(dictCluster, outputIngots[i], secondaryIngots[i], outputDusts[i], secondaryDusts[i], 2, 40, moltenMetals[i], 144);
			for cluster in dictCluster.itemArray{
				dissolution.addRecipe(cluster, slurries[i] * 1200); #Chemical Dissolution
				injection.addRecipe(cluster, <gas:hydrogenchloride> * 300, outputShards[i] * 5); #chemical injection (ore -> 4 shards)
				purification.addRecipe(cluster, <gas:oxygen> * 300, outputClumps[i] * 4); #purification (ore -> 3 clumps)
			}
		
		#Crushed
			addOreSmeltingRecipes(dictCrushed, outputIngots[i], secondaryIngots[i], 1, 20);
			for crushedOre in dictCrushed.itemArray{
				dissolution.addRecipe(crushedOre, slurries[i] * 550); #Chemical Dissolution
			}
			Melting.addRecipe(moltenMetals[i] * (16 * 11), dictCrushed);
			for inputSpecific in dictCrushed.itemArray{
				TECrucible.addRecipe(moltenMetals[i] * (16 * 11), inputSpecific, 20 * 400);
			}
		#Purified
			addOreSmeltingRecipes(dictPurified, outputIngots[i], secondaryIngots[i], 1, 20);
			for purifiedOre in dictPurified.itemArray{
				dissolution.addRecipe(purifiedOre, slurries[i] * 600); #Chemical Dissolution
				injection.addRecipe(purifiedOre, <gas:hydrogenchloride> * 200, outputShards[i] * 2); #chemical injection
			}
			Melting.addRecipe(moltenMetals[i] * (16 * 13), dictPurified);
			for inputSpecific in dictPurified.itemArray{
				TECrucible.addRecipe(moltenMetals[i] * (16 * 13), inputSpecific, 20 * 400);
			}
			
		#Dense Ores
			addOreProcessingRecipes(dictDenseOre, outputIngots[i], secondaryIngots[i], outputDusts[i], secondaryDusts[i], 8, 50, moltenMetals[i], 144);
			for ore in dictDenseOre.itemArray{
				dissolution.addRecipe(ore, slurries[i] * 5800); #Chemical Dissolution (dense ore -> 5 * 5 + 4 ingots worth of slurry)
				injection.addRecipe(ore, <gas:hydrogenchloride> * 900, outputShards[i] * 23); #chemical injection (dense ore -> 5 * 4 + 3 shards)
				purification.addRecipe(ore, <gas:oxygen> * 900, outputClumps[i] * 17); #purification (dense ore -> 5 * 3 + 2 clumps)
			}
			Crucible.registerRecipe("clusterDense" + metalName + "Custom", "METALPURIFICATION",
				outputClusters[i] * 6, dictDenseOre,
				[<aspect:ordo> * 24, <aspect:metallum> * 24]); #Thaumcraft ore processing (dense ore -> 6 clusters)
				
				
		#Combiner 16 Dusts -> 1 Ore
			for dust in dictDust.itemArray{
				for stone in <ore:materialStoneTool>.itemArray{
					combiner.addRecipe(dust * 16, stone, outputOre);
				}
			}
		
}
