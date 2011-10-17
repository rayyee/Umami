package test
{
    public class TestService implements ITestService
    {
        public function TestService()
        {
        }

        [Inject]
        public var processor:TestProcessor;

        [PostInject]
        public function doSomething():void
        {
            trace("We Did something")
        }
    }
}
