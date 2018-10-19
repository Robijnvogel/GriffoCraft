#priority 998

#Imports
	import mods.mekatweaker.Gas;
	import mods.mekatweaker.GasFactory;
	import mod.mekanism.gas.IGasStack;
	
	import scripts.CT_001_Lists.metalColours;
	import scripts.CT_001_Lists.metalNamesLower;
	import scripts.CT_001_Lists.moltenMetals;
	
#Gas creation
	for i, metalName in metalNamesLower {
		var gas = GasFactory.createFromFluid(moltenMetals[i]);
		gas.register();
		
		gas = GasFactory.createGas("clean" + metalName);
		gas.setIcon("blocks/water");
		gas.setIconFlowing("blocks/water_flowing");
		gas.setColor(metalColours[i]);
		gas.register();
	}
