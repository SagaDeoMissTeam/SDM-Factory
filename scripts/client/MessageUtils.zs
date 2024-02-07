import crafttweaker.api.util.math.RandomSource;
import crafttweaker.api.util.math.Random;
import crafttweaker.api.data.MapData;
import crafttweaker.api.text.Component;
import stdlib.List;

public class MessageUtils{

    public static val firstMessage as Component = Component.translatable("sdm.firstmessage");
    public static val errorMessage as Component = Component.translatable("sdm.connection.error.message");

    public static val messageList as IMessage[] = [
        new IMessage(Component.translatable("sdm.message_1"), minFrequency)
    ];

    public static val firstMessageList as IMessage[] = [
        new IMessage(Component.translatable("sdm.message_2"), 0.0),
        new IMessage(Component.translatable("sdm.message_3"), 0.0),
    ];

    public static val minFrequency as double = 118.0;
    public static val maxFrequency as double = 137.0;

    public static getFrequency(random as RandomSource) as double{
        val num = random.nextDouble() * 21.0;
        return minFrequency + num;
    }

    public static getFrequency(data as MapData) as double{
        if("Frequency" in data){
            return data["Frequency"] as double;
        }
        return minFrequency;
    }

    public static getMessage(frequency as double) as Component{
        for d in messageList{
            if(frequency <= d.minFrequency){
                return d.message;
            }
        }
        return Component.empty();
    }

    public static getMessage(random as RandomSource) as Component{
        val num = random.nextInt(firstMessageList.length as int);
        return firstMessageList[num].message;
    }

    public static getLevelPermission(data as MapData) as int{
        if("permission" in data){
            return data["permission"] as int;
        }
        return 0;
    }
}