
public class IRecipeManager{

    public static init() as void{
        RecipeUtils.recipeTypeLoader();
        CraftingTable.init();

        // RecipeUtils.removeAllRecipesByInput("tin");
        // RecipeUtils.removeAllRecipesByOutput("tin");
    }
}