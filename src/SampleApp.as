package
{
    import flash.display.Sprite;

    import umami.core.Umami;

    import test.TestFeature;

    [SWF(width=100,height=100)]
    public class SampleApp extends Sprite
    {
        public function SampleApp()
        {
            Umami.addFeature(new TestFeature());
            Umami.initialize(this);
        }
    }
}
