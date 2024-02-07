import crafttweaker.api.text.Component;
import stdlib.List;

public class IMessage{
    public val message as Component;
    public val minFrequency as double;

    public this(message as Component, minFrequency as double){
        this.message = message;
        this.minFrequency = minFrequency;
    }
}