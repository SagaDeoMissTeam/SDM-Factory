import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.tag.type.KnownTag;
import crafttweaker.api.tag.manager.type.KnownTagManager;
import crafttweaker.api.item.ItemDefinition;
import crafttweaker.api.text.Component;

import stdlib.List;

import mods.jeitweaker.Jei;
import mods.jeitweaker.ingredient.JeiIngredient;

public class IResourcesList{

    
    public val baseItem as IItemStack[];
    public val tagList as KnownTag<ItemDefinition>[];

    public this(baseItem as IItemStack[], tagList as KnownTag<ItemDefinition>[]){
        this.baseItem = baseItem;
        this.tagList = tagList;
    }

    public of(baseItem as IItemStack[], tagList as KnownTag<ItemDefinition>[]) as IResourcesList{
        return new IResourcesList(baseItem, tagList);
    }

    public implements IRemoveble{
        public unidict() as void{
            for tag in tagList{
                print("Unidict for : " + tag as string);
                var removeItemList as List<ItemDefinition> = new List<ItemDefinition>();
                if(!tag.elements().isEmpty){
                    for item in tag.elements() as stdlib.List<ItemDefinition>{
                        if !(item in baseItem){
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
}