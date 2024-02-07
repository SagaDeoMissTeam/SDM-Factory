import crafttweaker.api.util.math.RandomSource;
import crafttweaker.api.util.math.Random;
import crafttweaker.api.data.MapData;
import crafttweaker.api.text.Component;
import stdlib.List;
import crafttweaker.api.server.PlayerList;
import crafttweaker.api.entity.type.player.Player;

public class EventUtils{
    public static val eventList as IEvent[] = [
        Event.of("test", 1)
    ];

    public static getTimeToEvent(random as RandomSource) as long{
        return random.nextInt(32000, 120000) as long;
    }

    public static getRandomEvent(random as RandomSource) as Event{
        return eventList[random.nextInt(eventList.length as int)] as Event;
    }

    public static sendInfoEvntAllPlayers(playerList: PlayerList, event: Event): void{
        for d1 in playerList.getPlayers(){
            var permission = MessageUtils.getLevelPermission(d1.customData);
            if(permission >= event.getLevelPermissions()){
                var intfoX = (permission < 2 ? "10" : "§kзапутано");
                var intfoZ = (permission < 2 ? "10" : "§kзапутано");
                (d1 as Player).sendMessage(Component.translatable("sdm.event.start.message_1", intfoX, intfoZ));
            }
        }
    }
}