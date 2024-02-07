
public class Moduel{

}

public class Debugger{
    public static val debugMode as bool = true;

    public static val config as bool[string] = {
        "events" : true,
        "recipesRemove" : false,
    };
}


function init() as void{
    //ResourcesList.init();
    IEventConfigurator.init();
    IRecipeManager.init();
}

init();