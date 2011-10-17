package umami.meta
{
    /**
     * IMetaProcessor will process a metadata tag
     */
    public interface IMetaProcessor
    {
        /**
         * Executes the metadata that the <code>IMetaProcessor<code/>
         * is registered for in the <code>ICreator</code> implementations
         *
         * @param target the target object ot be manipulated
         * @param property the property on the object which the metadata is placed
         * @param arguments the arguments object inside the metadata tag
         */
        function execute(target:Object, property:String, propertyType:Class, arguments:Object):void

        /**
         * Called when the Processor is added to the creator, this is so the
         * processor can get a reference of the creator that uses it if need
         * be
         *
         * @param meta
         */
        function onAdd(meta:IMeta):void;
    }
}
