import crafttweaker.forge.api.event.tick.ServerTickEvent;
import crafttweaker.api.world.CraftTweakerSavedData;

public class LevelEvents{
    public static init() as void{
        onServerTickEvent();
    }

    public static onServerTickEvent() as void{
        events.register<crafttweaker.forge.api.event.tick.ServerTickEvent>(event => {
            var server = event.server;
            var data = server.getOverworldData();
            if("timerToNextEvent" in data.getData()){
                if(server.overworld.gameTime >= data.getData()["timerToNextEvent"] as long){
                    var iEvent as Event = EventUtils.getRandomEvent(server.overworld.random);
                    EventUtils.sendInfoEvntAllPlayers(server.playerList, iEvent);
                    data.updateData({"timerToNextEvent" : server.overworld.gameTime + EventUtils.getTimeToEvent(server.overworld.random)});
                }
            } else {
                data.updateData({"timerToNextEvent" : server.overworld.gameTime + EventUtils.getTimeToEvent(server.overworld.random)});
            }
        });
    }
}