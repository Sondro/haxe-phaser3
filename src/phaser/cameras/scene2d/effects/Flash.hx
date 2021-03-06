package phaser.cameras.scene2d.effects;

/**
 * @classdesc
 * A Camera Flash effect.
 *
 * This effect will flash the camera viewport to the given color, over the duration specified.
 *
 * Only the camera viewport is flashed. None of the objects it is displaying are impacted, i.e. their colors do
 * not change.
 *
 * The effect will dispatch several events on the Camera itself and you can also specify an `onUpdate` callback,
 * which is invoked each frame for the duration of the effect, if required.
 *
 * @class Flash
 * @memberof Phaser.Cameras.Scene2D.Effects
 * @constructor
 * @since 3.5.0
 *
 * @param {Phaser.Cameras.Scene2D.Camera} camera - The camera this effect is acting upon.
 */
@:native("Phaser.Cameras.Scene2D.Effects.Flash")
extern class Flash {
    public function new(camera:phaser.cameras.scene2d.Camera);
    /**
     * The Camera this effect belongs to.
     *
     * @name Phaser.Cameras.Scene2D.Effects.Flash#camera
     * @type {Phaser.Cameras.Scene2D.Camera}
     * @readonly
     * @since 3.5.0
     */
    public var camera:phaser.cameras.scene2d.Camera;
    /**
     * Is this effect actively running?
     *
     * @name Phaser.Cameras.Scene2D.Effects.Flash#isRunning
     * @type {boolean}
     * @readonly
     * @default false
     * @since 3.5.0
     */
    public var isRunning:Bool;
    /**
     * The duration of the effect, in milliseconds.
     *
     * @name Phaser.Cameras.Scene2D.Effects.Flash#duration
     * @type {integer}
     * @readonly
     * @default 0
     * @since 3.5.0
     */
    public var duration:Int;
    /**
     * If this effect is running this holds the current percentage of the progress, a value between 0 and 1.
     *
     * @name Phaser.Cameras.Scene2D.Effects.Flash#progress
     * @type {number}
     * @since 3.5.0
     */
    public var progress:Float;
    /**
     * Flashes the Camera to or from the given color over the duration specified.
     *
     * @method Phaser.Cameras.Scene2D.Effects.Flash#start
     * @fires CameraFlashStartEvent
     * @fires CameraFlashCompleteEvent
     * @since 3.5.0
     *
     * @param {integer} [duration=250] - The duration of the effect in milliseconds.
     * @param {integer} [red=255] - The amount to fade the red channel towards. A value between 0 and 255.
     * @param {integer} [green=255] - The amount to fade the green channel towards. A value between 0 and 255.
     * @param {integer} [blue=255] - The amount to fade the blue channel towards. A value between 0 and 255.
     * @param {boolean} [force=false] - Force the effect to start immediately, even if already running.
     * @param {CameraFlashCallback} [callback] - This callback will be invoked every frame for the duration of the effect.
     * It is sent two arguments: A reference to the camera and a progress amount between 0 and 1 indicating how complete the effect is.
     * @param {any} [context] - The context in which the callback is invoked. Defaults to the Scene to which the Camera belongs.
     *
     * @return {Phaser.Cameras.Scene2D.Camera} The Camera on which the effect was started.
     */
    public function start(?duration:Int, ?red:Int, ?green:Int, ?blue:Int, ?force:Bool, ?callback:CameraFlashCallback, ?context:Dynamic):phaser.cameras.scene2d.Camera;
    /**
     * The main update loop for this effect. Called automatically by the Camera.
     *
     * @method Phaser.Cameras.Scene2D.Effects.Flash#update
     * @since 3.5.0
     *
     * @param {integer} time - The current timestamp as generated by the Request Animation Frame or SetTimeout.
     * @param {number} delta - The delta time, in ms, elapsed since the last frame.
     */
    public function update(time:Int, delta:Float):Void;
    /**
     * Called internally by the Canvas Renderer.
     *
     * @method Phaser.Cameras.Scene2D.Effects.Flash#postRenderCanvas
     * @since 3.5.0
     *
     * @param {CanvasRenderingContext2D} ctx - The Canvas context to render to.
     *
     * @return {boolean} `true` if the effect drew to the renderer, otherwise `false`.
     */
    public function postRenderCanvas(ctx:js.html.CanvasRenderingContext2D):Bool;
    /**
     * Called internally by the WebGL Renderer.
     *
     * @method Phaser.Cameras.Scene2D.Effects.Flash#postRenderWebGL
     * @since 3.5.0
     *
     * @param {Phaser.Renderer.WebGL.Pipelines.TextureTintPipeline} pipeline - The WebGL Pipeline to render to.
     * @param {function} getTintFunction - A function that will return the gl safe tint colors.
     *
     * @return {boolean} `true` if the effect drew to the renderer, otherwise `false`.
     */
    public function postRenderWebGL(pipeline:phaser.renderer.webgl.pipelines.TextureTintPipeline, getTintFunction:Dynamic):Bool;
    /**
     * Called internally when the effect completes.
     *
     * @method Phaser.Cameras.Scene2D.Effects.Flash#effectComplete
     * @since 3.5.0
     */
    public function effectComplete():Void;
    /**
     * Resets this camera effect.
     * If it was previously running, it stops instantly without calling its onComplete callback or emitting an event.
     *
     * @method Phaser.Cameras.Scene2D.Effects.Flash#reset
     * @since 3.5.0
     */
    public function reset():Void;
    /**
     * Destroys this effect, releasing it from the Camera.
     *
     * @method Phaser.Cameras.Scene2D.Effects.Flash#destroy
     * @since 3.5.0
     */
    public function destroy():Void;
}
