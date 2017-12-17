/**
 * Created by SalmanPC2 on 10/7/2017.
 */

/*
این کلاس جهت مدیریت اندازه و نسبت های متفاوت صفحه نمایش ایجاد شده است
با استفاده از دو چندضلعی gameArea و backArea میتوان فضای کلی صفحه نمایش
و فضای متناسب با اندازه اصلی را که در کلاس Config مشخص شده، به دست آورد
جهت ساخت آبجکت starling لازم است تا از تابع createStarling این کلاس استفاده شود
*/


package utils
{
import flash.display.Stage;
import flash.geom.Rectangle;
import model.Config;
import starling.core.Starling;

public class GameScreen
{
    //Variables
    private static var _fullWidth:int;
    private static var _fullHeight:int;
    private static var _offsetY:int = -1;
    private static var _offsetX:int = -1;
    private static var _stage:Stage;
    private static var _backArea:Rectangle;
    private static var _gameArea:Rectangle;
    private static var _starling:Starling;


    //Game Size And Offset According Config Class
    public static function get GAME_WIDTH():int
    {
        return Config.GAME_WIDTH;
    }

    public static function get GAME_HEIGHT():int
    {
        return Config.GAME_HEIGHT
    }

    public static function get OFFSET():int
    {
        return Config.OFFSET
    }

    //Stage
    private static function get stage():Stage
    {
        if (_stage == null)
            throw new Error("Flash stage not Initialized, call model.GameScreen.createStarling()");

        return _stage;
    }


    //Device Full Screen Size
    public static function get screenWidth():int
    {
        return stage.fullScreenWidth;
    }
    public static function get screenHeight():int
    {
        return  stage.fullScreenHeight;
    }


    //Game Full Screen Size
    public static function get fullWidth():int
    {
        if (_fullWidth == 0)
                calculate();
        return _fullWidth;
    }

    public static function get fullHeight():int
    {
        if (_fullHeight == 0)
            calculate();
        return _fullHeight;
    }


    //Game Area Offset
    public static function get offsetY():int
    {
        if (_offsetY == -1)
            calculate();

        return _offsetY;
    }

    public static function get offsetX():int
    {
        if (_offsetX == -1)
            calculate();

        return _offsetX;
    }


    //Get background Area
    public static function get backArea():Rectangle
    {
        if(!_backArea)
            calculate();
        return _backArea
    }


    //Get Game Box Area
    public static function get gameArea():Rectangle
    {
        if(!_gameArea)
            calculate();
        return _gameArea
    }


    //Calculate All Fields
    private static function calculate():void
    {
        if(screenWidth / screenHeight > GAME_WIDTH / GAME_HEIGHT)
        {
            _fullWidth = (GAME_HEIGHT * screenWidth) / screenHeight;
            _fullHeight = GAME_HEIGHT;

            _offsetX = (_fullWidth - GAME_WIDTH) / 2;
            _offsetY = 0;
        }
        else
        {
            _fullHeight = (GAME_WIDTH * screenHeight) / screenWidth;
            _fullWidth = GAME_WIDTH;

            _offsetY = (_fullHeight - GAME_HEIGHT) / 2;
            _offsetX = 0;
        }

        _backArea = new Rectangle(OFFSET, OFFSET, fullWidth - OFFSET * 2, fullHeight - OFFSET * 2);
        _gameArea = new Rectangle(OFFSET + offsetX, OFFSET + offsetY, fullWidth - (OFFSET + offsetX)*2, fullHeight - (OFFSET + offsetY)*2);

        trace("Game:  ", GAME_WIDTH, GAME_HEIGHT);
        trace("Device:", screenWidth, screenHeight);
        trace("Full:  ", fullWidth, fullHeight);
        trace("Offset:", _offsetX, _offsetY);
    }


    //Create Staling
    public static function createStarling(gameClass:Class, flashStage:Stage, showStats:Boolean = false):Starling
    {
        if(_starling)
                return _starling;

        _stage = flashStage;
        var viewPort:Rectangle = new Rectangle(0,0, GameScreen.screenWidth,  GameScreen.screenHeight);
        _starling = new Starling(gameClass, flashStage, viewPort);
        _starling.stage.stageWidth = GameScreen.fullWidth;
        _starling.stage.stageHeight = GameScreen.fullHeight;
        _starling.showStats = showStats;
        calculate();

        return _starling
    }

}
}