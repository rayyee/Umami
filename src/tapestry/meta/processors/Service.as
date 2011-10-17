package tapestry.meta.processors
{
    import flash.utils.getDefinitionByName;

    import tapestry.meta.getConstructor;

    /**
     * Creates and maps a Service in the global injector so
     * other features can get injected into
     */
    public class Service extends Create
    {
        //_____________________________________________________________________
        //	Constructor
        //_____________________________________________________________________
        public function Service()
        {
            super();
        }

        //_____________________________________________________________________
        //	Overrides
        //_____________________________________________________________________
        override public function execute(target:Object, property:String, propertyType:Class, arguments:Object):void
        {
            super.execute(target, property, propertyType, arguments);

            if(arguments["mapAs"])
            {
                var clazz:Class = getDefinitionByName(arguments["mapAs"]) as Class;
                mapping.getGlobalInjector().mapValue(currentInstance,clazz);
            }
            else
            {
                mapping.getGlobalInjector().mapValue(currentInstance,getConstructor(currentInstance));
            }
        }

        //_____________________________________________________________________
        //	Protected Properties
        //_____________________________________________________________________
        // kinda hacky but it works for now
        public var mapping:Mapping = new Mapping();
    }
}
