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
	
	import scripts.CT_002_Lists as L;
	import scripts.CT_004_List_Gases as G;
	import scripts.CT_006_Functions as F;
	
for i, outputOre in L.outputOres {

	#Ore dictionary entries
		var metalName = L.metalNames[i];
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
			F.addOreProcessingRecipes(dictOre, L.outputIngots[i], L.secondaryIngots[i], L.outputDusts[i], L.secondaryDusts[i], 1, 20, L.moltenMetals[i], 144);
			for ore in dictOre.itemArray{
				dissolution.addRecipe(ore, G.slurries[i] * 1000); #Chemical Dissolution
				injection.addRecipe(ore, <gas:hydrogenchloride> * 175, L.outputShards[i] * 4); #chemical injection (ore -> 4 shards)
				purification.addRecipe(ore, <gas:oxygen> * 175, L.outputClumps[i] * 3); #purification (ore -> 3 clumps)
				combiner.addRecipe(ore * 6, null, dictDenseOre.firstItem);
			}
			Crucible.registerRecipe("cluster" + metalName + "Custom", "METALPURIFICATION",
				L.outputClusters[i], dictOre,
				[<aspect:ordo> * 5, <aspect:metallum> * 5]); #Thaumcraft ore processing (ore -> cluster)
			
		#G.slurries
			washer.addRecipe(G.slurries[i], G.cleanSlurries[i]); #Chemical Washing
			crystallizer.addRecipe(G.slurries[i] * 300, L.outputCrystals[i]); #Chemical Crystalisation
		#Clean G.slurries
			crystallizer.addRecipe(G.cleanSlurries[i] * 200, L.outputCrystals[i]); #Chemical Crystalisation
		#Crystals (4n) ->
			F.addOreProcessingRecipes(dictCrystal, L.outputNuggets[i], L.secondaryNuggets[i], L.outputTinyDusts[i], L.secondaryTinyDusts[i], 4, 10, L.moltenMetals[i], 16);
			for crystal in dictCrystal.itemArray{
				injection.addRecipe(crystal, <gas:hydrogenchloride> * 175, L.outputShards[i]); #chemical injection
			}
		#Shards (5n) ->
			F.addOreProcessingRecipes(dictShard, L.outputNuggets[i], L.secondaryNuggets[i], L.outputTinyDusts[i], L.secondaryTinyDusts[i], 5, 12, L.moltenMetals[i], 16);
			for shard in dictShard.itemArray{
				purification.addRecipe(shard, <gas:oxygen> * 175, L.outputClumps[i]); #purification
			}
		#Clumps (7n) ->
			F.addOreSmeltingRecipes(dictClump, L.outputNuggets[i], L.secondaryNuggets[i], 7, 14); #no crushing, because this should always yield 1 dirty dust, not multiple tiny dusts.
			F.addComplexCrushingRecipes(dictClump, L.outputDirtyDusts[i], L.secondaryDusts[i], 25, 10, 0.1);
			Melting.addRecipe(L.moltenMetals[i] * (16 * 7), dictClump);
			for inputSpecific in dictClump.itemArray{
				TECrucible.addRecipe(L.moltenMetals[i] * (16 * 7), inputSpecific, 14 * 400);
			}
			recipes.addShapeless(L.outputNuggets[i] * (7 + 1), [<thermalfoundation:material:1027>, <thermalfoundation:material:1024>, dictClump]); #Pyrotheum and Petrotheum dust
		#Dirty Dusts (8n) ->
			F.addOreSmeltingRecipes(dictDirtyDust, L.outputNuggets[i], L.secondaryNuggets[i], 8, 16);
			for dDust in dictDirtyDust.itemArray{
				enrichment.addRecipe(dDust, L.outputDusts[i]); #enrichment
			}
			Melting.addRecipe(L.moltenMetals[i] * (16 * 8), dictDirtyDust);
			for inputSpecific in dictDirtyDust.itemArray{
				TECrucible.addRecipe(L.moltenMetals[i] * (16 * 8), inputSpecific, 16 * 400);
			}
			
		#Clusters (2i) ->
			F.addOreProcessingRecipes(dictCluster, L.outputIngots[i], L.secondaryIngots[i], L.outputDusts[i], L.secondaryDusts[i], 2, 40, L.moltenMetals[i], 144);
			for cluster in dictCluster.itemArray{
				dissolution.addRecipe(cluster, G.slurries[i] * 1200); #Chemical Dissolution
				injection.addRecipe(cluster, <gas:hydrogenchloride> * 300, L.outputShards[i] * 5); #chemical injection (ore -> 4 shards)
				purification.addRecipe(cluster, <gas:oxygen> * 300, L.outputClumps[i] * 4); #purification (ore -> 3 clumps)
			}
		
		#Crushed
			F.addOreSmeltingRecipes(dictCrushed, L.outputIngots[i], L.secondaryIngots[i], 1, 20);
			for crushedOre in dictCrushed.itemArray{
				dissolution.addRecipe(crushedOre, G.slurries[i] * 550); #Chemical Dissolution
			}
			Melting.addRecipe(L.moltenMetals[i] * (16 * 11), dictCrushed);
			for inputSpecific in dictCrushed.itemArray{
				TECrucible.addRecipe(L.moltenMetals[i] * (16 * 11), inputSpecific, 20 * 400);
			}
		#Purified
			F.addOreSmeltingRecipes(dictPurified, L.outputIngots[i], L.secondaryIngots[i], 1, 20);
			for purifiedOre in dictPurified.itemArray{
				dissolution.addRecipe(purifiedOre, G.slurries[i] * 600); #Chemical Dissolution
				injection.addRecipe(purifiedOre, <gas:hydrogenchloride> * 200, L.outputShards[i] * 2); #chemical injection
			}
			Melting.addRecipe(L.moltenMetals[i] * (16 * 13), dictPurified);
			for inputSpecific in dictPurified.itemArray{
				TECrucible.addRecipe(L.moltenMetals[i] * (16 * 13), inputSpecific, 20 * 400);
			}
			
		#Dense Ores
			F.addOreProcessingRecipes(dictDenseOre, L.outputIngots[i], L.secondaryIngots[i], L.outputDusts[i], L.secondaryDusts[i], 8, 50, L.moltenMetals[i], 144);
			for ore in dictDenseOre.itemArray{
				dissolution.addRecipe(ore, G.slurries[i] * 5800); #Chemical Dissolution (dense ore -> 5 * 5 + 4 ingots worth of slurry)
				injection.addRecipe(ore, <gas:hydrogenchloride> * 900, L.outputShards[i] * 23); #chemical injection (dense ore -> 5 * 4 + 3 shards)
				purification.addRecipe(ore, <gas:oxygen> * 900, L.outputClumps[i] * 17); #purification (dense ore -> 5 * 3 + 2 clumps)
			}
			Crucible.registerRecipe("clusterDense" + metalName + "Custom", "METALPURIFICATION",
				L.outputClusters[i] * 6, dictDenseOre,
				[<aspect:ordo> * 24, <aspect:metallum> * 24]); #Thaumcraft ore processing (dense ore -> 6 clusters)
				
				
		#Combiner 16 Ingots -> 1 Ore
			for dust in dictDust.itemArray{
				for stone in <ore:materialStoneTool>.itemArray{
					combiner.addRecipe(dust * 16, stone, outputOre);
				}
			}
		
}
