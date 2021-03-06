package phaser.input;

/**
 * @classdesc
 * The Input Manager is responsible for handling the pointer related systems in a single Phaser Game instance.
 *
 * Based on the Game Config it will create handlers for mouse and touch support.
 *
 * Keyboard and Gamepad are plugins, handled directly by the InputPlugin class.
 *
 * It then manages the event queue, pointer creation and general hit test related operations.
 *
 * You rarely need to interact with the Input Manager directly, and as such, all of its properties and methods
 * should be considered private. Instead, you should use the Input Plugin, which is a Scene level system, responsible
 * for dealing with all input events for a Scene.
 *
 * @class InputManager
 * @memberof Phaser.Input
 * @constructor
 * @since 3.0.0
 *
 * @param {Phaser.Game} game - The Game instance that owns the Input Manager.
 * @param {object} config - The Input Configuration object, as set in the Game Config.
 */
@:native("Phaser.Input.InputManager")
extern class InputManager {
    public function new(game:phaser.Game, config:Dynamic);
    /**
     * The Game instance that owns the Input Manager.
     * A Game only maintains on instance of the Input Manager at any time.
     *
     * @name Phaser.Input.InputManager#game
     * @type {Phaser.Game}
     * @readonly
     * @since 3.0.0
     */
    public var game:phaser.Game;
    /**
     * The Canvas that is used for all DOM event input listeners.
     *
     * @name Phaser.Input.InputManager#canvas
     * @type {HTMLCanvasElement}
     * @since 3.0.0
     */
    public var canvas:js.html.CanvasElement;
    /**
     * The Input Configuration object, as set in the Game Config.
     *
     * @name Phaser.Input.InputManager#config
     * @type {object}
     * @since 3.0.0
     */
    public var config:Dynamic;
    /**
     * If set, the Input Manager will run its update loop every frame.
     *
     * @name Phaser.Input.InputManager#enabled
     * @type {boolean}
     * @default true
     * @since 3.0.0
     */
    public var enabled:Bool;
    /**
     * The Event Emitter instance that the Input Manager uses to emit events from.
     *
     * @name Phaser.Input.InputManager#events
     * @type {Phaser.Events.EventEmitter}
     * @since 3.0.0
     */
    public var events:phaser.events.EventEmitter;
    /**
     * A standard FIFO queue for the native DOM events waiting to be handled by the Input Manager.
     *
     * @name Phaser.Input.InputManager#queue
     * @type {array}
     * @default []
     * @since 3.0.0
     */
    public var queue:Array<Dynamic>;
    /**
     * The default CSS cursor to be used when interacting with your game.
     *
     * See the `setDefaultCursor` method for more details.
     *
     * @name Phaser.Input.InputManager#defaultCursor
     * @type {string}
     * @since 3.10.0
     */
    public var defaultCursor:String;
    /**
     * A reference to the Mouse Manager class, if enabled via the `input.mouse` Game Config property.
     *
     * @name Phaser.Input.InputManager#mouse
     * @type {?Phaser.Input.Mouse.MouseManager}
     * @since 3.0.0
     */
    public var mouse:phaser.input.mouse.MouseManager;
    /**
     * A reference to the Touch Manager class, if enabled via the `input.touch` Game Config property.
     *
     * @name Phaser.Input.InputManager#touch
     * @type {Phaser.Input.Touch.TouchManager}
     * @since 3.0.0
     */
    public var touch:phaser.input.touch.TouchManager;
    /**
     * An array of Pointers that have been added to the game.
     * The first entry is reserved for the Mouse Pointer, the rest are Touch Pointers.
     *
     * By default there is 1 touch pointer enabled. If you need more use the `addPointer` method to start them,
     * or set the `input.activePointers` property in the Game Config.
     *
     * @name Phaser.Input.InputManager#pointers
     * @type {Phaser.Input.Pointer[]}
     * @since 3.10.0
     */
    public var pointers:Array<phaser.input.Pointer>;
    /**
     * The number of touch objects activated and being processed each update.
     *
     * You can change this by either calling `addPointer` at run-time, or by
     * setting the `input.activePointers` property in the Game Config.
     *
     * @name Phaser.Input.InputManager#pointersTotal
     * @type {integer}
     * @readonly
     * @since 3.10.0
     */
    public var pointersTotal:Int;
    /**
     * The mouse has its own unique Pointer object, which you can reference directly if making a _desktop specific game_.
     * If you are supporting both desktop and touch devices then do not use this property, instead use `activePointer`
     * which will always map to the most recently interacted pointer.
     *
     * @name Phaser.Input.InputManager#mousePointer
     * @type {?Phaser.Input.Pointer}
     * @since 3.10.0
     */
    public var mousePointer:phaser.input.Pointer;
    /**
     * The most recently active Pointer object.
     *
     * If you've only 1 Pointer in your game then this will accurately be either the first finger touched, or the mouse.
     *
     * If your game doesn't need to support multi-touch then you can safely use this property in all of your game
     * code and it will adapt to be either the mouse or the touch, based on device.
     *
     * @name Phaser.Input.InputManager#activePointer
     * @type {Phaser.Input.Pointer}
     * @since 3.0.0
     */
    public var activePointer:phaser.input.Pointer;
    /**
     * Reset every frame. Set to `true` if any of the Pointers are dirty this frame.
     *
     * @name Phaser.Input.InputManager#dirty
     * @type {boolean}
     * @since 3.10.0
     */
    public var dirty:Bool;
    /**
     * The Scale factor being applied to input coordinates.
     *
     * @name Phaser.Input.InputManager#scale
     * @type { { x:number, y:number } }
     * @since 3.0.0
     */
    public var scale:Dynamic;
    /**
     * If the top-most Scene in the Scene List receives an input it will stop input from
     * propagating any lower down the scene list, i.e. if you have a UI Scene at the top
     * and click something on it, that click will not then be passed down to any other
     * Scene below. Disable this to have input events passed through all Scenes, all the time.
     *
     * @name Phaser.Input.InputManager#globalTopOnly
     * @type {boolean}
     * @default true
     * @since 3.0.0
     */
    public var globalTopOnly:Bool;
    /**
     * An internal flag that controls if the Input Manager will ignore or process native DOM events this frame.
     * Set via the InputPlugin.stopPropagation method.
     *
     * @name Phaser.Input.InputManager#ignoreEvents
     * @type {boolean}
     * @default false
     * @since 3.0.0
     */
    public var ignoreEvents:Bool;
    /**
     * The bounds of the Input Manager, used for pointer hit test calculations.
     *
     * @name Phaser.Input.InputManager#bounds
     * @type {Phaser.Geom.Rectangle}
     * @since 3.0.0
     */
    public var bounds:phaser.geom.Rectangle;
    /**
     * The Boot handler is called by Phaser.Game when it first starts up.
     * The renderer is available by now.
     *
     * @method Phaser.Input.InputManager#boot
     * @protected
     * @since 3.0.0
     */
    public function boot():Void;
    /**
     * Updates the Input Manager bounds rectangle to match the bounding client rectangle of the
     * canvas element being used to track input events.
     *
     * @method Phaser.Input.InputManager#updateBounds
     * @since 3.0.0
     */
    public function updateBounds():Void;
    /**
     * Resizes the Input Manager internal values, including the bounds and scale factor.
     *
     * @method Phaser.Input.InputManager#resize
     * @since 3.2.0
     */
    public function resize():Void;
    /**
     * Tells the Input system to set a custom cursor.
     *
     * This cursor will be the default cursor used when interacting with the game canvas.
     *
     * If an Interactive Object also sets a custom cursor, this is the cursor that is reset after its use.
     *
     * Any valid CSS cursor value is allowed, including paths to image files, i.e.:
     *
     * ```javascript
     * this.input.setDefaultCursor('url(assets/cursors/sword.cur), pointer');
     * ```
     *
     * Please read about the differences between browsers when it comes to the file formats and sizes they support:
     *
     * https://developer.mozilla.org/en-US/docs/Web/CSS/cursor
     * https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_User_Interface/Using_URL_values_for_the_cursor_property
     *
     * It's up to you to pick a suitable cursor format that works across the range of browsers you need to support.
     *
     * @method Phaser.Input.InputManager#setDefaultCursor
     * @since 3.10.0
     *
     * @param {string} cursor - The CSS to be used when setting the default cursor.
     */
    public function setDefaultCursor(cursor:String):Void;
    /**
     * Adds new Pointer objects to the Input Manager.
     *
     * By default Phaser creates 2 pointer objects: `mousePointer` and `pointer1`.
     *
     * You can create more either by calling this method, or by setting the `input.activePointers` property
     * in the Game Config, up to a maximum of 10 pointers.
     *
     * The first 10 pointers are available via the `InputPlugin.pointerX` properties, once they have been added
     * via this method.
     *
     * @method Phaser.Input.InputManager#addPointer
     * @since 3.10.0
     *
     * @param {integer} [quantity=1] The number of new Pointers to create. A maximum of 10 is allowed in total.
     *
     * @return {Phaser.Input.Pointer[]} An array containing all of the new Pointer objects that were created.
     */
    public function addPointer(?quantity:Int):Array<phaser.input.Pointer>;
    /**
     * Adds a callback to be invoked whenever the native DOM `mouseup` or `touchend` events are received.
     * By setting the `isOnce` argument you can control if the callback is called once,
     * or every time the DOM event occurs.
     *
     * Callbacks passed to this method are invoked _immediately_ when the DOM event happens,
     * within the scope of the DOM event handler. Therefore, they are considered as 'native'
     * from the perspective of the browser. This means they can be used for tasks such as
     * opening new browser windows, or anything which explicitly requires user input to activate.
     * However, as a result of this, they come with their own risks, and as such should not be used
     * for general game input, but instead be reserved for special circumstances.
     *
     * If all you're trying to do is execute a callback when a pointer is released, then
     * please use the internal Input event system instead.
     *
     * Please understand that these callbacks are invoked when the browser feels like doing so,
     * which may be entirely out of the normal flow of the Phaser Game Loop. Therefore, you should absolutely keep
     * Phaser related operations to a minimum in these callbacks. For example, don't destroy Game Objects,
     * change Scenes or manipulate internal systems, otherwise you run a very real risk of creating
     * heisenbugs (https://en.wikipedia.org/wiki/Heisenbug) that prove a challenge to reproduce, never mind
     * solve.
     *
     * @method Phaser.Input.InputManager#addUpCallback
     * @since 3.10.0
     *
     * @param {function} callback - The callback to be invoked on this dom event.
     * @param {boolean} [isOnce=true] - `true` if the callback will only be invoked once, `false` to call every time this event happens.
     *
     * @return {this} The Input Manager.
     */
    public function addUpCallback(callback:Dynamic, ?isOnce:Bool):Dynamic;
    /**
     * Adds a callback to be invoked whenever the native DOM `mousedown` or `touchstart` events are received.
     * By setting the `isOnce` argument you can control if the callback is called once,
     * or every time the DOM event occurs.
     *
     * Callbacks passed to this method are invoked _immediately_ when the DOM event happens,
     * within the scope of the DOM event handler. Therefore, they are considered as 'native'
     * from the perspective of the browser. This means they can be used for tasks such as
     * opening new browser windows, or anything which explicitly requires user input to activate.
     * However, as a result of this, they come with their own risks, and as such should not be used
     * for general game input, but instead be reserved for special circumstances.
     *
     * If all you're trying to do is execute a callback when a pointer is down, then
     * please use the internal Input event system instead.
     *
     * Please understand that these callbacks are invoked when the browser feels like doing so,
     * which may be entirely out of the normal flow of the Phaser Game Loop. Therefore, you should absolutely keep
     * Phaser related operations to a minimum in these callbacks. For example, don't destroy Game Objects,
     * change Scenes or manipulate internal systems, otherwise you run a very real risk of creating
     * heisenbugs (https://en.wikipedia.org/wiki/Heisenbug) that prove a challenge to reproduce, never mind
     * solve.
     *
     * @method Phaser.Input.InputManager#addDownCallback
     * @since 3.10.0
     *
     * @param {function} callback - The callback to be invoked on this dom event.
     * @param {boolean} [isOnce=true] - `true` if the callback will only be invoked once, `false` to call every time this event happens.
     *
     * @return {this} The Input Manager.
     */
    public function addDownCallback(callback:Dynamic, ?isOnce:Bool):Dynamic;
    /**
     * Adds a callback to be invoked whenever the native DOM `mousemove` or `touchmove` events are received.
     * By setting the `isOnce` argument you can control if the callback is called once,
     * or every time the DOM event occurs.
     *
     * Callbacks passed to this method are invoked _immediately_ when the DOM event happens,
     * within the scope of the DOM event handler. Therefore, they are considered as 'native'
     * from the perspective of the browser. This means they can be used for tasks such as
     * opening new browser windows, or anything which explicitly requires user input to activate.
     * However, as a result of this, they come with their own risks, and as such should not be used
     * for general game input, but instead be reserved for special circumstances.
     *
     * If all you're trying to do is execute a callback when a pointer is moved, then
     * please use the internal Input event system instead.
     *
     * Please understand that these callbacks are invoked when the browser feels like doing so,
     * which may be entirely out of the normal flow of the Phaser Game Loop. Therefore, you should absolutely keep
     * Phaser related operations to a minimum in these callbacks. For example, don't destroy Game Objects,
     * change Scenes or manipulate internal systems, otherwise you run a very real risk of creating
     * heisenbugs (https://en.wikipedia.org/wiki/Heisenbug) that prove a challenge to reproduce, never mind
     * solve.
     *
     * @method Phaser.Input.InputManager#addMoveCallback
     * @since 3.10.0
     *
     * @param {function} callback - The callback to be invoked on this dom event.
     * @param {boolean} [isOnce=false] - `true` if the callback will only be invoked once, `false` to call every time this event happens.
     *
     * @return {this} The Input Manager.
     */
    public function addMoveCallback(callback:Dynamic, ?isOnce:Bool):Dynamic;
    /**
     * Performs a hit test using the given Pointer and camera, against an array of interactive Game Objects.
     *
     * The Game Objects are culled against the camera, and then the coordinates are translated into the local camera space
     * and used to determine if they fall within the remaining Game Objects hit areas or not.
     *
     * If nothing is matched an empty array is returned.
     *
     * This method is called automatically by InputPlugin.hitTestPointer and doesn't usually need to be invoked directly.
     *
     * @method Phaser.Input.InputManager#hitTest
     * @since 3.0.0
     *
     * @param {Phaser.Input.Pointer} pointer - The Pointer to test against.
     * @param {array} gameObjects - An array of interactive Game Objects to check.
     * @param {Phaser.Cameras.Scene2D.Camera} camera - The Camera which is being tested against.
     * @param {array} [output] - An array to store the results in. If not given, a new empty array is created.
     *
     * @return {array} An array of the Game Objects that were hit during this hit test.
     */
    public function hitTest(pointer:phaser.input.Pointer, gameObjects:Array<Dynamic>, camera:phaser.cameras.scene2d.Camera, ?output:Array<Dynamic>):Array<Dynamic>;
    /**
     * Checks if the given x and y coordinate are within the hit area of the Game Object.
     *
     * This method assumes that the coordinate values have already been translated into the space of the Game Object.
     *
     * If the coordinates are within the hit area they are set into the Game Objects Input `localX` and `localY` properties.
     *
     * @method Phaser.Input.InputManager#pointWithinHitArea
     * @since 3.0.0
     *
     * @param {Phaser.GameObjects.GameObject} gameObject - The interactive Game Object to check against.
     * @param {number} x - The translated x coordinate for the hit test.
     * @param {number} y - The translated y coordinate for the hit test.
     *
     * @return {boolean} `true` if the coordinates were inside the Game Objects hit area, otherwise `false`.
     */
    public function pointWithinHitArea(gameObject:phaser.gameobjects.GameObject, x:Float, y:Float):Bool;
    /**
     * Checks if the given x and y coordinate are within the hit area of the Interactive Object.
     *
     * This method assumes that the coordinate values have already been translated into the space of the Interactive Object.
     *
     * If the coordinates are within the hit area they are set into the Interactive Objects Input `localX` and `localY` properties.
     *
     * @method Phaser.Input.InputManager#pointWithinInteractiveObject
     * @since 3.0.0
     *
     * @param {Phaser.Input.InteractiveObject} object - The Interactive Object to check against.
     * @param {number} x - The translated x coordinate for the hit test.
     * @param {number} y - The translated y coordinate for the hit test.
     *
     * @return {boolean} `true` if the coordinates were inside the Game Objects hit area, otherwise `false`.
     */
    public function pointWithinInteractiveObject(object:phaser.input.InteractiveObject, x:Float, y:Float):Bool;
    /**
     * Transforms the pageX and pageY values of a Pointer into the scaled coordinate space of the Input Manager.
     *
     * @method Phaser.Input.InputManager#transformPointer
     * @since 3.10.0
     *
     * @param {Phaser.Input.Pointer} pointer - The Pointer to transform the values for.
     * @param {number} pageX - The Page X value.
     * @param {number} pageY - The Page Y value.
     */
    public function transformPointer(pointer:phaser.input.Pointer, pageX:Float, pageY:Float):Void;
    /**
     * Transforms the pageX value into the scaled coordinate space of the Input Manager.
     *
     * @method Phaser.Input.InputManager#transformX
     * @since 3.0.0
     *
     * @param {number} pageX - The DOM pageX value.
     *
     * @return {number} The translated value.
     */
    public function transformX(pageX:Float):Float;
    /**
     * Transforms the pageY value into the scaled coordinate space of the Input Manager.
     *
     * @method Phaser.Input.InputManager#transformY
     * @since 3.0.0
     *
     * @param {number} pageY - The DOM pageY value.
     *
     * @return {number} The translated value.
     */
    public function transformY(pageY:Float):Float;
    /**
     * Returns the left offset of the Input bounds.
     *
     * @method Phaser.Input.InputManager#getOffsetX
     * @since 3.0.0
     *
     * @return {number} The left bounds value.
     */
    public function getOffsetX():Float;
    /**
     * Returns the top offset of the Input bounds.
     *
     * @method Phaser.Input.InputManager#getOffsetY
     * @since 3.0.0
     *
     * @return {number} The top bounds value.
     */
    public function getOffsetY():Float;
    /**
     * Returns the horizontal Input Scale value.
     *
     * @method Phaser.Input.InputManager#getScaleX
     * @since 3.0.0
     *
     * @return {number} The horizontal scale factor of the input.
     */
    public function getScaleX():Float;
    /**
     * Returns the vertical Input Scale value.
     *
     * @method Phaser.Input.InputManager#getScaleY
     * @since 3.0.0
     *
     * @return {number} The vertical scale factor of the input.
     */
    public function getScaleY():Float;
    /**
     * Destroys the Input Manager and all of its systems.
     *
     * There is no way to recover from doing this.
     *
     * @method Phaser.Input.InputManager#destroy
     * @since 3.0.0
     */
    public function destroy():Void;
}
