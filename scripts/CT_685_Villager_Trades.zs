#priority 315

#Imports
	import mods.rockycore.Merchant;
	
	import scripts.CT_001_Lists.outputIngots;
	import scripts.CT_001_Lists.ingotTradeCosts;
	import scripts.CT_001_Lists.ingotTradeLevels;

#Villager Trade Creation
	Merchant.addTrade("minecraft:smith", "armor", <minecraft:emerald>, <minecraft:iron_ingot>, 1);
	for i, ingotTradeCost in ingotTradeCosts {
		#buy ingots
		Merchant.addTrade("minecraft:smith", "armor", <minecraft:emerald> * ingotTradeCost, outputIngots[i], ingotTradeLevels[i]);
		Merchant.addTrade("minecraft:smith", "weapon", <minecraft:emerald> * ingotTradeCost, outputIngots[i], ingotTradeLevels[i]);
		Merchant.addTrade("minecraft:smith", "tool", <minecraft:emerald> * ingotTradeCost, outputIngots[i], ingotTradeLevels[i]);
		
		#sell ingots
		Merchant.addTrade("minecraft:smith", "armor", outputIngots[i] * 7, <minecraft:emerald> * ingotTradeCost, ingotTradeLevels[i]);
		Merchant.addTrade("minecraft:smith", "weapon", outputIngots[i] * 7, <minecraft:emerald> * ingotTradeCost, ingotTradeLevels[i]);
		Merchant.addTrade("minecraft:smith", "tool", outputIngots[i] * 7, <minecraft:emerald> * ingotTradeCost, ingotTradeLevels[i]);
	}
