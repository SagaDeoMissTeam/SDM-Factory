import crafttweaker.api.resource.ResourceLocation;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.tag.type.KnownTag;
import crafttweaker.api.tag.manager.type.KnownTagManager;
import crafttweaker.api.item.ItemDefinition;
import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.world.Container;
import crafttweaker.api.recipe.IRecipeManager;

import crafttweaker.api.recipe.replacement.Replacer;

import stdlib.List;

public class RecipeUnidict{
    //Depences
    public static unidict(replace as IItemStack, removed as List<ItemDefinition>) as void{

    }
    
    public static unidict(replaceItem as IItemStack[], removed as List<ItemDefinition>) as void{
        if(removed.isEmpty || replaceItem.isEmpty) return;
        for d1 in removed{
            Replacer.create()
            .replace<IIngredient>(<recipecomponent:crafttweaker:output/items>, d1 as IItemStack as IIngredient, replaceItem[0] as IIngredient)
            .replace<IIngredient>(<recipecomponent:crafttweaker:input/ingredients>, d1 as IItemStack as IIngredient, replaceItem[0] as IIngredient)
            .execute();
        }
    }
}