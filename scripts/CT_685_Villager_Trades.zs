#priority 315

#Imports
	import mods.rockycore.Merchant;
	
	import scripts.CT_002_Lists as L;

#Villager Trade Creation
	Merchant.addTrade("minecraft:smith", "armor", <minecraft:emerald>, <minecraft:iron_ingot>, 1);
	for i, ingotTradeCost in L.ingotTradeCosts {
		#buy ingots
		Merchant.addTrade("minecraft:smith", "armor", <minecraft:emerald> * ingotTradeCost, L.outputIngots[i], L.ingotTradeLevels[i]);
		Merchant.addTrade("minecraft:smith", "weapon", <minecraft:emerald> * ingotTradeCost, L.outputIngots[i], L.ingotTradeLevels[i]);
		Merchant.addTrade("minecraft:smith", "tool", <minecraft:emerald> * ingotTradeCost, L.outputIngots[i], L.ingotTradeLevels[i]);
		
		#sell ingots
		Merchant.addTrade("minecraft:smith", "armor", L.outputIngots[i] * 7, <minecraft:emerald> * ingotTradeCost, L.ingotTradeLevels[i]);
		Merchant.addTrade("minecraft:smith", "weapon", L.outputIngots[i] * 7, <minecraft:emerald> * ingotTradeCost, L.ingotTradeLevels[i]);
		Merchant.addTrade("minecraft:smith", "tool", L.outputIngots[i] * 7, <minecraft:emerald> * ingotTradeCost, L.ingotTradeLevels[i]);
	}
