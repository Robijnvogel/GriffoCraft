
import loottweaker.vanilla.loot.LootTables;  
import loottweaker.vanilla.loot.LootTable;  
import loottweaker.vanilla.loot.LootPool;

var chestNames = [
	"minecraft:chests/abandoned_mineshaft",
	"minecraft:chests/desert_pyramid",
	"minecraft:chests/end_city_treasure",
	"minecraft:chests/igloo_chest",
	"minecraft:chests/jungle_temple",
	"minecraft:chests/nether_bridge",
	"minecraft:chests/simple_dungeon",
	"minecraft:chests/stronghold_corridor",
	"minecraft:chests/stronghold_crossing",
	"minecraft:chests/stronghold_library",
	"minecraft:chests/village_blacksmith"
] as string[];

for chestName in chestNames {
	var chest = LootTables.getTable(chestName);
	var ic2Pool = chest.getPool("ic2");
	var ic2RepPool = chest.addPool("ic2rep", 0, 4, 0, 1);
	
	/*for lootEntry in ic2Pool.itemArray{
		if (lootEntry.name == "copper_ingot" || lootEntry.name == "tin_ingot") {
		} else {
			ic2RepPool.add(lootEntry);
		}
	}
	chest.removePool("ic2");*/
	
	ic2Pool.removeEntry("copper_ingot");
	ic2Pool.removeEntry("tin_ingot");
	
	var tfPool = chest.addPool("tf", 0, 4, 0, 1);
	tfPool.addItemEntryJson(<thermalfoundation:material:128>, 9, 0, #copper
		[
			{
				"count": {
					"min": 2.0,
					"max": 6.0
				},
				"function": "minecraft:set_count"
			}
		],
		[],
		"copper_ingot_tf"
	);
	tfPool.addItemEntryJson(<thermalfoundation:material:129>, 8, 0, #tin
		[
			{
				"count": {
					"min": 1.0,
					"max": 5.0
				},
				"function": "minecraft:set_count"
			}
		],
		[],
		"tin_ingot_tf"
	);
	tfPool.addItemEntryJson(<thermalfoundation:material:130>, 3, 0, #silver
		[
			{
				"count": {
					"min": 1.0,
					"max": 3.0
				},
				"function": "minecraft:set_count"
			}
		],
		[],
		"silver_ingot_tf"
	);
	tfPool.addItemEntryJson(<thermalfoundation:material:131>, 5, 0, #lead
		[
			{
				"count": {
					"min": 1.0,
					"max": 4.0
				},
				"function": "minecraft:set_count"
			}
		],
		[],
		"lead_ingot_tf"
	);
	tfPool.addItemEntryJson(<thermalfoundation:material:132>, 6, 0, #aluminium
		[
			{
				"count": {
					"min": 1.0,
					"max": 5.0
				},
				"function": "minecraft:set_count"
			}
		],
		[],
		"aluminium_ingot_tf"
	);
	tfPool.addItemEntryJson(<thermalfoundation:material:133>, 2, 0, #nickel
		[
			{
				"count": {
					"min": 1.0,
					"max": 4.0
				},
				"function": "minecraft:set_count"
			}
		],
		[],
		"nickel_ingot_tf"
	);
	tfPool.addItemEntryJson(<thermalfoundation:material:134>, 1, 0, #platinum
		[
			{
				"count": {
					"min": 0.0,
					"max": 1.0
				},
				"function": "minecraft:set_count"
			}
		],
		[],
		"platinum_ingot_tf"
	);
}

var b_chest = LootTables.getTable("minecraft:chests/village_blacksmith");
var b_ic2Pool = b_chest.getPool("ic2");
b_ic2Pool.removeEntry("bronze_ingot");

var b_tfPool = b_chest.addPool("tf2", 0, 4, 0, 1);
b_tfPool.addItemEntryJson(<thermalfoundation:material:134>, 1, 0, #platinum
	[
		{
			"count": {
				"min": 0.0,
				"max": 1.0
			},
			"function": "minecraft:set_count"
		}
	],
	[],
	"platinum_ingot_tf"
);
b_tfPool.addItemEntryJson(<thermalfoundation:material:160>, 5, 0, #steel
	[
		{
			"count": {
				"min": 1.0,
				"max": 3.0
			},
			"function": "minecraft:set_count"
		}
	],
	[],
	"steel_ingot_tf"
);
b_tfPool.addItemEntryJson(<thermalfoundation:material:161>, 4, 0, #electrum
	[
		{
			"count": {
				"min": 1.0,
				"max": 3.0
			},
			"function": "minecraft:set_count"
		}
	],
	[],
	"electrum_ingot_tf"
);
b_tfPool.addItemEntryJson(<thermalfoundation:material:162>, 4, 0, #invar
	[
		{
			"count": {
				"min": 1.0,
				"max": 3.0
			},
			"function": "minecraft:set_count"
		}
	],
	[],
	"invar_ingot_tf"
);
b_tfPool.addItemEntryJson(<thermalfoundation:material:163>, 6, 0, #bronze
	[
		{
			"count": {
				"min": 2.0,
				"max": 4.0
			},
			"function": "minecraft:set_count"
		}
	],
	[],
	"bronze_ingot_tf"
);
b_tfPool.addItemEntryJson(<thermalfoundation:material:164>, 4, 0, #constantan
	[
		{
			"count": {
				"min": 2.0,
				"max": 4.0
			},
			"function": "minecraft:set_count"
		}
	],
	[],
	"constantan_ingot_tf"
);
b_tfPool.addItemEntryJson(<thermalfoundation:material:165>, 2, 0, #signalum
	[
		{
			"count": {
				"min": 1.0,
				"max": 2.0
			},
			"function": "minecraft:set_count"
		}
	],
	[],
	"signalum_ingot_tf"
);
b_tfPool.addItemEntryJson(<thermalfoundation:material:166>, 2, 0, #lumium
	[
		{
			"count": {
				"min": 1.0,
				"max": 2.0
			},
			"function": "minecraft:set_count"
		}
	],
	[],
	"lumium_ingot_tf"
);
b_tfPool.addItemEntryJson(<thermalfoundation:material:167>, 1, 0, #enderium
	[
		{
			"count": {
				"min": 0.0,
				"max": 1.0
			},
			"function": "minecraft:set_count"
		}
	],
	[],
	"enderium_ingot_tf"
);
