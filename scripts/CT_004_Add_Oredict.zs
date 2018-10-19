#priority 996
#modloaded basemetals enderio ic2 galacticraftplanets mekanism nuclearcraft tconstruct thermalfoundation

/*
This scripts adds some items to oredictionaries:
	-some that are not added yet by their own mod at the point of loading this script
	-some new ones
	-Aluminum <> Aluminium
*/

#Imports
	import scripts.CT_001_Lists.metalNames;
	import scripts.CT_001_Lists.partNames;

#EnderIO and TC
	var dustCopper = oreDict.dustCopper;
	dustCopper.add(<enderio:item_material:26>);

	var dustTin = oreDict.dustTin;
	dustTin.add(<enderio:item_material:27>);
	
	var plateBrass = oreDict.plateBrass;
	plateBrass.add(<thaumcraft:plate:0>);

#GC
	var ingotLead = oreDict.ingotLead;
	ingotLead.add(<galacticraftplanets:basic_item_venus:1>);

#merging ambiguous oredicts
	for metalName in metalNames {
		#tiny dust
			var dustTiny = oreDict.get("dustTiny" + metalName);
			dustTiny.addAll(oreDict.get("dustSmall" + metalName));
			dustTiny.addAll(oreDict.get("tinyDust" + metalName));
			dustTiny.addAll(oreDict.get("smallDust" + metalName));
		
		#crushed
			var crushedOre = oreDict.get("crushed" + metalName);
			crushedOre.addAll(oreDict.get("crushedOre" + metalName));
			
		#purified
			var purifiedOre = oreDict.get("crushedPurified" + metalName);
			purifiedOre.addAll(oreDict.get("purified" + metalName));
			purifiedOre.addAll(oreDict.get("purifiedOre" + metalName));
			
		#dirty dust
			var dirtyDust = oreDict.get("dustDirty" + metalName);
			dirtyDust.addAll(oreDict.get("dirtyDust" + metalName));
	}
	
#<part>Aluminum into <part>Aluminium
	for partName in partNames {
		var aluminiumPart = oreDict.get(partName + "Aluminium");
		aluminiumPart.addAll(oreDict.get(partName + "Aluminum"));
	}
	
#anyX		
	for metalName in metalNames {
		#only use these dictionaries for alloying recipes
		var anyDusts = oreDict.get("anyDust" + metalName);
		anyDusts.addAll(oreDict.get("dust" + metalName));
		anyDusts.addAll(oreDict.get("crushed" + metalName));
		anyDusts.addAll(oreDict.get("crushedPurified" + metalName));
		#anyDusts.addAll(oreDict.get("dustDirty" + metalName)); #not this one
		
		var anySmalls = oreDict.get("anySmall" + metalName);
		anySmalls.addAll(oreDict.get("dustTiny" + metalName));
		anySmalls.addAll(oreDict.get("nugget" + metalName));
		
		var anyBases = oreDict.get("anyBase" + metalName);
		anyBases.addAll(anyDusts);
		anyBases.addAll(oreDict.get("ingot" + metalName));
	}
	
#Blood
	var anySmallBlood = oreDict.get("anySmallBlood");
		anySmallBlood.add(<contenttweaker:rotten_flesh_nugget>);
		anySmallBlood.addAll(<ore:nuggetMeat>);
	var anyBaseBlood = oreDict.get("anyBaseBlood");
		anyBaseBlood.add(<minecraft:rotten_flesh>);
		anyBaseBlood.add(<minecraft:beef>);
		anyBaseBlood.add(<minecraft:porkchop>);
		anyBaseBlood.add(<minecraft:chicken>);
		anyBaseBlood.add(<minecraft:rabbit>);
		anyBaseBlood.add(<minecraft:mutton>);
	var anyBlockBlood = oreDict.get("anyBlockBlood");
		anyBlockBlood.add(<thaumcraft:flesh_block>);
		#todo other meat blocks?