package
{
    import flash.display.Sprite;

    import tapestry.core.Tapestry;

    import test.TestFeature;

    [SWF(width=100,height=100)]
    public class SampleApp extends Sprite
    {
        public function SampleApp()
        {
            Tapestry.addFeature(new TestFeature());
            Tapestry.initialize(this);
        }
    }
}
