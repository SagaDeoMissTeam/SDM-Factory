public class Event{
    public var permissionLevel as int;
    public var id as string;

    protected this(id as string, permissionLevel as int){
        this.id = id;
        this.permissionLevel = permissionLevel;
    }

    public static of(id as string, permissionLevel as int) as Event{
        return new Event(id, permissionLevel);
    }

    public implements IEvent{
        public getLevelPermissions(): int{
            return this.permissionLevel;
        }
        public getId(): string{
            return this.id;
        }
    }
}