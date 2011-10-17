package tapestry.meta.processors
{
    import flash.utils.Dictionary;

    import tapestry.meta.IMeta;
    import tapestry.meta.IMetaProcessor;

    import flash.utils.getDefinitionByName;
    
    /**
     * The create processor will run a create call on the meta property
     * this will automatically instantiate the object and flag it for injection
     * by the local and global injectors
     */
    public class Create implements IMetaProcessor
    {
        //_____________________________________________________________________
        //	IMetaProcessor Implementation
        //_____________________________________________________________________
        public function execute(target:Object, property:String, propertyType:Class, arguments:Object):void
        {
            // return if it exists already
            if(target[property] != null)
                return;

            if(arguments["asClass"])
            {
                var clazz:Class = getDefinitionByName(arguments["asClass"]) as Class;
                currentInstance = new clazz();
            }
            else
            {
                currentInstance = new propertyType();
            }

            // update the instance cache so injectors can run
            getCreatedPropertiesForTarget(target)[property] = currentInstance;
            
            target[property] = currentInstance;
        }

        public function onAdd(meta:IMeta):void
        {
        }

        //_____________________________________________________________________
        //	Public Functions
        //_____________________________________________________________________
        public function getCreatedPropertiesForTarget(target:Object):Object
        {
            if(!createdProperties[target])
            {
                createdProperties[target] = new Object();
            }

            return createdProperties[target];
        }

        //_____________________________________________________________________
        //	Protected Properties
        //_____________________________________________________________________
        protected var currentInstance:Object;

        //_____________________________________________________________________
        //	Static
        //_____________________________________________________________________
        protected static var createdProperties:Dictionary = new Dictionary(false);
    }
}
