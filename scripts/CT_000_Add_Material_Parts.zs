#priority 1000
#loader contenttweaker

#Imports
	import crafttweaker.item.IItemStack;
	import mods.contenttweaker.DropTableBuilder;
	import mods.contenttweaker.MaterialSystem;
	import mods.contenttweaker.PartBuilder;
	import mods.contenttweaker.VanillaFactory;
	
#Materials
	#Ores
		var oreMaterialNames = [ 
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
			"Magnesium"
		] as string[];
		
	#Alloys
		var alloyMaterialNames = [
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
			#todo add enderio alloys
		] as string[];
		
	#NuclearCraft
		var nuggetMaterialNames = [
			"Thorium",
			"Boron",
			"Lithium",
			"Magnesium"
		] as string[];
		
	#Tinkers'
		var dustMaterialNames = [
			"Alubrass",
			"Manyullyn",
			"Knightslime",
			"Pigiron"
			#todo add enderio alloys
		] as string[];
		
	#Dense Ores
		var denseOreMaterialNames = [ 
			"Iron",
			"Gold",
			"Copper",
			"Tin",
			"Silver",
			"Lead",
			"Aluminium",
			"Nickel",
			"Platinum",
			"Iridium",
			"Mithril",
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
			"Magnesium"
		] as string[];
		
		var oreItemNames = [
			"minecraft:iron_ore",
			"minecraft:gold_ore",
			"thermalfoundation:ore", #copper
			"thermalfoundation:ore:1", #tin
			"thermalfoundation:ore:2", #silver
			"thermalfoundation:ore:3", #lead
			"thermalfoundation:ore:4", #aluminium
			"thermalfoundation:ore:5", #nickel
			"thermalfoundation:ore:6", #platinum
			"thermalfoundation:ore:7", #iridium
			"thermalfoundation:ore:8", #mithril
			"mekanism:oreblock:0", #osmium
			"tconstruct:ore:1", #ardite
			"tconstruct:ore:0", #cobalt
			"basemetals:adamantine_ore", #adamantine
			"basemetals:antimony_ore", #antimony
			"basemetals:bismuth_ore", #bismuth
			"basemetals:coldiron_ore", #cold-iron
			"basemetals:starsteel_ore", #star-steel
			"basemetals:zinc_ore", #zinc
			"ic2:resource:4", #uranium
			"nuclearcraft:ore:3", #thorium
			"nuclearcraft:ore:5", #boron
			"nuclearcraft:ore:6", #lithium
			"nuclearcraft:ore:7" #magnesium
		] as string[];
		
#Parts
	#Ores
		var orePartNames = [
			"crystal",
			"shard",
			"clump",
			"dirty_dust",
			"crushed_ore",
			"purified_ore",
			"cluster",
			"tiny_dust",
			"gear",
			"plate",
			"coin",
			"compressed", #galacticraft 2 ingots -> 1 compressed
			"rod", #IE Stick
			"wire", #IE
			"armor"
		] as string[];
		
	#Alloys
		var alloyPartNames = [
			"tiny_dust",
			"gear",
			"plate",
			"coin",
			"compressed", #galacticraft 2 ingots -> 1 compressed
			"rod", #IE Stick
			"wire", #IE
			"armor"
		] as string[];
		
#Colours
	#Ore Metals
		var oreMetalColours = [
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
			16242431 #Magnesium
		] as int[];
		
	#Alloy Metals
		var alloyMetalColours = [
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
		] as int[];
		
	#NuclearCraft
		var ncColours = [
			2894892, #Thorium
			10526880, #Boron
			15856113, #Lithium
			16242431 #Magnesium
		] as int[];
		
	#Tinkers'
		var ticColours = [
			15717479, #Aluminum Brass
			11107808, #Manyullyn
			14386417, #Knightslime
			15771812 #Pigiron
		] as int[];
		
	#Dense Ores
		var oreColours = [
			12566463, #Iron #todo change
			16777039, #Gold
			16757789, #Copper
			13558755, #Tin
			15397362, #Silver
			8490943, #Lead
			15395572, #Aluminium
			15790296, #Nickel
			9568255, #Platinum
			16777215, #Iridium
			6395571, #Mithril #todo change
			12767960, #Osmium
			15686952, #Ardite
			2324189, #Cobalt
			4862776, #Adamantine
			14212314, #Antimony #todo change
			14342355, #Bismuth #todo change
			12699881, #Cold-Iron #todo change
			262144, #Star-Steel #todo change
			11908533, #Zinc #todo change
			8031340, #Uranium #todo change
			2894892, #Thorium #todo change
			10526880, #Boron #todo change
			15856113, #Lithium #todo change
			16242431 #Magnesium #todo change
		] as int[];
	

#Creating missing parts
	var pBuilder = MaterialSystem.getPartBuilder(); #note: this should actually be done for every new part
	pBuilder.setHasOverlay(false);
	pBuilder.setPartType(MaterialSystem.getPartType("item"));
	#Tiny Dust
		pBuilder.setName("tiny_dust");
		pBuilder.setOreDictName("dustTiny");
		pBuilder.build();
	#Purified Ore (IC2)
		pBuilder.setName("purified_ore");
		pBuilder.setOreDictName("crushedPurified");
		pBuilder.build();
	#Coin (Thermal foundation)
		pBuilder.setName("coin");
		pBuilder.setOreDictName("coin");
		pBuilder.build();
	#Compressed (Galacticraft)
		pBuilder.setName("compressed");
		pBuilder.setOreDictName("compressed");
		pBuilder.build();
	#Wire (IE)
		pBuilder.setName("wire");
		pBuilder.setOreDictName("wire");
		pBuilder.build();

	#Liquid (osmium)
		var liquidOsmium = VanillaFactory.createFluid("osmium", 12767960);
		liquidOsmium.register();
		
	#For Alloys
		#Small Purple slime
			var newItem = VanillaFactory.createItem("purple_slime_tiny_ball");
			newItem.register();
		#Small Cobble
			newItem = VanillaFactory.createItem("stone_tiny_dust");
			newItem.register();
		#Small Rotten flesh
			newItem = VanillaFactory.createItem("rotten_flesh_nugget");
			newItem.register();
		#Small Clay
			newItem = VanillaFactory.createItem("clay_tiny_ball");
			newItem.register();
		#Small prismarine
			newItem = VanillaFactory.createItem("prismarine_nugget");
			newItem.register();
		#Large Clay
			newItem = VanillaFactory.createItem("compressed_clay");
			newItem.register();
		#Large Mercury
			newItem = VanillaFactory.createItem("compressed_mercury");
			newItem.register();
	
		
#Registering Material-Parts
	#Ores
		for i, materialName in oreMaterialNames {
			#todo optionally set oredict name differently from material name?
			var material = MaterialSystem.getMaterialBuilder().setName(materialName).setColor(oreMetalColours[i]).build();
			material.registerParts(orePartNames);
		}
	#Alloys
		for i, materialName in alloyMaterialNames {
			var material = MaterialSystem.getMaterialBuilder().setName(materialName).setColor(alloyMetalColours[i]).build();
			material.registerParts(alloyPartNames);
		}
	#NuclearCraft
		for i, materialName in nuggetMaterialNames {
			var material = MaterialSystem.getMaterialBuilder().setName(materialName).setColor(ncColours[i]).build();
			material.registerPart("nugget");
		}
	#Tinkers'
		for i, materialName in dustMaterialNames {
			var material = MaterialSystem.getMaterialBuilder().setName(materialName).setColor(ticColours[i]).build();
			material.registerPart("dust");
		}
	#Dense Ores
		for i, denseOreName in denseOreMaterialNames {
			var material = MaterialSystem.getMaterialBuilder().setName(denseOreName).setColor(oreColours[i]).build();
			
			var denseOreData = material.registerPart("dense_ore").getData();
			print("Adding drops to Dense " + denseOreName + " Ore:");
			print("drop name = " + oreItemNames[i]);
			var dropTable = DropTableBuilder
				.newSlot()
				.addItem(oreItemNames[i], 13, 2)
				.addItem(oreItemNames[i], 2, 3)
				.addItem(oreItemNames[i], 1, 4)
				.enableFortune();
			
			denseOreData.addDataValue("drops", dropTable);
		}
