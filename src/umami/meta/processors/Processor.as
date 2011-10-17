package umami.meta.processors
{
    import umami.meta.IMeta;
    import umami.meta.IMetaProcessor;

    /**
     * A Processor for adding a processor via metadata
     */
    public class Processor extends Create
    {
        //_____________________________________________________________________
        //	Overrides
        //_____________________________________________________________________
        override public function execute(target:Object, property:String, propertyType:Class, arguments:Object):void
        {
            super.execute(target, property, propertyType, arguments);

            // add a processor for the current instance
            var name:String = arguments.name;
            _meta.addProcessor(name, currentInstance as IMetaProcessor);
        }

        override public function onAdd(meta:IMeta):void
        {
            _meta = meta;
        }

        //_____________________________________________________________________
        //	Protected Properties
        //_____________________________________________________________________
        protected var _meta:IMeta;
    }
}
