import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.tag.type.KnownTag;
import crafttweaker.api.tag.manager.type.KnownTagManager;
import crafttweaker.api.item.ItemDefinition;

import stdlib.List;

import mods.jeitweaker.Jei;
import mods.jeitweaker.ingredient.JeiIngredient;
import crafttweaker.api.text.Component;

public class IResouces{
    public val baseItem as IItemStack;
    public val tag as KnownTag<ItemDefinition>;

    public this(baseItem as IItemStack, tag as KnownTag<ItemDefinition>){
        this.baseItem = baseItem;
        this.tag = tag;
    }
    public this(tag as KnownTag<ItemDefinition>){
        this.baseItem = tag.elements()[0] as ItemDefinition as IItemStack;
        this.tag = tag;
    }

    public of(baseItem as IItemStack, tag as KnownTag<ItemDefinition>) as IResouces{
        return new IResouces(baseItem, tag);
    }
    public of(tag as KnownTag<ItemDefinition>) as IResouces{
        return new IResouces(tag);
    }

    public implements IRemoveble{
        public unidict() as void{
            print("Unidict for : " + tag as string);
            var removeItemList as List<ItemDefinition> = new List<ItemDefinition>();
            if(!tag.elements().isEmpty){
                for item in tag.elements() as stdlib.List<ItemDefinition>{
                    if !baseItem.matches(item){
                        removeItemList.add(item);
                        (item as IItemStack).addTooltip(Component.literal("Deleted !"));
                        Jei.hideIngredient(item as IItemStack);
                    }
                }
                if(!removeItemList.isEmpty){
                    tag.remove(removeItemList);
                    RecipeUnidict.unidict(baseItem, removeItemList);
                }
            }
        }   
    }
}