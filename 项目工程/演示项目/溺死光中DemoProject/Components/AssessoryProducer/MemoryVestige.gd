extends BaseAccessory;
class_name MemoryVestige;

var master: BaseCharacter = null;
var base_add_attributes: CharacterAttributes = CharacterAttributes.new();
var bonus_add_attributes: CharacterAttributes = CharacterAttributes.new();

func on_worn(master_dest: BaseCharacter):
    master = master_dest;
    master_dest.base_attributes.add(base_add_attributes);
    master_dest.bonus_attributes.add(bonus_add_attributes);

func out_worn(master_dest: BaseCharacter = master):
    master_dest.base_attributes.sub(base_add_attributes);
    master_dest.bonus_attributes.sub(bonus_add_attributes);
    master = null;