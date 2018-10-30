#priority 997

#Imports
	import mods.mekatweaker.Gas;
	import mods.mekatweaker.GasFactory;
	import mod.mekanism.gas.IGasStack;
	
	import scripts.CT_002_Lists as L;
	
#Gas creation
	for i, metalName in L.metalNamesLower {
		var gas = GasFactory.createFromFluid(L.moltenMetals[i]);
		gas.register();
		
		gas = GasFactory.createGas("clean" + metalName);
		gas.setIcon("blocks/water");
		gas.setIconFlowing("blocks/water_flowing");
		gas.setColor(L.metalColours[i]);
		gas.register();
	}
