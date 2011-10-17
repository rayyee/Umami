package test
{
    import umami.meta.IMeta;
    import umami.meta.IMetaProcessor;

    public class TestProcessor implements IMetaProcessor
    {
        public var something:String = "Something";

        public function execute(target:Object, property:String, propertyType:Class, arguments:Object):void
        {
            trace("Test Processing for " + target + ": " + property);
        }

        public function onAdd(meta:IMeta):void
        {
        }

        [PostInject]
        public function onInject():void
        {
            trace("Post Injected")
        }
    }
}
