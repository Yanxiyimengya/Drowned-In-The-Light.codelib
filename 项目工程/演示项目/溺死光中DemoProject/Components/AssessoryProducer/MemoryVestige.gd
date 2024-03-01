extends BaseAccessory;
class_name MemoryVestige;

var master: BaseCharacter;
var add_attributes: CharacterAttributes;

func on_worn(master_dest = master):
    master_dest.bonus_attributes += add_attributes;

func out_worn(master_dest = master):
    master_dest.bonus_attributes -= add_attributes;