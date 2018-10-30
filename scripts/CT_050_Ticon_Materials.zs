#priority 950

#Imports
	import mods.contenttweaker.tconstruct.Material;
	import mods.contenttweaker.tconstruct.MaterialBuilder;
	
#Materials
	var osmiumMaterialB = MaterialBuilder.create("osmium");
	osmiumMaterialB.color = 12767960;
	osmiumMaterialB.liquid = <liquid:osmium>;
	osmiumMaterialB.craftable = false;
	osmiumMaterialB.castable = true;
	osmiumMaterialB.representativeItem = <mekanism:ingot:1>;
	osmiumMaterialB.representativeOre = <ore:oreOsmium>;
	osmiumMaterialB.localizedName = "Osmium";
	
	osmiumMaterialB.addItem(<ore:blockOsmium>, 1, 1296);
	osmiumMaterialB.addItem(<ore:ingotOsmium>);
	osmiumMaterialB.addItem(<ore:nuggetOsmium>, 1, 16);
	
	osmiumMaterialB.addHeadMaterialStats(684, 6.84, 6.84, 3);
	osmiumMaterialB.addExtraMaterialStats(228);
	osmiumMaterialB.addHandleMaterialStats(1.7, 342);
	
	#osmiumMaterial.addBowMaterialStats(float drawSpeed, float range, float bonusDamage);
	#osmiumMaterial.addBowStringMaterialStats(float modifier);
	#osmiumMaterial.addProjectileMaterialStats();
	#osmiumMaterial.addArrowShaftMaterialStats(float modifier, int bonusAmmo);
	#osmiumMaterial.addFletchingMaterialStats(float accuracy, float modifier);
	
	var osmiumMaterial = osmiumMaterialB.register();
	
	osmiumMaterial.addTrait("cactus", "head");
	osmiumMaterial.addTrait("cactus", "extra");
	osmiumMaterial.addTrait("cactus", "handle");
	osmiumMaterial.addTrait("cactus", "bow");
	osmiumMaterial.addTrait("cactus", "bowstring");
	osmiumMaterial.addTrait("cactus", "projectile");
	osmiumMaterial.addTrait("cactus", "shaft");
	osmiumMaterial.addTrait("cactus", "fletching");
	osmiumMaterial.addTrait("cactus");
	
