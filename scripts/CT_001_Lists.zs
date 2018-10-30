#priority 999
#modloaded basemetals ic2 mekanism nuclearcraft tconstruct thermalfoundation

#This script contains a lot of lists of materials that are used in the other scripts

	import crafttweaker.item.IItemStack;
	import crafttweaker.item.IIngredient;
	import crafttweaker.liquid.ILiquidStack;
	import crafttweaker.oredict.IOreDictEntry;

#Ore metals
	#These arrays will have the following indexes:
		#0 -> Iron
		#1 -> Gold
		#2 -> Copper
		#3 -> Tin
		#4 -> Silver
		#5 -> Lead
		#6 -> Aluminium
		#7 -> Nickel (Ferrous)
		#8 -> Platinum (Shiny)
		#9 -> Osmium
		#10 -> Ardite
		#11 -> Cobalt
		#12 -> Adamantine
		#13 -> Antimony
		#14 -> Bismuth
		#15 -> Cold-Iron
		#16 -> Star-Steel
		#17 -> Zinc
		#18 -> Uranium
		#19 -> Thorium
		#20 -> Boron
		#21 -> Lithium
		#22 -> Magnesium
	
	#Ores
		static outputOres as IItemStack[] = [
			<minecraft:iron_ore>,
			<minecraft:gold_ore>,
			<thermalfoundation:ore>, #copper
			<thermalfoundation:ore:1>, #tin
			<thermalfoundation:ore:2>, #silver
			<thermalfoundation:ore:3>, #lead
			<thermalfoundation:ore:4>, #aluminium
			<thermalfoundation:ore:5>, #nickel
			<thermalfoundation:ore:6>, #platinum
			<mekanism:oreblock:0>, #osmium
			<tconstruct:ore:1>, #ardite
			<tconstruct:ore:0>, #cobalt
			<basemetals:adamantine_ore>, #adamantine
			<basemetals:antimony_ore>, #antimony
			<basemetals:bismuth_ore>, #bismuth
			<basemetals:coldiron_ore>, #cold-iron
			<basemetals:starsteel_ore>, #star-steel
			<basemetals:zinc_ore>, #zinc
			<ic2:resource:4>, #uranium
			<nuclearcraft:ore:3>, #thorium
			<nuclearcraft:ore:5>, #boron
			<nuclearcraft:ore:6>, #lithium
			<nuclearcraft:ore:7> #magnesium
		];
	
	#Secondary ore processing outputs
		static secondaryDusts as IItemStack[] = [
			<thermalfoundation:material:69>, #iron -> nickel
			<thermalfoundation:material:866>, #gold -> cinnabar
			<minecraft:cobblestone>, #copper -> stone
			<thermalfoundation:material>, #tin -> iron
			<thermalfoundation:material:67>, #silver -> lead
			<thermalfoundation:material:66>, #lead -> silver
			<thermalfoundation:material:68>, #aluminium
			<thermalfoundation:material:70>, #nickel -> platinum
			<thermalfoundation:material:70>, #platinum -> platinum
			<mekanism:dust:2>, #osmium
			<enderio:item_material:31>, #ardite -> cobalt
			<enderio:item_material:30>, #cobalt -> ardite
			<basemetals:adamantine_powder>,
			<basemetals:antimony_powder>,
			<basemetals:bismuth_powder>,
			<basemetals:coldiron_powder>,
			<basemetals:starsteel_powder>,
			<basemetals:zinc_powder>,
			<immersiveengineering:metal:14>, #uranium -> lead
			<nuclearcraft:dust:3>, #thorium
			<nuclearcraft:dust:5>, #boron
			<nuclearcraft:dust:6>, #lithium
			<nuclearcraft:dust:7> #magnesium
		];
		static secondaryIngots as IItemStack[] = [
			<thermalfoundation:material:133>, #iron -> nickel
			<minecraft:gold_ingot>, #gold -> gold
			<thermalfoundation:material:129>, #copper -> tin
			<thermalfoundation:material:128>, #tin -> copper
			<thermalfoundation:material:131>, #silver -> lead
			<thermalfoundation:material:130>, #lead -> silver
			<thermalfoundation:material:132>, #aluminium
			<thermalfoundation:material:134>, #nickel -> platinum
			<thermalfoundation:material:134>, #platinum -> platinum
			<mekanism:ingot:1>, #osmium
			<tconstruct:ingots:0>, #ardite -> cobalt
			<tconstruct:ingots:1>, #cobalt -> ardite
			<basemetals:adamantine_ingot>,
			<basemetals:antimony_ingot>,
			<basemetals:bismuth_ingot>,
			<basemetals:coldiron_ingot>,
			<basemetals:starsteel_ingot>,
			<basemetals:zinc_ingot>,
			<thermalfoundation:material:131>, #uranium -> lead
			<nuclearcraft:ingot:3>, #thorium
			<nuclearcraft:ingot:5>, #boron
			<nuclearcraft:ingot:6>, #lithium
			<nuclearcraft:ingot:7> #magnesium
		];
		static secondaryNuggets as IItemStack[] = [
			<thermalfoundation:material:197>, #iron -> nickel
			<minecraft:gold_nugget>, #gold -> gold
			<thermalfoundation:material:193>, #copper -> tin
			<thermalfoundation:material:192>, #tin -> copper
			<thermalfoundation:material:195>, #silver -> lead
			<thermalfoundation:material:194>, #lead -> silver
			<thermalfoundation:material:196>, #aluminium
			<thermalfoundation:material:198>, #nickel -> platinum
			<thermalfoundation:material:198>, #platinum -> platinum
			<mekanism:nugget:1>, #osmium
			<tconstruct:nuggets:0>, #ardite -> cobalt
			<tconstruct:nuggets:1>, #cobalt -> ardite
			<basemetals:adamantine_nugget>,
			<basemetals:antimony_nugget>,
			<basemetals:bismuth_nugget>,
			<basemetals:coldiron_nugget>,
			<basemetals:starsteel_nugget>,
			<basemetals:zinc_nugget>,
			<thermalfoundation:material:195>, #uranium -> lead
			<contenttweaker:thorium_nugget>,
			<contenttweaker:boron_nugget>,
			<contenttweaker:lithium_nugget>,
			<contenttweaker:magnesium_nugget>
		];
		static secondaryTinyDusts as IItemStack[] = [
			<basemetals:nickel_smallpowder>, #iron -> nickel
			<ic2:dust:20>, #gold -> gold
			<ic2:dust:28>, #copper -> tin
			<ic2:dust:19>, #tin -> copper
			<ic2:dust:23>, #silver -> lead
			<ic2:dust:26>, #lead -> silver
			<contenttweaker:aluminium_tiny_dust>,
			<basemetals:platinum_smallpowder>, #nickel -> platinum
			<basemetals:platinum_smallpowder>,
			<contenttweaker:osmium_tiny_dust>,
			<contenttweaker:cobalt_tiny_dust>, #ardite -> cobalt
			<contenttweaker:ardite_tiny_dust>, #cobalt -> ardite
			<basemetals:adamantine_smallpowder>,
			<basemetals:antimony_smallpowder>,
			<basemetals:bismuth_smallpowder>,
			<basemetals:coldiron_smallpowder>,
			<basemetals:starsteel_smallpowder>,
			<basemetals:zinc_smallpowder>,
			<ic2:dust:23>, #uranium -> lead
			<contenttweaker:thorium_tiny_dust>,
			<contenttweaker:boron_tiny_dust>,
			<contenttweaker:lithium_tiny_dust>,
			<contenttweaker:magnesium_tiny_dust>
		];
		
	#Mekanism
		#Crystals
			static outputCrystals as IItemStack[] = [
				<mekanism:crystal:0>, #iron
				<mekanism:crystal:1>, #gold
				<mekanism:crystal:3>, #copper
				<mekanism:crystal:4>, #tin
				<mekanism:crystal:5>, #silver
				<mekanism:crystal:6>, #lead
				<contenttweaker:aluminium_crystal>, #aluminium
				<basemetals:nickel_crystal>, #nickel
				<basemetals:platinum_crystal>, #platinum
				<mekanism:crystal:2>, #osmium
				<contenttweaker:ardite_crystal>, #ardite
				<contenttweaker:cobalt_crystal>, #cobalt
				<basemetals:adamantine_crystal>, #adamantine
				<basemetals:antimony_crystal>, #antimony
				<basemetals:bismuth_crystal>, #bismuth
				<basemetals:coldiron_crystal>, #cold-iron
				<basemetals:starsteel_crystal>, #star-steel
				<basemetals:zinc_crystal>, #zinc
				<contenttweaker:uranium_crystal>, #uranium
				<contenttweaker:thorium_crystal>, #thorium
				<contenttweaker:boron_crystal>, #boron
				<contenttweaker:lithium_crystal>, #lithium
				<contenttweaker:magnesium_crystal> #magnesium
			];
		#Shards
			static outputShards as IItemStack[] = [
				<mekanism:shard:0>, #iron
				<mekanism:shard:1>, #gold
				<mekanism:shard:3>, #copper
				<mekanism:shard:4>, #tin
				<mekanism:shard:5>, #silver
				<mekanism:shard:6>, #lead
				<contenttweaker:aluminium_shard>, #aluminium
				<basemetals:nickel_shard>, #nickel
				<basemetals:platinum_shard>, #platinum
				<mekanism:shard:2>, #osmium
				<contenttweaker:ardite_shard>, #ardite
				<contenttweaker:cobalt_shard>, #cobalt
				<basemetals:adamantine_shard>, #adamantine
				<basemetals:antimony_shard>, #antimony
				<basemetals:bismuth_shard>, #bismuth
				<basemetals:coldiron_shard>, #cold-iron
				<basemetals:starsteel_shard>, #star-steel
				<basemetals:zinc_shard>, #zinc
				<contenttweaker:uranium_shard>, #uranium
				<contenttweaker:thorium_shard>, #thorium
				<contenttweaker:boron_shard>, #boron
				<contenttweaker:lithium_shard>, #lithium
				<contenttweaker:magnesium_shard> #magnesium
			];
		#Clumps
			static outputClumps as IItemStack[] = [
				<mekanism:clump:0>, #iron
				<mekanism:clump:1>, #gold
				<mekanism:clump:3>, #copper
				<mekanism:clump:4>, #tin
				<mekanism:clump:5>, #silver
				<mekanism:clump:6>, #lead
				<contenttweaker:aluminium_clump>, #aluminium
				<basemetals:nickel_clump>, #nickel
				<basemetals:platinum_clump>, #platinum
				<mekanism:clump:2>, #osmium
				<contenttweaker:ardite_clump>, #ardite
				<contenttweaker:cobalt_clump>, #cobalt
				<basemetals:adamantine_clump>, #adamantine
				<basemetals:antimony_clump>, #antimony
				<basemetals:bismuth_clump>, #bismuth
				<basemetals:coldiron_clump>, #cold-iron
				<basemetals:starsteel_clump>, #star-steel
				<basemetals:zinc_clump>, #zinc
				<contenttweaker:uranium_clump>, #uranium
				<contenttweaker:thorium_clump>, #thorium
				<contenttweaker:boron_clump>, #boron
				<contenttweaker:lithium_clump>, #lithium
				<contenttweaker:magnesium_clump> #magnesium
			];
		#Dirty Dusts
			static outputDirtyDusts as IItemStack[] = [
				<mekanism:dirtydust:0>, #iron
				<mekanism:dirtydust:1>, #gold
				<mekanism:dirtydust:3>, #copper
				<mekanism:dirtydust:4>, #tin
				<mekanism:dirtydust:5>, #silver
				<mekanism:dirtydust:6>, #lead
				<contenttweaker:aluminium_dirty_dust>, #aluminium
				<basemetals:nickel_powder_dirty>, #nickel
				<basemetals:platinum_powder_dirty>, #platinum
				<mekanism:dirtydust:2>, #osmium
				<contenttweaker:ardite_dirty_dust>, #ardite
				<contenttweaker:cobalt_dirty_dust>, #cobalt
				<basemetals:adamantine_powder_dirty>, #adamantine
				<basemetals:antimony_powder_dirty>, #antimony
				<basemetals:bismuth_powder_dirty>, #bismuth
				<basemetals:coldiron_powder_dirty>, #cold-iron
				<basemetals:starsteel_powder_dirty>, #star-steel
				<basemetals:zinc_powder_dirty>, #zinc
				<contenttweaker:uranium_dirty_dust>, #uranium
				<contenttweaker:thorium_dirty_dust>, #thorium
				<contenttweaker:boron_dirty_dust>, #boron
				<contenttweaker:lithium_dirty_dust>, #lithium
				<contenttweaker:magnesium_dirty_dust> #magnesium
			];
			
	#IC2
		#Crushed
			static outputCrushed as IItemStack[] = [
				<ic2:crushed:2>, #Iron
				<ic2:crushed:1>, #Gold
				<ic2:crushed>, #Copper
				<ic2:crushed:5>, #Tin
				<ic2:crushed:4>, #Silver
				<ic2:crushed:3>, #Lead
				<galacticraftcore:ic2compat:2>, #Aluminium
				<basemetals:nickel_crushed>, #Nickel
				<basemetals:platinum_crushed>, #Platinum
				<contenttweaker:osmium_crushed_ore>, #Osmium
				<contenttweaker:ardite_crushed_ore>, #Ardite
				<contenttweaker:cobalt_crushed_ore>, #Cobalt
				<basemetals:adamantine_crushed>, #Adamantine
				<basemetals:antimony_crushed>, #Antimony
				<basemetals:bismuth_crushed>, #Bismuth
				<basemetals:coldiron_crushed>, #Coldiron
				<basemetals:starsteel_crushed>, #Starsteel
				<basemetals:zinc_crushed>, #Zinc
				<contenttweaker:uranium_crushed_ore>, #Uranium
				<contenttweaker:thorium_crushed_ore>, #Thorium
				<contenttweaker:boron_crushed_ore>, #Boron
				<contenttweaker:lithium_crushed_ore>, #Lithium
				<contenttweaker:magnesium_crushed_ore> #Magnesium
			];
		#Purified
			static outputPurified as IItemStack[] = [
				<ic2:purified:2>, #Iron
				<ic2:purified:1>, #Gold
				<ic2:purified>, #Copper
				<ic2:purified:5>, #Tin
				<ic2:purified:4>, #Silver
				<ic2:purified:3>, #Lead
				<galacticraftcore:ic2compat:1>, #Aluminium
				<basemetals:nickel_crushed_purified>, #Nickel
				<basemetals:platinum_crushed_purified>, #Platinum
				<contenttweaker:osmium_purified_ore>, #Osmium
				<contenttweaker:ardite_purified_ore>, #Ardite
				<contenttweaker:cobalt_purified_ore>, #Cobalt
				<basemetals:adamantine_crushed_purified>, #Adamantine
				<basemetals:antimony_crushed_purified>, #Antimony
				<basemetals:bismuth_crushed_purified>, #Bismuth
				<basemetals:coldiron_crushed_purified>, #Coldiron
				<basemetals:starsteel_crushed_purified>, #Starsteel
				<basemetals:zinc_crushed_purified>, #Zinc
				<contenttweaker:uranium_purified_ore>, #Uranium
				<contenttweaker:thorium_purified_ore>, #Thorium
				<contenttweaker:boron_purified_ore>, #Boron
				<contenttweaker:lithium_purified_ore>, #Lithium
				<contenttweaker:magnesium_purified_ore> #Magnesium
			];
	#Thaumcraft
		#Clusters
			static outputClusters as IItemStack[] = [
				<thaumcraft:cluster:0>, #Iron
				<thaumcraft:cluster:1>, #Gold
				<thaumcraft:cluster:2>, #Copper
				<thaumcraft:cluster:3>, #Tin
				<thaumcraft:cluster:4>, #Silver
				<thaumcraft:cluster:5>, #Lead
				<contenttweaker:aluminium_cluster>, #Aluminium
				<contenttweaker:nickel_cluster>, #Nickel
				<contenttweaker:platinum_cluster>, #Platinum
				<contenttweaker:osmium_cluster>, #Osmium
				<contenttweaker:ardite_cluster>, #Ardite
				<contenttweaker:cobalt_cluster>, #Cobalt
				<contenttweaker:adamantine_cluster>, #Adamantine
				<contenttweaker:antimony_cluster>, #Antimony
				<contenttweaker:bismuth_cluster>, #Bismuth
				<contenttweaker:coldiron_cluster>, #Coldiron
				<contenttweaker:starsteel_cluster>, #Starsteel
				<contenttweaker:zinc_cluster>, #Zinc
				<contenttweaker:uranium_cluster>, #Uranium
				<contenttweaker:thorium_cluster>, #Thorium
				<contenttweaker:boron_cluster>, #Boron
				<contenttweaker:lithium_cluster>, #Lithium
				<contenttweaker:magnesium_cluster> #Magnesium
			];

#All Metals
	#These arrays will have the following indexes:
		#0 -> Iron
		#1 -> Gold
		#2 -> Copper
		#3 -> Tin
		#4 -> Silver
		#5 -> Lead
		#6 -> Aluminium
		#7 -> Nickel (Ferrous)
		#8 -> Platinum (Shiny)
		#9 -> Osmium
		#10 -> Ardite
		#11 -> Cobalt
		#12 -> Adamantine
		#13 -> Antimony
		#14 -> Bismuth
		#15 -> Cold-Iron
		#16 -> Star-Steel
		#17 -> Zinc
		#18 -> Uranium
		#19 -> Thorium
		#20 -> Boron
		#21 -> Lithium
		#22 -> Magnesium
		
		#23 -> Bronze
		#24 -> Electrum
		#25 -> Invar
		#26 -> Constantan
		#27 -> Aluminum brass
		#28 -> Manyullyn
		#29 -> Knightslime
		#30 -> Pigiron
		#31 -> Aquarium
		#32 -> Brass
		#33 -> Cupronickel
		#34 -> Mithril
		#35 -> Pewter
		
		#And optionally:
		#36 -> Purple Slime
		#37 -> Stone/Cobble
		#38 -> Rotten Flesh
		#39 -> Clay
		#40 -> Prismarine
		#41 -> Mercury
		
		#Missing metals (ingots)
			#TC6
				#Thaumium (plates)
				#VoidMetal
			#Steel
			#Thermal Foundation
				#Iridium
				#Signalum
				#Lumium
				#Enderium
			#NuclearCraft
				#Zircaloy
				#Thermoconducting Alloy
				#Extreme Alloy
				#LeadPlatinum
				#TinSilver
				#Shibuichi Alloy
				#FerroBoron Alloy
				#Lithium Manganese Dioxide Alloy
				#Magnesium Diboride Alloy
				#Hard Carbon Alloy
				#Tough Alloy
				#Manganese Dioxide
				#Manganese Oxide
				#Uranium Oxide
				#Thorium Oxide
				#Zirconium
				#Beryllium
				#Graphite
			#Mekanism
				#Refined Glowstone
				#Refined Obsidian
			#Immersive Engineering
				#HOP Graphite
			#GalactiCraft
				#Titanium
				#Desh
				#Meteoric Iron
			#ExUtil
				#Evil Infused Iron
				#Enchanted
				#Demon
				#Unstable
			#Ender IO
				#Vivid Alloy
				#NetherCotta
				#Enderium Base
				#End Steel
				#Soularium
				#Dark Steel
				#Pulsating Iron
				#Conductive Iron
				#Redstone Alloy
				#Vibrant Alloy
				#Energetic Alloy
				#Electical Steel
			#Base Metals
				#Mercury / QuickSilver
				#Redstone
				#Obsidian
			#Vanilla
				#Nether Brick
				#Brick
			#Botania
			#Other mods
				
	#Metal Names
		static metalNames as string[] = [
			"Iron",
			"Gold",
			"Copper",
			"Tin",
			"Silver",
			"Lead",
			"Aluminium",
			"Nickel",
			"Platinum",
			"Osmium",
			"Ardite",
			"Cobalt",
			"Adamantine",
			"Antimony",
			"Bismuth",
			"Coldiron",
			"Starsteel",
			"Zinc",		
			"Uranium",
			"Thorium",
			"Boron",
			"Lithium",
			"Magnesium",
			
			"Bronze",
			"Electrum",
			"Invar",
			"Constantan",
			"Alubrass",
			"Manyullyn",
			"Knightslime",
			"Pigiron",
			"Aquarium",
			"Brass",
			"Cupronickel",
			"Mithril",
			"Pewter"
		];
		
	#Lowercase Names
		static metalNamesLower as string[] = [
			"iron",
			"gold",
			"copper",
			"tin",
			"silver",
			"lead",
			"aluminium",
			"nickel",
			"platinum",
			"osmium",
			"ardite",
			"cobalt",
			"adamantine",
			"antimony",
			"bismuth",
			"coldiron",
			"starsteel",
			"zinc",
			"uranium",
			"thorium",
			"boron",
			"lithium",
			"magnesium",

			"bronze",
			"electrum",
			"invar",
			"constantan",
			"alubrass",
			"manyullyn",
			"knightslime",
			"pigiron",
			"aquarium",
			"brass",
			"cupronickel",
			"mithril",
			"pewter"
		];
		
	#Villager Ingot Trade Costs
		static ingotTradeCosts as int[] = [
			1, #iron
			2, #gold
			1, #copper
			1,
			2, #silver
			1,
			1, #aluminium
			2, #nickel
			7, #platinum
			3, #osmium
			3, #ardite
			4, #cobalt
			4, #adamantine
			1,
			1,
			3,
			4, #starsteel
			1,
			4, #uranium
			3,
			2,
			2,
			2,

			2, #bronze
			3,
			3,
			3,
			2,
			4, #manyullyn
			5, #knightslime
			3,
			4,
			2,
			3,
			2, #mithril
			4 #pewter
		];
		
	#Villager Ingot Trade Levels
		#todo after Forge fixes their shit, lower the trade levels again.
		static ingotTradeLevels as int[] = [
			1, #iron
			2, #gold
			1, #copper
			1,
			2, #silver
			1,
			1, #aluminium
			1, #nickel
			4, #platinum
			2, #osmium
			3, #ardite
			3, #cobalt
			3, #adamantine
			1,
			1,
			2,
			3, #starsteel
			1,
			2, #uranium
			2, #thorium
			1,
			1,
			1,

			2, #bronze
			3,
			3,
			3,
			2,
			4, #manyullyn
			4, #knightslime
			3,
			4,
			2,
			3,
			2, #mithril
			3 #pewter
		];
		
	#Villager Ingot Trade Levels
		static ingotTradeLevels_Backup as int[] = [
			0, #iron
			1, #gold
			0, #copper
			0,
			1, #silver
			0,
			0, #aluminium
			0, #nickel
			3, #platinum
			1, #osmium
			2, #ardite
			2, #cobalt
			2, #adamantine
			0,
			0,
			1,
			2, #starsteel
			0,
			1, #uranium
			1, #thorium
			0,
			0,
			0,

			1, #bronze
			2,
			2,
			2,
			1,
			3, #manyullyn
			3, #knightslime
			2,
			3,
			1,
			2,
			1, #mithril
			2 #pewter
		];
		
	#Nuggets
		static outputNuggets as IItemStack[] = [ 
			<minecraft:iron_nugget>,
			<minecraft:gold_nugget>,
			<thermalfoundation:material:192>, #copper
			<thermalfoundation:material:193>, #tin
			<thermalfoundation:material:194>, #silver
			<thermalfoundation:material:195>, #lead
			<thermalfoundation:material:196>, #aluminium
			<thermalfoundation:material:197>, #nickel
			<thermalfoundation:material:198>, #platinum
			<mekanism:nugget:1>, #osmium
			<tconstruct:nuggets:1>, #ardite
			<tconstruct:nuggets:0>, #cobalt
			<basemetals:adamantine_nugget>,
			<basemetals:antimony_nugget>,
			<basemetals:bismuth_nugget>,
			<basemetals:coldiron_nugget>,
			<basemetals:starsteel_nugget>,
			<basemetals:zinc_nugget>,
			<immersiveengineering:metal:25>, #uranium
			<contenttweaker:thorium_nugget>,
			<contenttweaker:boron_nugget>,
			<contenttweaker:lithium_nugget>,
			<contenttweaker:magnesium_nugget>,
			
			<thermalfoundation:material:227>, #bronze
			<thermalfoundation:material:225>, #electrum
			<thermalfoundation:material:226>, #invar
			<thermalfoundation:material:228>, #constantan
			<tconstruct:nuggets:5>, #aluminum brass
			<tconstruct:nuggets:2>, #manyullyn
			<tconstruct:nuggets:3>, #knightslime
			<tconstruct:nuggets:4>, #pigiron
			<basemetals:aquarium_nugget>,
			<basemetals:brass_nugget>,
			<basemetals:cupronickel_nugget>,
			<thermalfoundation:material:200>, #mithril
			<basemetals:pewter_nugget>,
			
			<contenttweaker:purple_slime_tiny_ball>, #Purple Slime
			<contenttweaker:stone_tiny_dust>, #Stone/Cobble
			<contenttweaker:rotten_flesh_nugget>, #Rotten Flesh
			<contenttweaker:clay_tiny_ball>, #Clay
			<contenttweaker:prismarine_nugget>, #Prismarine
			<basemetals:mercury_smallpowder> #Mercury
		];
	#Ingots
		static outputIngots as IItemStack[] = [
			<minecraft:iron_ingot>,
			<minecraft:gold_ingot>,
			<thermalfoundation:material:128>, #copper
			<thermalfoundation:material:129>, #tin
			<thermalfoundation:material:130>, #silver
			<thermalfoundation:material:131>, #lead
			<thermalfoundation:material:132>, #aluminium
			<thermalfoundation:material:133>, #nickel
			<thermalfoundation:material:134>, #platinum
			<mekanism:ingot:1>, #osmium
			<tconstruct:ingots:1>, #ardite
			<tconstruct:ingots:0>, #cobalt
			<basemetals:adamantine_ingot>,
			<basemetals:antimony_ingot>,
			<basemetals:bismuth_ingot>,
			<basemetals:coldiron_ingot>,
			<basemetals:starsteel_ingot>,
			<basemetals:zinc_ingot>,
			<immersiveengineering:metal:5>, #uranium
			<nuclearcraft:ingot:3>, #thorium
			<nuclearcraft:ingot:5>, #boron
			<nuclearcraft:ingot:6>, #lithium
			<nuclearcraft:ingot:7>, #magnesium
			
			<thermalfoundation:material:163>, #bronze
			<thermalfoundation:material:161>, #electrum
			<thermalfoundation:material:162>, #invar
			<thermalfoundation:material:164>, #constantan
			<tconstruct:ingots:5>, #aluminum brass
			<tconstruct:ingots:2>, #manyullyn
			<tconstruct:ingots:3>, #knightslime
			<tconstruct:ingots:4>, #pigiron
			<basemetals:aquarium_ingot>,
			<basemetals:brass_ingot>,
			<basemetals:cupronickel_ingot>,
			<thermalfoundation:material:136>, #mithril
			<basemetals:pewter_ingot>,
			
			<tconstruct:edible:2>, #Purple Slime
			<minecraft:cobblestone>, #Stone/Cobble
			<minecraft:rotten_flesh>, #Rotten Flesh
			<minecraft:clay_ball>, #Clay
			<minecraft:prismarine_crystals>, #Prismarine
			<basemetals:mercury_ingot> #Mercury
		];
	#Blocks
		static outputBlocks as IItemStack[] = [
			<minecraft:iron_block>,
			<minecraft:gold_block>,
			<thermalfoundation:storage>, #copper
			<thermalfoundation:storage:1>, #tin
			<thermalfoundation:storage:2>, #silver
			<thermalfoundation:storage:3>, #lead
			<thermalfoundation:storage:4>, #aluminium
			<thermalfoundation:storage:5>, #nickel
			<thermalfoundation:storage:6>, #platinum
			<mekanism:basicblock:0>, #osmium
			<tconstruct:metal:1>, #ardite
			<tconstruct:metal:0>, #cobalt
			<basemetals:adamantine_block>,
			<basemetals:antimony_block>,
			<basemetals:bismuth_block>,
			<basemetals:coldiron_block>,
			<basemetals:starsteel_block>,
			<basemetals:zinc_block>,
			<immersiveengineering:storage:5>, #uranium
			<nuclearcraft:ingot_block:3>, #thorium
			<nuclearcraft:ingot_block:5>, #boron
			<nuclearcraft:ingot_block:6>, #lithium
			<nuclearcraft:ingot_block:7>, #magnesium
			
			<thermalfoundation:storage_alloy:3>, #bronze
			<thermalfoundation:storage_alloy:1>, #electrum
			<thermalfoundation:storage_alloy:2>, #invar
			<thermalfoundation:storage_alloy:4>, #constantan
			<tconstruct:metal:5>, #aluminum brass
			<tconstruct:metal:2>, #manyullyn
			<tconstruct:metal:3>, #knightslime
			<tconstruct:metal:4>, #pigiron
			<basemetals:aquarium_block>,
			<basemetals:brass_block>,
			<basemetals:cupronickel_block>,
			<thermalfoundation:storage:8>, #mithril
			<basemetals:pewter_block>,
			
			<tconstruct:slime:2>, #Purple Slime
			<extrautils2:compressedcobblestone:0>, #Stone/Cobble
			<thaumcraft:flesh_block>, #Rotten Flesh
			<contenttweaker:compressed_clay>, #Clay
			<minecraft:sea_lantern>, #Prismarine
			<contenttweaker:compressed_mercury> #Mercury 
		];
	#Tiny Dusts
		static outputTinyDusts as IItemStack[] = [
			<ic2:dust:21>, #iron
			<ic2:dust:20>, #gold
			<ic2:dust:19>, #copper
			<ic2:dust:28>, #tin
			<ic2:dust:26>, #silver
			<ic2:dust:23>, #lead
			<contenttweaker:aluminium_tiny_dust>,
			<basemetals:nickel_smallpowder>,
			<basemetals:platinum_smallpowder>,
			<contenttweaker:osmium_tiny_dust>,
			<contenttweaker:ardite_tiny_dust>,
			<contenttweaker:cobalt_tiny_dust>,
			<basemetals:adamantine_smallpowder>,
			<basemetals:antimony_smallpowder>,
			<basemetals:bismuth_smallpowder>,
			<basemetals:coldiron_smallpowder>,
			<basemetals:starsteel_smallpowder>,
			<basemetals:zinc_smallpowder>,
			<contenttweaker:uranium_tiny_dust>,
			<contenttweaker:thorium_tiny_dust>,
			<contenttweaker:boron_tiny_dust>,
			<contenttweaker:lithium_tiny_dust>,
			<contenttweaker:magnesium_tiny_dust>,
			
			<ic2:dust:18>, #bronze
			<basemetals:electrum_smallpowder>,
			<basemetals:invar_smallpowder>,
			<contenttweaker:constantan_tiny_dust>,
			<contenttweaker:alubrass_tiny_dust>, #aluminum brass
			<contenttweaker:manyullyn_tiny_dust>,
			<contenttweaker:knightslime_tiny_dust>,
			<contenttweaker:pigiron_tiny_dust>,
			<basemetals:aquarium_smallpowder>,
			<basemetals:brass_smallpowder>,
			<basemetals:cupronickel_smallpowder>,
			<contenttweaker:mithril_tiny_dust>,
			<basemetals:pewter_smallpowder>,
			
			<contenttweaker:purple_slime_tiny_ball>, #Purple Slime
			<contenttweaker:stone_tiny_dust>, #Stone/Cobble
			<contenttweaker:rotten_flesh_nugget>, #Rotten Flesh
			<contenttweaker:clay_tiny_ball>, #Clay
			<contenttweaker:prismarine_nugget>, #Prismarine
			<basemetals:mercury_smallpowder> #Mercury
		];
	#Dusts
		static outputDusts as IItemStack[] = [
			<thermalfoundation:material>, #iron
			<thermalfoundation:material:1>, #gold
			<thermalfoundation:material:64>, #copper
			<thermalfoundation:material:65>, #tin
			<thermalfoundation:material:66>, #silver
			<thermalfoundation:material:67>, #lead
			<thermalfoundation:material:68>, #aluminium
			<thermalfoundation:material:69>, #nickel
			<thermalfoundation:material:70>, #platinum
			<mekanism:dust:2>, #osmium
			<enderio:item_material:30>, #ardite
			<enderio:item_material:31>, #cobalt
			<basemetals:adamantine_powder>,
			<basemetals:antimony_powder>,
			<basemetals:bismuth_powder>,
			<basemetals:coldiron_powder>,
			<basemetals:starsteel_powder>,
			<basemetals:zinc_powder>,
			<immersiveengineering:metal:14>, #uranium
			<nuclearcraft:dust:3>, #thorium
			<nuclearcraft:dust:5>, #boron
			<nuclearcraft:dust:6>, #lithium
			<nuclearcraft:dust:7>, #magnesium
			
			<thermalfoundation:material:99>, #bronze
			<thermalfoundation:material:97>, #electrum
			<thermalfoundation:material:98>, #invar
			<thermalfoundation:material:100>, #constantan
			<contenttweaker:alubrass_dust>, #aluminum brass
			<contenttweaker:manyullyn_dust>,
			<contenttweaker:knightslime_dust>,
			<contenttweaker:pigiron_dust>,
			<basemetals:aquarium_powder>,
			<basemetals:brass_powder>,
			<basemetals:cupronickel_powder>,
			<thermalfoundation:material:72>, #mithril
			<basemetals:pewter_powder>,
			
			<tconstruct:edible:2>, #Purple Slime
			<ic2:dust:15>, #Stone/Cobble
			<minecraft:rotten_flesh>, #Rotten Flesh
			<ic2:dust:1>, #Clay
			<minecraft:prismarine_crystals>, #Prismarine
			<basemetals:mercury_powder> #Mercury
		];
		
	#Liquids (molten metals)
		static moltenMetals as ILiquidStack[] = [
			<liquid:iron>, #iron
			<liquid:gold>, #gold
			<liquid:copper>, #copper
			<liquid:tin>, #tin
			<liquid:silver>, #silver
			<liquid:lead>, #lead
			<liquid:aluminum>, #aluminium
			<liquid:nickel>, #nickel
			<liquid:platinum>, #platinum
			<liquid:osmium>, #osmium
			<liquid:ardite>, #ardite
			<liquid:cobalt>, #cobalt
			<liquid:adamantine>, #adamantine
			<liquid:antimony>, #antimony
			<liquid:bismuth>, #bismuth
			<liquid:coldiron>, #cold-iron
			<liquid:starsteel>, #star-steel
			<liquid:zinc>, #zinc
			<liquid:uranium>, #uranium
			<liquid:thorium>, #thorium
			<liquid:boron>, #boron
			<liquid:lithium>, #lithium
			<liquid:magnesium>, #magnesium
			
			<liquid:bronze>, #bronze
			<liquid:electrum>, #electrum
			<liquid:invar>, #invar
			<liquid:constantan>, #constantan
			<liquid:alubrass>, #aluminum brass
			<liquid:manyullyn>,
			<liquid:knightslime>,
			<liquid:pigiron>,
			<liquid:aquarium>,
			<liquid:brass>,
			<liquid:cupronickel>,
			<liquid:mithril>,
			<liquid:pewter>,
			
			<liquid:purpleslime>, #Purple Slime
			<liquid:stone>, #Stone/Cobble
			<liquid:blood>, #Blood
			<liquid:clay>, #Clay
			<liquid:prismarine>, #Prismarine
			<liquid:mercury> #Mercury
		];
		
		static metalColours as int[] = [
			12566463, #Iron
			16777039, #Gold
			16757789, #Copper
			13558755, #Tin
			15397362, #Silver
			8490943, #Lead
			15395572, #Aluminium
			15790296, #Nickel
			9568255, #Platinum
			12767960, #Osmium
			15686952, #Ardite
			2324189, #Cobalt
			4862776, #Adamantine
			14212314, #Antimony
			14342355, #Bismuth
			12699881, #Cold-Iron
			262144, #Star-Steel
			11908533, #Zinc
			8031340, #Uranium
			2894892, #Thorium
			10526880, #Boron
			15856113, #Lithium
			16242431, #Magnesium
			
			12421458, #Bronze
			16777115, #Electrum
			12502210, #Invar
			16241274, #Constantan
			15717479, #Aluminum Brass
			11107808, #Manyullyn
			14386417, #Knightslime
			15771812, #Pigiron
			2337757, #Aquarium
			16769127, #Brass
			13747628, #Cupronickel
			6395571, #Mithril
			12303552 #Pewter
		];
	
	#Plates
		static outputPlates as IItemStack[] = [
			<thermalfoundation:material:32>, #iron
			<thermalfoundation:material:33>, #gold
			<thermalfoundation:material:320>, #copper
			<thermalfoundation:material:321>, #tin
			<thermalfoundation:material:322>, #silver
			<thermalfoundation:material:323>, #lead
			<thermalfoundation:material:324>, #aluminium
			<thermalfoundation:material:325>, #nickel
			<thermalfoundation:material:326>, #platinum
			<contenttweaker:osmium_plate>, #osmium
			<contenttweaker:ardite_plate>, #ardite
			<contenttweaker:cobalt_plate>, #cobalt
			<basemetals:adamantine_plate>,
			<basemetals:antimony_plate>,
			<basemetals:bismuth_plate>,
			<basemetals:coldiron_plate>,
			<basemetals:starsteel_plate>,
			<basemetals:zinc_plate>,
			<immersiveengineering:metal:35>, #uranium
			<contenttweaker:thorium_plate>, #thorium
			<contenttweaker:boron_plate>, #boron
			<contenttweaker:lithium_plate>, #lithium
			<contenttweaker:magnesium_plate>, #magnesium
			
			<thermalfoundation:material:355>, #bronze
			<thermalfoundation:material:353>, #electrum
			<thermalfoundation:material:354>, #invar
			<thermalfoundation:material:356>, #constantan
			<contenttweaker:alubrass_plate>, #aluminum brass
			<contenttweaker:manyullyn_plate>,
			<contenttweaker:knightslime_plate>,
			<contenttweaker:pigiron_plate>,
			<basemetals:aquarium_plate>,
			<basemetals:brass_plate>,
			<basemetals:cupronickel_plate>,
			<thermalfoundation:material:328>, #mithril
			<basemetals:pewter_plate>
		];
		
	#Gears
		static outputGears as IItemStack[] = [
			<thermalfoundation:material:24>, #iron
			<thermalfoundation:material:25>, #gold
			<thermalfoundation:material:256>, #copper
			<thermalfoundation:material:257>, #tin
			<thermalfoundation:material:258>, #silver
			<thermalfoundation:material:259>, #lead
			<thermalfoundation:material:260>, #aluminium
			<thermalfoundation:material:261>, #nickel
			<thermalfoundation:material:262>, #platinum
			<contenttweaker:osmium_gear>, #osmium
			<contenttweaker:ardite_gear>, #ardite
			<contenttweaker:cobalt_gear>, #cobalt
			<basemetals:adamantine_gear>,
			<basemetals:antimony_gear>,
			<basemetals:bismuth_gear>,
			<basemetals:coldiron_gear>,
			<basemetals:starsteel_gear>,
			<basemetals:zinc_gear>,
			<contenttweaker:uranium_gear>, #uranium
			<contenttweaker:thorium_gear>, #thorium
			<contenttweaker:boron_gear>, #boron
			<contenttweaker:lithium_gear>, #lithium
			<contenttweaker:magnesium_gear>, #magnesium
			
			<thermalfoundation:material:291>, #bronze
			<thermalfoundation:material:289>, #electrum
			<thermalfoundation:material:290>, #invar
			<thermalfoundation:material:292>, #constantan
			<contenttweaker:alubrass_gear>, #aluminum brass
			<contenttweaker:manyullyn_gear>,
			<contenttweaker:knightslime_gear>,
			<contenttweaker:pigiron_gear>,
			<basemetals:aquarium_gear>,
			<basemetals:brass_gear>,
			<basemetals:cupronickel_gear>,
			<thermalfoundation:material:264>, #mithril
			<basemetals:pewter_gear>
		];
		
	#Coins
	#Rods
	#Wires
	#Compressed
	
	#Liquids (molten)
	
	#Helmets
	#Chest Plates
	#Leggings
	#Boots
	
	#Thaumcraft Aspects

#Alloys
	#These arrays will have the following indexes:
		#0 -> Bronze (3 copper, 1 tin)
		#1 -> Electrum (1 gold, 1 silver)
		#2 -> Invar (2 iron, 1 nickel)
		#3 -> Constantan (1 copper, 1 nickel)
		#4 -> Aluminum brass (3 aluminium, 1 copper)
		#5 -> Manyullyn (1 ardite, 1 cobalt) -> 1 manyullyn)
		#6 -> Knightslime (1 iron ingot, 1 purple slime ball, 4 stone/cobble -> 1 knightslime ingot, 72/125/144->72mB )
		#7 -> Pigiron (2 iron ingots, 2 rotten flesh, 1 clay ball -> 2 pigiron ingots, 144/40/72->144mB)
		#8 -> Aquarium (2 copper, 1 zinc, 1 prismarine cryst) -> 3 aquarium, 2/1/4?->3)
			#todo handling for non-metal alloying
		#9 -> Brass (3 copper, 1 zinc)
		#10 -> Cupronickel (3 copper, 1 nickel)
		#11 -> Mithril (1 silver, 1 cold-iron, 1 liquid mercury -> 3 mithril)
		#12 -> Pewter (15 tin, 2 lead, 1 copper)
		#13 -> Constantan(2) (2 cupronickel, 1 nickel)
		#14 -> Cupronickel(2) (1 constantan, 1 copper)
		#15 -> Pewter(2) (22 tin, 3 lead, 2 bronze)
	
	#todo make some of these indexes dynamically depend on the strings in the metalNames array
	#OutputIndex (says at what index the output material is in the #All Metals lists)
		static alloyOutputIndexes as int[] = [
			23, #Bronze
			24, #Electrum
			25, #Invar
			26, #Constantan
			27, #Aluminum brass
			28, #Manyullyn
			29, #Knightslime
			30, #Pigiron
			31, #Aquarium
			32, #Brass
			33, #Cupronickel
			34, #Mithril
			35, #Pewter
			26, #Constantan
			33, #Cupronickel
			35 #Pewter
		];
	#OutputAmount (typically the sum of all input amounts, but not always)
		static alloyOutputAmounts as int[] = [
			4, #Bronze
			2, #Electrum
			3, #Invar
			2, #Constantan
			4, #Aluminum brass
			1, #Manyullyn
			1, #Knightslime
			2, #Pigiron
			3, #Aquarium
			4, #Brass
			4, #Cupronickel
			3, #Mithril
			18, #Pewter
			3, #Constantan
			2, #Cupronickel
			27 #Pewter
		];
	#OutputLiquidAmount (typically the sum of all input amounts, but not always)
		static alloyOutputLiqAmounts as int[] = [
			4, #Bronze
			2, #Electrum
			3, #Invar
			2, #Constantan
			4, #Aluminum brass
			1, #Manyullyn
			72, #Knightslime
			144, #Pigiron
			3, #Aquarium
			4, #Brass
			4, #Cupronickel
			3, #Mithril
			18, #Pewter
			3, #Constantan
			2, #Cupronickel
			27 #Pewter
		];
		
	#Input1Index
		static alloyInput1Indexes as int[] = [
			2, #Bronze (Copper)
			1, #Electrum (Gold)
			0, #Invar (Iron)
			2, #Constantan (Copper)
			6, #Aluminum brass (Aluminium)
			10, #Manyullyn (Ardite)
			0, #Knightslime (Iron)
			0, #Pigiron (Iron)
			2, #Aquarium (Copper)
			2, #Brass (Copper)
			2, #Cupronickel (Copper)
			4, #Mithril (Silver)
			3, #Pewter (Tin)
			33, #Constantan (Cupronickel)
			26, #Cupronickel (Constantan)
			3 #Pewter (Tin)
		];
	#Input1Amount
		static alloyInput1Amounts as int[] = [
			3, #Bronze
			1, #Electrum
			2, #Invar
			1, #Constantan
			3, #Aluminum brass
			1, #Manyullyn
			1, #Knightslime
			2, #Pigiron
			2, #Aquarium
			3, #Brass
			3, #Cupronickel
			1, #Mithril
			15, #Pewter
			2, #Constantan
			1, #Cupronickel
			22 #Pewter
		];
	#Input1LiquidAmount
		static alloyInput1LiqAmounts as int[] = [
			3, #Bronze
			1, #Electrum
			2, #Invar
			1, #Constantan
			3, #Aluminum brass
			1, #Manyullyn
			72, #Knightslime
			144, #Pigiron
			2, #Aquarium
			3, #Brass
			3, #Cupronickel
			1, #Mithril
			15, #Pewter
			2, #Constantan
			1, #Cupronickel
			22 #Pewter
		];
		
	#Input2Index
		static alloyInput2Indexes as int[] = [
			3, #Bronze (Tin)
			4, #Electrum (Silver)
			7, #Invar (Nickel)
			7, #Constantan (Nickel)
			2, #Aluminum brass (Copper)
			11, #Manyullyn (Cobalt)
			36, #Knightslime (Purple Slime)
			38, #Pigiron (Rotten Flesh)
			17, #Aquarium (Zinc)
			17, #Brass (Zinc)
			7, #Cupronickel (Nickel)
			15, #Mithril (Cold-Iron)
			5, #Pewter (Lead)
			7, #Constantan (Nickel)
			2, #Cupronickel (Copper)
			5 #Pewter (Lead)
		];
	#Input2Amount
		static alloyInput2Amounts as int[] = [
			1, #Bronze
			1, #Electrum
			1, #Invar
			1, #Constantan
			1, #Aluminum brass
			1, #Manyullyn
			1, #Knightslime
			2, #Pigiron
			1, #Aquarium
			1, #Brass
			1, #Cupronickel
			1, #Mithril
			2, #Pewter
			1, #Constantan
			1, #Cupronickel
			3 #Pewter
		];
	#Input2LiquidAmount
		static alloyInput2LiqAmounts as int[] = [
			1, #Bronze
			1, #Electrum
			1, #Invar
			1, #Constantan
			1, #Aluminum brass
			1, #Manyullyn
			125, #Knightslime
			40, #Pigiron
			1, #Aquarium
			1, #Brass
			1, #Cupronickel
			1, #Mithril
			2, #Pewter
			1, #Constantan
			1, #Cupronickel
			3 #Pewter
		];
		
	#Input3Bool (whether or not this alloy has a third input)
		static alloyInput3Bools as bool[] = [
			false, #Bronze
			false, #Electrum
			false, #Invar
			false, #Constantan
			false, #Aluminum brass
			false, #Manyullyn
			true, #Knightslime
			true, #Pigiron
			true, #Aquarium
			false, #Brass
			false, #Cupronickel
			true, #Mithril
			true, #Pewter
			false, #Constantan
			false, #Cupronickel
			true #Pewter
		];
	#Input3Index (only used if Input3Bool[i])
		static alloyInput3Indexes as int[] = [
			0, #Bronze
			0, #Electrum
			0, #Invar
			0, #Constantan
			0, #Aluminum brass
			0, #Manyullyn
			37, #Knightslime (Seared Stone)
			39, #Pigiron (Clay)
			40, #Aquarium (Prismarine)
			0, #Brass
			0, #Cupronickel
			41, #Mithril (Mercury)
			2, #Pewter (Copper)
			0, #Constantan
			0, #Cupronickel
			23 #Pewter (Bronze)
		];
	#Input3Amount (only used if Input3Bool[i])
		static alloyInput3Amounts as int[] = [
			0, #Bronze
			0, #Electrum
			0, #Invar
			0, #Constantan
			0, #Aluminum brass
			0, #Manyullyn
			4, #Knightslime
			1, #Pigiron
			1, #Aquarium
			0, #Brass
			0, #Cupronickel
			1, #Mithril
			1, #Pewter
			0, #Constantan
			0, #Cupronickel
			2 #Pewter
		];
	#Input3LiquidAmount (only used if Input3Bool[i])
		static alloyInput3LiqAmounts as int[] = [
			0, #Bronze
			0, #Electrum
			0, #Invar
			0, #Constantan
			0, #Aluminum brass
			0, #Manyullyn
			144, #Knightslime
			72, #Pigiron
			4, #Aquarium
			0, #Brass
			0, #Cupronickel
			1, #Mithril
			1, #Pewter
			0, #Constantan
			0, #Cupronickel
			2 #Pewter
		];

#Parts
	#Names
		static partNames as string[] = [ 
			"ore",
			"nugget",
			"ingot",
			"block",
			"dustTiny",
			"dust",
			"crystal",
			"shard",
			"clump",
			"dustDirty",
			"crushed",
			"crushedPurified",
			"cluster",
			"gear",
			"plate",
			"coin",
			"compressed", #galacticraft 2 ingots -> 1 compressed
			"stick", #IE
			"wire" #IE
		];
	
	#Thaumcraft Aspects

#Etc
	#Various Dust variants
		#For crusher removal
		static otherDusts as IItemStack[] = [
			<ic2:dust:2>, #coal
			<ic2:dust:9>, #lapis
			<ic2:dust:12>, #obsidian
			<ic2:dust:16>, #sulfur
			<immersiveengineering:material:24>, #nitrate (saltpeter)
			<immersiveengineering:material:25>, #sulfur
			<immersiveengineering:metal:17> #steel
		];
		#For Hammering adding
		static crushInputIngots as IOreDictEntry[] = [
			<ore:ingotSteel>, #steel
			<ore:ingotSignalum>, #signalum
			<ore:ingotLumium>, #lumium
			<ore:ingotEnderium> #enderium
		];
		static crushOutputDusts as IItemStack[] = [
			<thermalfoundation:material:96>, #steel
			<thermalfoundation:material:101>, #signalum
			<thermalfoundation:material:102>, #lumium
			<thermalfoundation:material:103> #enderium
		];
