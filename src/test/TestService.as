package test
{
    public class TestService implements ITestService
    {
        public function TestService()
        {
        }

        [PostInject]
        public function doSomething():void
        {
            trace("We Did something")
        }
    }
}
