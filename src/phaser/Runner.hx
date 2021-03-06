package phaser;

/**
 * The `Matter.Runner` module is an optional utility which provides a game loop,
 * that handles continuously updating a `Matter.Engine` for you within a browser.
 * It is intended for development and debugging purposes, but may also be suitable for simple games.
 * If you are using your own game loop instead, then you do not need the `Matter.Runner` module.
 * Instead just call `Engine.update(engine, delta)` in your own loop.
 *
 * See the included usage [examples](https://github.com/liabru/matter-js/tree/master/examples).
 *
 * @class Runner
 */
@:native("Runner")
extern class Runner {
    public function new();
    public function create():Void;
    public function run():Void;
    public function tick():Void;
    public function stop():Void;
    public function start():Void;
}
