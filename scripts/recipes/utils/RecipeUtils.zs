import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.recipe.IRecipeManager;
import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.bracket.BracketHandlers;
import crafttweaker.api.recipe.IRecipeManager;
import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.world.Container;
import crafttweaker.api.item.ItemStack;

import stdlib.List;

public class RecipeUtils{
    public static val recipeTypesStringList as string[] = [
        "minecraft:crafting",
        "minecraft:smelting",
        "minecraft:blasting",
        "minecraft:smoking",
        "minecraft:campfire_cooking",
        "minecraft:stonecutting",
        "minecraft:smithing",
        "techreborn:alloy_smelter",
        "techreborn:assembling_machine",
        "techreborn:blast_furnace",
        "techreborn:centrifuge",
        "techreborn:chemical_reactor",
        "techreborn:compressor",
        "techreborn:distillation_tower",
        "techreborn:extractor",
        "techreborn:grinder",
        "techreborn:implosion_compressor",
        "techreborn:industrial_electrolyzer",
        "techreborn:industrial_grinder",
        "techreborn:industrial_sawmill",
        "techreborn:recycler",
        "techreborn:scrapbox",
        "techreborn:vacuum_freezer",
        "techreborn:fluid_replicator",
        "techreborn:fusion_reactor",
        "techreborn:rolling_machine",
        "techreborn:solid_canning_machine",
        "techreborn:wire_mill",
        "alloy_forgery:forging",
        "ae2:inscriber",
        "ae2:charger",
        "ae2:transform",
        "quarryplus:workbench_recipe",
        "powah:energizing",
        "ironfurnaces:generator_blasting",
        "pneumaticcraft:amadron",
        "pneumaticcraft:assembly_laser",
        "pneumaticcraft:assembly_drill",
        "pneumaticcraft:assembly_drill_laser",
        "pneumaticcraft:heat_properties",
        "pneumaticcraft:explosion_crafting",
        "pneumaticcraft:fluid_mixer",
        "pneumaticcraft:fuel_quality",
        "pneumaticcraft:heat_frame_cooling",
        "pneumaticcraft:pressure_chamber",
        "pneumaticcraft:refinery",
        "pneumaticcraft:thermo_plant",
        "electrodynamics:wire_mill_recipe",
        "electrodynamics:mineral_grinder_recipe",
        "electrodynamics:mineral_crusher_recipe",
        "electrodynamics:lathe_recipe",
        "electrodynamics:oxidation_furnace_recipe",
        "electrodynamics:energized_alloyer_recipe",
        "electrodynamics:reinforced_alloyer_recipe",
        "electrodynamics:chemical_mixer_recipe",
        "electrodynamics:fermentation_plant_recipe",
        "electrodynamics:mineral_washer_recipe",
        "electrodynamics:chemical_crystallizer_recipe",
        "electrodynamics:electrolytic_separator_recipe",
        "mekanism:crushing",
        "mekanism:enriching",
        "mekanism:smelting",
        "mekanism:chemical_infusing",
        "mekanism:combining",
        "mekanism:separating",
        "mekanism:washing",
        "mekanism:evaporating",
        "mekanism:activating",
        "mekanism:centrifuging",
        "mekanism:crystallizing",
        "mekanism:dissolution",
        "mekanism:compressing",
        "mekanism:purifying",
        "mekanism:injecting",
        "mekanism:nucleosynthesizing",
        "mekanism:energy_conversion",
        "mekanism:gas_conversion",
        "mekanism:oxidizing",
        "mekanism:infusion_conversion",
        "mekanism:pigment_extracting",
        "mekanism:pigment_mixing",
        "mekanism:metallurgic_infusing",
        "mekanism:painting",
        "mekanism:reaction",
        "mekanism:rotary",
        "mekanism:sawing",
        "alchemistry:atomizer",
        "alchemistry:compactor",
        "alchemistry:combiner",
        "alchemistry:dissolver",
        "alchemistry:fission",
        "alchemistry:fusion",
        "alchemistry:liquifier",
        "notreepunching:empty",
        "integrateddynamics:drying_basin",
        "integrateddynamics:mechanical_drying_basin",
        "integrateddynamics:squeezer",
        "integrateddynamics:mechanical_squeezer",
        "ad_astra:compressing",
        "ad_astra:space_station",
        "ad_astra:nasa_workbench",
        "ad_astra:fuel_conversion",
        "ad_astra:oxygen_conversion",
        "ad_astra:cryo_fuel_conversion",
        "extendedcrafting:combination",
        "extendedcrafting:table",
        "extendedcrafting:compressor",
        "extendedcrafting:ender_crafter",
        "extendedcrafting:flux_crafter",
        "create:conversion",
        "create:crushing",
        "create:cutting",
        "create:milling",
        "create:basin",
        "create:mixing",
        "create:compacting",
        "create:pressing",
        "create:sandpaper_polishing",
        "create:splashing",
        "create:haunting",
        "create:deploying",
        "create:filling",
        "create:emptying",
        "create:item_application",
        "create:mechanical_crafting",
        "create:sequenced_assembly",
        "nuclearcraft:fission_reactor_controller",
        "nuclearcraft:nc_ore_veins",
        "nuclearcraft:fusion_core",
        "nuclearcraft:fusion_coolant",
        "nuclearcraft:fission_boiling",
        "nuclearcraft:turbine_controller",
        "nuclearcraft:rock_crusher",
        "nuclearcraft:decay_hastener",
        "nuclearcraft:irradiator",
        "nuclearcraft:nuclear_furnace",
        "nuclearcraft:extractor",
        "nuclearcraft:electrolyzer",
        "nuclearcraft:pressurizer",
        "nuclearcraft:alloy_smelter",
        "nuclearcraft:melter",
        "nuclearcraft:analyzer",
        "nuclearcraft:ingot_former",
        "nuclearcraft:pump",
        "nuclearcraft:fuel_reprocessor",
        "nuclearcraft:leacher",
        "nuclearcraft:crystallizer",
        "nuclearcraft:assembler",
        "nuclearcraft:steam_turbine",
        "nuclearcraft:supercooler",
        "nuclearcraft:centrifuge",
        "nuclearcraft:chemical_reactor",
        "nuclearcraft:fluid_infuser",
        "nuclearcraft:isotope_separator",
        "nuclearcraft:fluid_enricher",
        "nuclearcraft:gas_scrubber",
        "nuclearcraft:manufactory",
        "tfmg:casting",
        "tfmg:industrial_blasting",
        "tfmg:coking",
        "tfmg:distillation",
        "tfmg:advanced_distillation",
        "createaddition:rolling",
        "createaddition:charging",
        "createaddition:liquid_burning",
    ];
    public static var recipeType as List<IRecipeManager<Recipe<Container>>> = new List<IRecipeManager<Recipe<Container>>>();

    public static recipeTypeLoader() as void{
        for d1 in RecipeUtils.recipeTypesStringList{
            recipeType.add(BracketHandlers.getRecipeManager(d1));
        }
    }

    public static removeAllRecipesByInput(itemInput as string) as void{
        for recipeType in RecipeUtils.recipeType{
            var listRecipes = recipeType.getAllRecipes();
            for recipe in listRecipes as List<Recipe<Container>>{
                for item in recipe.getIngredients(){
                    if(itemInput in item.commandString || item.commandString == itemInput){
                        if(Debugger.debugMode && Debugger.config["recipesRemove"]){
                            println("Rcipe Remove by name : " + recipe.getId().namespace + ":" + recipe.getId().path);
                        }
                        recipeType.removeByName(recipe.getId().namespace + ":" + recipe.getId().path);
                        break;
                    }
                }
            }
        }
    }

    public static removeAllRecipesByInput(itemInput as IItemStack) as void{
        for recipeType in RecipeUtils.recipeType{
            var listRecipes = recipeType.getAllRecipes();
            for recipe in listRecipes as List<Recipe<Container>>{
                for item in recipe.getIngredients(){
                    if(itemInput in item.items || item.contains(itemInput)){
                        if(Debugger.debugMode && Debugger.config["recipesRemove"]){
                            println("Rcipe Remove by item : " + recipe.getId().namespace + ":" + recipe.getId().path);
                        }
                        recipeType.removeByName(recipe.getId().namespace + ":" + recipe.getId().path);
                        break;
                    }
                }
            }
        }
    }

    public static removeAllRecipesByOutput(itemInput as IItemStack) as void{
        for recipeType in RecipeUtils.recipeType{
            var listRecipes = recipeType.getAllRecipes();
            for recipe in listRecipes as List<Recipe<Container>>{
                var item = recipe.getResultItem();
                if(itemInput.matches(item) || item == itemInput){
                    if(Debugger.debugMode && Debugger.config["recipesRemove"]){
                        println("Rcipe Remove by item : " + recipe.getId().namespace + ":" + recipe.getId().path);
                    }
                    recipeType.removeByName(recipe.getId().namespace + ":" + recipe.getId().path);
                    break;
                }
            }
        }
    }


        //// public static removeAllRecipesByOutput(itemInput as string) as void{
    ////     for recipeType in RecipeUtils.recipeType{
    ////         var listRecipes = recipeType.getAllRecipes();
    ////         for recipe in listRecipes as List<Recipe<Container>>{
    //             // var item as IIngredient = recipe.getResultItem() as IIngredient;
    //             // println(item.commandString);
    //             // if(item.matches(<item:minecraft:air>)){
    //                 // if(Debugger.debugMode && Debugger.config["recipesRemove"]){
    //                 //     println("Rcipe Remove by name : " + recipe.getId().namespace + ":" + recipe.getId().path);
    //                 // }
    //                 // recipeType.removeByName(recipe.getId().namespace + ":" + recipe.getId().path);
    //                 // break;
    //             //}
    ////         }
    ////     }
    //// }
}