#priority 999
#loader contenttweaker

#Imports
	import crafttweaker.item.IItemStack;
	import mods.contenttweaker.DropTableBuilder;
	import mods.contenttweaker.MaterialSystem;
	import mods.contenttweaker.VanillaFactory;
	
	import scripts.CT_000_List_ContentTweaker as L;
	
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
		for i, materialName in L.oreMaterialNames {
			#todo optionally set oredict name differently from material name?
			var material = MaterialSystem.getMaterialBuilder().setName(materialName).setColor(L.oreMetalColours[i]).build();
			material.registerParts(L.orePartNames);
		}
	#Alloys
		for i, materialName in L.alloyMaterialNames {
			var material = MaterialSystem.getMaterialBuilder().setName(materialName).setColor(L.alloyMetalColours[i]).build();
			material.registerParts(L.alloyPartNames);
		}
	#NuclearCraft
		for i, materialName in L.nuggetMaterialNames {
			var material = MaterialSystem.getMaterialBuilder().setName(materialName).setColor(L.ncColours[i]).build();
			material.registerPart("nugget");
		}
	#Tinkers'
		for i, materialName in L.dustMaterialNames {
			var material = MaterialSystem.getMaterialBuilder().setName(materialName).setColor(L.ticColours[i]).build();
			material.registerPart("dust");
		}
	#Dense Ores
		for i, denseOreName in L.denseOreMaterialNames {
			var material = MaterialSystem.getMaterialBuilder().setName(denseOreName).setColor(L.oreColours[i]).build();
			
			var denseOreData = material.registerPart("dense_ore").getData();
			print("Adding drops to Dense " + denseOreName + " Ore:");
			print("drop name = " + L.oreItemNames[i]);
			var dropTable = DropTableBuilder
				.newSlot()
				.addItem(L.oreItemNames[i], 13, 2)
				.addItem(L.oreItemNames[i], 2, 3)
				.addItem(L.oreItemNames[i], 1, 4)
				.enableFortune();
			
			denseOreData.addDataValue("drops", dropTable);
		}
