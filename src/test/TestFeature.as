package test
{
    import flash.display.Sprite;

    /**
     * Just a test feature to see if injection and mapping will work
     */
    public class TestFeature
    {
        [Service(mapAs="test.ITestService")]
        public var testService:TestService;

        [Processor(name="Test")]
        public var processor:TestProcessor;

        [Test]
        public var something:Sprite = new Sprite();
    }
}
