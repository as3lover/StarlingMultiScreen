/**
 * Created by SalmanPC2 on 10/7/2017.
 */
package
{
import flash.geom.Rectangle;

import starling.core.Starling;

import utils.GameScreen;

import starling.display.Quad;
import starling.display.Sprite;
import starling.utils.Color;

public class Game extends Sprite
{
    public function Game()
    {
        var back:Rectangle = GameScreen.backArea;
        drawBox(back.x, back.y, back.width, back.height);

        var game:Rectangle = GameScreen.gameArea;
        drawBox(game.x, game.y, game.width, game.height, Color.BLUE);

        trace('Scale Factor:', Starling.contentScaleFactor)
    }

    private function drawBox(x:int, y:int, w:int, h:int, c:uint = Color.RED):Quad
    {
        var quad:Quad = new Quad(w,h,c);
        quad.x = x;
        quad.y = y;
        addChild(quad);

        return quad;
    }
}
}
