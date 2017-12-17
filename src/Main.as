package {

import flash.display.Sprite;
import flash.events.Event;

import utils.GameScreen;

import starling.core.Starling

[SWF(width="1", height="1", frameRate="60", backgroundColor="#000000")]
public class Main extends Sprite
{
    public function Main()
    {
        this.addEventListener(Event.ADDED_TO_STAGE, init)
    }

    private function init(e:Event):void
    {
        var starling:Starling = GameScreen.createStarling(Game, stage, true);
        starling.start();
    }

}
}
