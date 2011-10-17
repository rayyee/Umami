package tapestry.features
{
    /**
     * The ViewMediator Feature adds [View] and [Mediator] tag support
     * into your tapestry application, this will allow a MVC architecture
     * into Tapestry
     */
    public class ViewMediatorFeature
    {
        [Processor(name="View")]
        public var viewProcessor:ViewProcessor;

        [Processor(name="Mediator")]
        public var mediatorProcessor:MediatorProcessor;
    }
}
