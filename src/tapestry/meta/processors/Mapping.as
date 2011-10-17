package tapestry.meta.processors
{
    import flash.utils.Dictionary;

    import flash.utils.getDefinitionByName;

    import tapestry.injection.IInjector;
    import tapestry.injection.Injector;
    import tapestry.meta.IMeta;
    import tapestry.meta.IMetaProcessor;
    import tapestry.meta.getConstructor;

    /**
     * Maps the value to a local injector or a global
     * injector
     */
    public class Mapping implements IMetaProcessor
    {
        //_____________________________________________________________________
        //	IMetaProcessor Implementation
        //_____________________________________________________________________
        public function execute(target:Object, property:String, propertyType:Class, arguments:Object):void
        {
            var instance:Object = target[property];
            var injector:IInjector = arguments["global"] == true ? globalInjector : getInjectorForFeature(target);

            if(!instance)
            {
                throw new Error("Target property must be non null");
            }
            else
            {
                if(arguments["mapAs"])
                {
                    var clazz:Class = getDefinitionByName(arguments["mapAs"]) as Class;
                    injector.mapValue(instance, clazz);
                }
                else
                {
                    injector.mapValue(instance,getConstructor(instance));
                }
            }

        }

        public function onAdd(meta:IMeta):void
        {
        }

        //_____________________________________________________________________
        //	Public functions
        //_____________________________________________________________________
        public function getInjectorForFeature(feature:Object):IInjector
        {
            if(!localInjectors[feature])
            {
                localInjectors[feature] = new Injector();
            }

            return localInjectors[feature];
        }

        public function getGlobalInjector():IInjector
        {
            return globalInjector;
        }

        //_____________________________________________________________________
        //	Protected Static
        //_____________________________________________________________________
        /**
         * Global injector for the application, this will not call postinject
         */
        protected static var globalInjector:IInjector = new Injector(false);

        //_____________________________________________________________________
        //	Protected Properties
        //_____________________________________________________________________
        protected var localInjectors:Dictionary = new Dictionary(true);
    }
}
