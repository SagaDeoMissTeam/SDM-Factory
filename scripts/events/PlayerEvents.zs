import crafttweaker.forge.api.event.entity.player.PlayerCloneEvent;
import crafttweaker.forge.api.event.tick.PlayerTickEvent;
import crafttweaker.forge.api.player.interact.RightClickItemEvent;
import crafttweaker.api.text.Component;

public class PlayerEvents{


    public static init() as void{
        onPlayerCloneEvent();
        onRightClickItemEvent();
        onPlayerTickEvent();
    }

    public static onPlayerCloneEvent() as void{
        events.register<crafttweaker.forge.api.event.entity.player.PlayerCloneEvent>(event => {
            var original = event.original;
            var player = event.entity;

            if(player.level.isClientSide) return;
            player.customData.merge(original.customData);

            if(Debugger.debugMode && Debugger.config["events"]){
                println("-------------------------------------------");
                println("Data merged !");
                println(player.customData as string);
                println("-------------------------------------------");
            }
        });
    }

    public static onRightClickItemEvent() as void{
        events.register<crafttweaker.forge.api.player.interact.RightClickItemEvent>(event => {
            var player = event.entity;
            var item = event.itemStack;
            if(player.level.isClientSide) return;

            if(item.matches(<item:kubejs:wiress_rerminal>)){
                if!("usePeredachick" in player.customData){
                    player.sendMessage(Component.translatable("sdm.corporation.tittle"));
                    player.sendMessage(MessageUtils.firstMessage);
                    player.updateCustomData({"timeConnect" : player.level.gameTime + 24000});
                    player.updateCustomData({"usePeredachick" : 1});
                    item.asMutable().shrink();
                } else {
                    player.sendMessage(MessageUtils.errorMessage);
                }
            }
        });
    }

    public static onPlayerTickEvent() as void{
        events.register<crafttweaker.forge.api.event.tick.PlayerTickEvent>(event => {
            var player = event.player;
            if(player.level.isClientSide) return;

            if("usePeredachick" in player.customData){
                if(player.customData["usePeredachick"] as int == 1){
                    var time = player.customData["timeConnect"] as long;
                    if(player.level.gameTime >= time){
                        player.updateCustomData({"usePeredachick" : 2});
                        player.updateCustomData({"permission" : 1});
                        player.sendMessage(Component.translatable("sdm.corporation.tittle"));
                        player.sendMessage(Component.translatable("sdm.connection.success.message_1", player.displayName));
                        player.sendMessage(Component.literal("\n"));
                        player.sendMessage(Component.translatable("sdm.connection.info.message_1"));
                    }
                }
            }
        });
    }
}
