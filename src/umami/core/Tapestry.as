package umami.core
{
    import flash.display.Sprite;

    import umami.meta.processors.Create;
    import umami.meta.processors.Mapping;
    import umami.meta.processors.Service;
    import umami.injection.IInjector;
    import umami.meta.IMeta;
    import umami.meta.MetaUtil;
    import umami.meta.processors.Processor;

    /**
     * Main class for creating an AS3 umami application
     *
     * Lifecycle: All task
     *  * [Service]
     *  * [Processor]
     *  * [Views]
     *  * [Mediators]
     *  * Other Processors
     *  * Apply Injections
     */
    public class Tapestry
    {
        //_____________________________________________________________________
        //	Public Static Methods
        //_____________________________________________________________________
        /**
         * Initializes the umami application and begins processing
         * features added to the application
         * @param root
         */
        public static function initialize(root:Sprite):void
        {
            // The global injector that will be put into
            // the services and injection processor
            var mapping:Mapping = new Mapping();
            var create:Create = new Create();

            // Add the core, which is the processor tag,
            // with this we can add any other processors
            // we want with metadata and features
            meta.addProcessor("Processor", new Processor());
            meta.addProcessor("Service", new Service());
            meta.addProcessor("Create", create);
            meta.addProcessor("Map", mapping);

            // at this point we will add the custom features, we must have
            // injection happen at the end somehow
            meta.process(features);

            // after we initialize all of the features, we can then inject
            // all the dependencies
            for (var j:int = 0; j < features.length; j++)
            {
                var feature:Object = features[j];
                var localInjector:IInjector = mapping.getInjectorForFeature(feature);
                for(var key:String in create.getCreatedPropertiesForTarget(feature))
                {
                    mapping.getGlobalInjector().apply(feature[key]);
                    localInjector.apply(feature[key]);
                }
            }
        }

        /**
         * Add Feature
         */
        public static function addFeature(value:Object):void
        {
            features.push(value);
        }

        //_____________________________________________________________________
        //	Protected Static Properties
        //_____________________________________________________________________
        protected static var meta:IMeta = new MetaUtil();
        protected static var features:Array = [];
    }
}
