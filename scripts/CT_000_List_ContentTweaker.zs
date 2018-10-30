#priority 1000
#loader contenttweaker

#Materials
	#Ores
		static oreMaterialNames as string[] = [ 
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
		];
		
	#Alloys
		static alloyMaterialNames as string[] = [
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
		];
		
	#NuclearCraft
		static nuggetMaterialNames as string[] = [
			"Thorium",
			"Boron",
			"Lithium",
			"Magnesium"
		];
		
	#Tinkers'
		static dustMaterialNames as string[] = [
			"Alubrass",
			"Manyullyn",
			"Knightslime",
			"Pigiron"
			#todo add enderio alloys
		];
		
	#Dense Ores
		static denseOreMaterialNames as string[] = [ 
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
		];
		
		static oreItemNames as string[] = [
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
		static orePartNames as string[] = [
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
		static alloyPartNames as string[] = [
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
		static oreMetalColours as int[] = [
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
		];
		
	#Alloy Metals
		static alloyMetalColours as int[] = [
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
		
	#NuclearCraft
		static ncColours as int[] = [
			2894892, #Thorium
			10526880, #Boron
			15856113, #Lithium
			16242431 #Magnesium
		];
		
	#Tinkers'
		static ticColours as int[] = [
			15717479, #Aluminum Brass
			11107808, #Manyullyn
			14386417, #Knightslime
			15771812 #Pigiron
		];
		
	#Dense Ores
		static oreColours as int[] = [
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
		];
