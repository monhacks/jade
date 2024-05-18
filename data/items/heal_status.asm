; See also data/battle/held_heal_status.asm

StatusHealingActions:
	;  item,         party menu action text, status
	dwbb ANTIDOTE,     PARTYMENUTEXT_HEAL_PSN, 1 << PSN
	dwbb BURN_HEAL,    PARTYMENUTEXT_HEAL_BRN, 1 << BRN
	dwbb ICE_HEAL,     PARTYMENUTEXT_HEAL_FRZ, 1 << FRZ
	dwbb AWAKENING,    PARTYMENUTEXT_HEAL_SLP, SLP_MASK
	dwbb PARLYZ_HEAL,  PARTYMENUTEXT_HEAL_PAR, 1 << PAR
	dwbb FULL_HEAL,    PARTYMENUTEXT_HEAL_ALL, %11111111
	dwbb FULL_RESTORE, PARTYMENUTEXT_HEAL_ALL, %11111111
	dwbb HEAL_POWDER,  PARTYMENUTEXT_HEAL_ALL, %11111111
	dwbb PECHA_BERRY,  PARTYMENUTEXT_HEAL_PSN, 1 << PSN
	dwbb CHERI_BERRY,  PARTYMENUTEXT_HEAL_PAR, 1 << PAR
	dwbb ASPEAR_BERRY, PARTYMENUTEXT_HEAL_FRZ, 1 << FRZ
	dwbb RAWST_BERRY,  PARTYMENUTEXT_HEAL_BRN, 1 << BRN
	dwbb CHESTO_BERRY, PARTYMENUTEXT_HEAL_SLP, SLP_MASK
	dwbb LUM_BERRY,    PARTYMENUTEXT_HEAL_ALL, %11111111
	dwbb NO_ITEM, 0, 0 ; end
