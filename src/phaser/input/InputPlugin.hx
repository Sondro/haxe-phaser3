package phaser.input;

/**
 * @classdesc
 * The Input Plugin belongs to a Scene and handles all input related events and operations for it.
 *
 * You can access it from within a Scene using `this.input`.
 *
 * It emits events directly. For example, you can do:
 *
 * ```javascript
 * this.input.on('pointerdown', callback, context);
 * ```
 *
 * To listen for a pointer down event anywhere on the game canvas.
 *
 * Game Objects can be enabled for input by calling their `setInteractive` method. After which they
 * will directly emit input events:
 *
 * ```javascript
 * var sprite = this.add.sprite(x, y, texture);
 * sprite.setInteractive();
 * sprite.on('pointerdown', callback, context);
 * ```
 *
 * Please see the Input examples and tutorials for more information.
 *
 * @class InputPlugin
 * @extends Phaser.Events.EventEmitter
 * @memberof Phaser.Input
 * @constructor
 * @since 3.0.0
 *
 * @param {Phaser.Scene} scene - A reference to the Scene that this Input Plugin is responsible for.
 */
@:native("Phaser.Input.InputPlugin")
extern class InputPlugin extends phaser.events.EventEmitter {
    public function new(scene:phaser.Scene);
    /**
     * A reference to the Scene that this Input Plugin is responsible for.
     *
     * @name Phaser.Input.InputPlugin#scene
     * @type {Phaser.Scene}
     * @since 3.0.0
     */
    public var scene:phaser.Scene;
    /**
     * A reference to the Scene Systems class.
     *
     * @name Phaser.Input.InputPlugin#systems
     * @type {Phaser.Scenes.Systems}
     * @since 3.0.0
     */
    public var systems:phaser.scenes.Systems;
    /**
     * A reference to the Scene Systems Settings.
     *
     * @name Phaser.Input.InputPlugin#settings
     * @type {Phaser.Scenes.Settings.Object}
     * @since 3.5.0
     */
    public var settings:phaser.scenes.settings.Object;
    /**
     * A reference to the Game Input Manager.
     *
     * @name Phaser.Input.InputPlugin#manager
     * @type {Phaser.Input.InputManager}
     * @since 3.0.0
     */
    public var manager:phaser.input.InputManager;
    /**
     * If set, the Input Plugin will run its update loop every frame.
     *
     * @name Phaser.Input.InputPlugin#enabled
     * @type {boolean}
     * @default true
     * @since 3.5.0
     */
    public var enabled:Bool;
    /**
     * A reference to the Scene Display List. This property is set during the `boot` method.
     *
     * @name Phaser.Input.InputPlugin#displayList
     * @type {Phaser.GameObjects.DisplayList}
     * @since 3.0.0
     */
    public var displayList:phaser.gameobjects.DisplayList;
    /**
     * A reference to the Scene Cameras Manager. This property is set during the `boot` method.
     *
     * @name Phaser.Input.InputPlugin#cameras
     * @type {Phaser.Cameras.Scene2D.CameraManager}
     * @since 3.0.0
     */
    public var cameras:phaser.cameras.scene2d.CameraManager;
    /**
     * A reference to the Mouse Manager.
     *
     * This property is only set if Mouse support has been enabled in your Game Configuration file.
     *
     * If you just wish to get access to the mouse pointer, use the `mousePointer` property instead.
     *
     * @name Phaser.Input.InputPlugin#mouse
     * @type {?Phaser.Input.Mouse.MouseManager}
     * @since 3.0.0
     */
    public var mouse:phaser.input.mouse.MouseManager;
    /**
     * When set to `true` (the default) the Input Plugin will emulate DOM behavior by only emitting events from
     * the top-most Game Objects in the Display List.
     *
     * If set to `false` it will emit events from all Game Objects below a Pointer, not just the top one.
     *
     * @name Phaser.Input.InputPlugin#topOnly
     * @type {boolean}
     * @default true
     * @since 3.0.0
     */
    public var topOnly:Bool;
    /**
     * How often should the Pointers be checked?
     *
     * The value is a time, given in ms, and is the time that must have elapsed between game steps before
     * the Pointers will be polled again. When a pointer is polled it runs a hit test to see which Game
     * Objects are currently below it, or being interacted with it.
     *
     * Pointers will *always* be checked if they have been moved by the user, or press or released.
     *
     * This property only controls how often they will be polled if they have not been updated.
     * You should set this if you want to have Game Objects constantly check against the pointers, even
     * if the pointer didn't move itself.
     *
     * Set to 0 to poll constantly. Set to -1 to only poll on user movement.
     *
     * @name Phaser.Input.InputPlugin#pollRate
     * @type {integer}
     * @default -1
     * @since 3.0.0
     */
    public var pollRate:Int;
    /**
     * The distance, in pixels, a pointer has to move while being held down, before it thinks it is being dragged.
     *
     * @name Phaser.Input.InputPlugin#dragDistanceThreshold
     * @type {number}
     * @default 0
     * @since 3.0.0
     */
    public var dragDistanceThreshold:Float;
    /**
     * The amount of time, in ms, a pointer has to be held down before it thinks it is dragging.
     *
     * @name Phaser.Input.InputPlugin#dragTimeThreshold
     * @type {number}
     * @default 0
     * @since 3.0.0
     */
    public var dragTimeThreshold:Float;
    /**
     * The x coordinates of the ActivePointer based on the first camera in the camera list.
     * This is only safe to use if your game has just 1 non-transformed camera and doesn't use multi-touch.
     *
     * @name Phaser.Input.InputPlugin#x
     * @type {number}
     * @readonly
     * @since 3.0.0
     */
    public var x:Float;
    /**
     * The y coordinates of the ActivePointer based on the first camera in the camera list.
     * This is only safe to use if your game has just 1 non-transformed camera and doesn't use multi-touch.
     *
     * @name Phaser.Input.InputPlugin#y
     * @type {number}
     * @readonly
     * @since 3.0.0
     */
    public var y:Float;
    /**
     * The mouse has its own unique Pointer object, which you can reference directly if making a _desktop specific game_.
     * If you are supporting both desktop and touch devices then do not use this property, instead use `activePointer`
     * which will always map to the most recently interacted pointer.
     *
     * @name Phaser.Input.InputPlugin#mousePointer
     * @type {Phaser.Input.Pointer}
     * @readonly
     * @since 3.10.0
     */
    public var mousePointer:phaser.input.Pointer;
    /**
     * The current active input Pointer.
     *
     * @name Phaser.Input.InputPlugin#activePointer
     * @type {Phaser.Input.Pointer}
     * @readonly
     * @since 3.0.0
     */
    public var activePointer:phaser.input.Pointer;
    /**
     * A touch-based Pointer object.
     * This will be `undefined` by default unless you add a new Pointer using `addPointer`.
     *
     * @name Phaser.Input.InputPlugin#pointer1
     * @type {Phaser.Input.Pointer}
     * @readonly
     * @since 3.10.0
     */
    public var pointer1:phaser.input.Pointer;
    /**
     * A touch-based Pointer object.
     * This will be `undefined` by default unless you add a new Pointer using `addPointer`.
     *
     * @name Phaser.Input.InputPlugin#pointer2
     * @type {Phaser.Input.Pointer}
     * @readonly
     * @since 3.10.0
     */
    public var pointer2:phaser.input.Pointer;
    /**
     * A touch-based Pointer object.
     * This will be `undefined` by default unless you add a new Pointer using `addPointer`.
     *
     * @name Phaser.Input.InputPlugin#pointer3
     * @type {Phaser.Input.Pointer}
     * @readonly
     * @since 3.10.0
     */
    public var pointer3:phaser.input.Pointer;
    /**
     * A touch-based Pointer object.
     * This will be `undefined` by default unless you add a new Pointer using `addPointer`.
     *
     * @name Phaser.Input.InputPlugin#pointer4
     * @type {Phaser.Input.Pointer}
     * @readonly
     * @since 3.10.0
     */
    public var pointer4:phaser.input.Pointer;
    /**
     * A touch-based Pointer object.
     * This will be `undefined` by default unless you add a new Pointer using `addPointer`.
     *
     * @name Phaser.Input.InputPlugin#pointer5
     * @type {Phaser.Input.Pointer}
     * @readonly
     * @since 3.10.0
     */
    public var pointer5:phaser.input.Pointer;
    /**
     * A touch-based Pointer object.
     * This will be `undefined` by default unless you add a new Pointer using `addPointer`.
     *
     * @name Phaser.Input.InputPlugin#pointer6
     * @type {Phaser.Input.Pointer}
     * @readonly
     * @since 3.10.0
     */
    public var pointer6:phaser.input.Pointer;
    /**
     * A touch-based Pointer object.
     * This will be `undefined` by default unless you add a new Pointer using `addPointer`.
     *
     * @name Phaser.Input.InputPlugin#pointer7
     * @type {Phaser.Input.Pointer}
     * @readonly
     * @since 3.10.0
     */
    public var pointer7:phaser.input.Pointer;
    /**
     * A touch-based Pointer object.
     * This will be `undefined` by default unless you add a new Pointer using `addPointer`.
     *
     * @name Phaser.Input.InputPlugin#pointer8
     * @type {Phaser.Input.Pointer}
     * @readonly
     * @since 3.10.0
     */
    public var pointer8:phaser.input.Pointer;
    /**
     * A touch-based Pointer object.
     * This will be `undefined` by default unless you add a new Pointer using `addPointer`.
     *
     * @name Phaser.Input.InputPlugin#pointer9
     * @type {Phaser.Input.Pointer}
     * @readonly
     * @since 3.10.0
     */
    public var pointer9:phaser.input.Pointer;
    /**
     * A touch-based Pointer object.
     * This will be `undefined` by default unless you add a new Pointer using `addPointer`.
     *
     * @name Phaser.Input.InputPlugin#pointer10
     * @type {Phaser.Input.Pointer}
     * @readonly
     * @since 3.10.0
     */
    public var pointer10:phaser.input.Pointer;
    /**
     * An instance of the Gamepad Plugin class, if enabled via the `input.gamepad` Scene or Game Config property.
     * Use this to create access Gamepads connected to the browser and respond to gamepad buttons.
     *
     * @name Phaser.Input.InputPlugin#gamepad
     * @type {?Phaser.Input.Gamepad.GamepadPlugin}
     * @since 3.10.0
     */
    public var gamepad:phaser.input.gamepad.GamepadPlugin;
    /**
     * An instance of the Keyboard Plugin class, if enabled via the `input.keyboard` Scene or Game Config property.
     * Use this to create Key objects and listen for keyboard specific events.
     *
     * @name Phaser.Input.InputPlugin#keyboard
     * @type {?Phaser.Input.Keyboard.KeyboardPlugin}
     * @since 3.10.0
     */
    public var keyboard:phaser.input.keyboard.KeyboardPlugin;
    /**
     * Checks to see if both this plugin and the Scene to which it belongs is active.
     *
     * @method Phaser.Input.InputPlugin#isActive
     * @since 3.10.0
     *
     * @return {boolean} `true` if the plugin and the Scene it belongs to is active.
     */
    public function isActive():Bool;
    /**
     * Clears a Game Object so it no longer has an Interactive Object associated with it.
     * The Game Object is then queued for removal from the Input Plugin on the next update.
     *
     * @method Phaser.Input.InputPlugin#clear
     * @since 3.0.0
     *
     * @param {Phaser.GameObjects.GameObject} gameObject - The Game Object that will have its Interactive Object removed.
     *
     * @return {Phaser.GameObjects.GameObject} The Game Object that had its Interactive Object removed.
     */
    public function clear(gameObject:phaser.gameobjects.GameObject):phaser.gameobjects.GameObject;
    /**
     * Disables Input on a single Game Object.
     *
     * An input disabled Game Object still retains its Interactive Object component and can be re-enabled
     * at any time, by passing it to `InputPlugin.enable`.
     *
     * @method Phaser.Input.InputPlugin#disable
     * @since 3.0.0
     *
     * @param {Phaser.GameObjects.GameObject} gameObject - The Game Object to have its input system disabled.
     */
    public function disable(gameObject:phaser.gameobjects.GameObject):Void;
    /**
     * Enable a Game Object for interaction.
     *
     * If the Game Object already has an Interactive Object component, it is enabled and returned.
     *
     * Otherwise, a new Interactive Object component is created and assigned to the Game Object's `input` property.
     *
     * Input works by using hit areas, these are nearly always geometric shapes, such as rectangles or circles, that act as the hit area
     * for the Game Object. However, you can provide your own hit area shape and callback, should you wish to handle some more advanced
     * input detection.
     *
     * If no arguments are provided it will try and create a rectangle hit area based on the texture frame the Game Object is using. If
     * this isn't a texture-bound object, such as a Graphics or BitmapText object, this will fail, and you'll need to provide a specific
     * shape for it to use.
     *
     * You can also provide an Input Configuration Object as the only argument to this method.
     *
     * @method Phaser.Input.InputPlugin#enable
     * @since 3.0.0
     *
     * @param {Phaser.GameObjects.GameObject} gameObject - The Game Object to be enabled for input.
     * @param {(Phaser.Input.InputConfiguration|any)} [shape] - Either an input configuration object, or a geometric shape that defines the hit area for the Game Object. If not specified a Rectangle will be used.
     * @param {HitAreaCallback} [callback] - The 'contains' function to invoke to check if the pointer is within the hit area.
     * @param {boolean} [dropZone=false] - Is this Game Object a drop zone or not?
     *
     * @return {Phaser.Input.InputPlugin} This Input Plugin.
     */
    public function enable(gameObject:phaser.gameobjects.GameObject, ?shape:Dynamic, ?callback:HitAreaCallback, ?dropZone:Bool):phaser.input.InputPlugin;
    /**
     * Takes the given Pointer and performs a hit test against it, to see which interactive Game Objects
     * it is currently above.
     *
     * The hit test is performed against which-ever Camera the Pointer is over. If it is over multiple
     * cameras, it starts checking the camera at the top of the camera list, and if nothing is found, iterates down the list.
     *
     * @method Phaser.Input.InputPlugin#hitTestPointer
     * @since 3.0.0
     *
     * @param {Phaser.Input.Pointer} pointer - The Pointer to check against the Game Objects.
     *
     * @return {Phaser.GameObjects.GameObject[]} An array of all the interactive Game Objects the Pointer was above.
     */
    public function hitTestPointer(pointer:phaser.input.Pointer):Array<phaser.gameobjects.GameObject>;
    /**
     * Sets the draggable state of the given array of Game Objects.
     *
     * They can either be set to be draggable, or can have their draggable state removed by passing `false`.
     *
     * A Game Object will not fire drag events unless it has been specifically enabled for drag.
     *
     * @method Phaser.Input.InputPlugin#setDraggable
     * @since 3.0.0
     *
     * @param {(Phaser.GameObjects.GameObject|Phaser.GameObjects.GameObject[])} gameObjects - An array of Game Objects to change the draggable state on.
     * @param {boolean} [value=true] - Set to `true` if the Game Objects should be made draggable, `false` if they should be unset.
     *
     * @return {Phaser.Input.InputPlugin} This InputPlugin object.
     */
    public function setDraggable(gameObjects:Dynamic, ?value:Bool):phaser.input.InputPlugin;
    /**
     * Creates a function that can be passed to `setInteractive`, `enable` or `setHitArea` that will handle
     * pixel-perfect input detection on an Image or Sprite based Game Object, or any custom class that extends them.
     *
     * The following will create a sprite that is clickable on any pixel that has an alpha value >= 1.
     *
     * ```javascript
     * this.add.sprite(x, y, key).setInteractive(this.input.makePixelPerfect());
     * ```
     *
     * The following will create a sprite that is clickable on any pixel that has an alpha value >= 150.
     *
     * ```javascript
     * this.add.sprite(x, y, key).setInteractive(this.input.makePixelPerfect(150));
     * ```
     *
     * Once you have made an Interactive Object pixel perfect it impacts all input related events for it: down, up,
     * dragstart, drag, etc.
     *
     * As a pointer interacts with the Game Object it will constantly poll the texture, extracting a single pixel from
     * the given coordinates and checking its color values. This is an expensive process, so should only be enabled on
     * Game Objects that really need it.
     *
     * You cannot make non-texture based Game Objects pixel perfect. So this will not work on Graphics, BitmapText,
     * Render Textures, Text, Tilemaps, Containers or Particles.
     *
     * @method Phaser.Input.InputPlugin#makePixelPerfect
     * @since 3.10.0
     *
     * @param {integer} [alphaTolerance=1] - The alpha level that the pixel should be above to be included as a successful interaction.
     *
     * @return {function} A Pixel Perfect Handler for use as a hitArea shape callback.
     */
    public function makePixelPerfect(?alphaTolerance:Int):Dynamic;
    /**
     * Sets the hit area for the given array of Game Objects.
     *
     * A hit area is typically one of the geometric shapes Phaser provides, such as a `Phaser.Geom.Rectangle`
     * or `Phaser.Geom.Circle`. However, it can be any object as long as it works with the provided callback.
     *
     * If no hit area is provided a Rectangle is created based on the size of the Game Object, if possible
     * to calculate.
     *
     * The hit area callback is the function that takes an `x` and `y` coordinate and returns a boolean if
     * those values fall within the area of the shape or not. All of the Phaser geometry objects provide this,
     * such as `Phaser.Geom.Rectangle.Contains`.
     *
     * @method Phaser.Input.InputPlugin#setHitArea
     * @since 3.0.0
     *
     * @param {(Phaser.GameObjects.GameObject|Phaser.GameObjects.GameObject[])} gameObjects - An array of Game Objects to set the hit area on.
     * @param {(Phaser.Input.InputConfiguration|any)} [shape] - Either an input configuration object, or a geometric shape that defines the hit area for the Game Object. If not specified a Rectangle will be used.
     * @param {HitAreaCallback} [callback] - The 'contains' function to invoke to check if the pointer is within the hit area.
     *
     * @return {Phaser.Input.InputPlugin} This InputPlugin object.
     */
    public function setHitArea(gameObjects:Dynamic, ?shape:Dynamic, ?callback:HitAreaCallback):phaser.input.InputPlugin;
    /**
     * Sets the hit area for an array of Game Objects to be a `Phaser.Geom.Circle` shape, using
     * the given coordinates and radius to control its position and size.
     *
     * @method Phaser.Input.InputPlugin#setHitAreaCircle
     * @since 3.0.0
     *
     * @param {(Phaser.GameObjects.GameObject|Phaser.GameObjects.GameObject[])} gameObjects - An array of Game Objects to set as having a circle hit area.
     * @param {number} x - The center of the circle.
     * @param {number} y - The center of the circle.
     * @param {number} radius - The radius of the circle.
     * @param {HitAreaCallback} [callback] - The hit area callback. If undefined it uses Circle.Contains.
     *
     * @return {Phaser.Input.InputPlugin} This InputPlugin object.
     */
    public function setHitAreaCircle(gameObjects:Dynamic, x:Float, y:Float, radius:Float, ?callback:HitAreaCallback):phaser.input.InputPlugin;
    /**
     * Sets the hit area for an array of Game Objects to be a `Phaser.Geom.Ellipse` shape, using
     * the given coordinates and dimensions to control its position and size.
     *
     * @method Phaser.Input.InputPlugin#setHitAreaEllipse
     * @since 3.0.0
     *
     * @param {(Phaser.GameObjects.GameObject|Phaser.GameObjects.GameObject[])} gameObjects - An array of Game Objects to set as having an ellipse hit area.
     * @param {number} x - The center of the ellipse.
     * @param {number} y - The center of the ellipse.
     * @param {number} width - The width of the ellipse.
     * @param {number} height - The height of the ellipse.
     * @param {HitAreaCallback} [callback] - The hit area callback. If undefined it uses Ellipse.Contains.
     *
     * @return {Phaser.Input.InputPlugin} This InputPlugin object.
     */
    public function setHitAreaEllipse(gameObjects:Dynamic, x:Float, y:Float, width:Float, height:Float, ?callback:HitAreaCallback):phaser.input.InputPlugin;
    /**
     * Sets the hit area for an array of Game Objects to be a `Phaser.Geom.Rectangle` shape, using
     * the Game Objects texture frame to define the position and size of the hit area.
     *
     * @method Phaser.Input.InputPlugin#setHitAreaFromTexture
     * @since 3.0.0
     *
     * @param {(Phaser.GameObjects.GameObject|Phaser.GameObjects.GameObject[])} gameObjects - An array of Game Objects to set as having an ellipse hit area.
     * @param {HitAreaCallback} [callback] - The hit area callback. If undefined it uses Rectangle.Contains.
     *
     * @return {Phaser.Input.InputPlugin} This InputPlugin object.
     */
    public function setHitAreaFromTexture(gameObjects:Dynamic, ?callback:HitAreaCallback):phaser.input.InputPlugin;
    /**
     * Sets the hit area for an array of Game Objects to be a `Phaser.Geom.Rectangle` shape, using
     * the given coordinates and dimensions to control its position and size.
     *
     * @method Phaser.Input.InputPlugin#setHitAreaRectangle
     * @since 3.0.0
     *
     * @param {(Phaser.GameObjects.GameObject|Phaser.GameObjects.GameObject[])} gameObjects - An array of Game Objects to set as having a rectangular hit area.
     * @param {number} x - The top-left of the rectangle.
     * @param {number} y - The top-left of the rectangle.
     * @param {number} width - The width of the rectangle.
     * @param {number} height - The height of the rectangle.
     * @param {HitAreaCallback} [callback] - The hit area callback. If undefined it uses Rectangle.Contains.
     *
     * @return {Phaser.Input.InputPlugin} This InputPlugin object.
     */
    public function setHitAreaRectangle(gameObjects:Dynamic, x:Float, y:Float, width:Float, height:Float, ?callback:HitAreaCallback):phaser.input.InputPlugin;
    /**
     * Sets the hit area for an array of Game Objects to be a `Phaser.Geom.Triangle` shape, using
     * the given coordinates to control the position of its points.
     *
     * @method Phaser.Input.InputPlugin#setHitAreaTriangle
     * @since 3.0.0
     *
     * @param {(Phaser.GameObjects.GameObject|Phaser.GameObjects.GameObject[])} gameObjects - An array of Game Objects to set as having a  triangular hit area.
     * @param {number} x1 - The x coordinate of the first point of the triangle.
     * @param {number} y1 - The y coordinate of the first point of the triangle.
     * @param {number} x2 - The x coordinate of the second point of the triangle.
     * @param {number} y2 - The y coordinate of the second point of the triangle.
     * @param {number} x3 - The x coordinate of the third point of the triangle.
     * @param {number} y3 - The y coordinate of the third point of the triangle.
     * @param {HitAreaCallback} [callback] - The hit area callback. If undefined it uses Triangle.Contains.
     *
     * @return {Phaser.Input.InputPlugin} This InputPlugin object.
     */
    public function setHitAreaTriangle(gameObjects:Dynamic, x1:Float, y1:Float, x2:Float, y2:Float, x3:Float, y3:Float, ?callback:HitAreaCallback):phaser.input.InputPlugin;
    /**
     * Sets the Pointers to always poll.
     *
     * When a pointer is polled it runs a hit test to see which Game Objects are currently below it,
     * or being interacted with it, regardless if the Pointer has actually moved or not.
     *
     * You should enable this if you want objects in your game to fire over / out events, and the objects
     * are constantly moving, but the pointer may not have. Polling every frame has additional computation
     * costs, especially if there are a large number of interactive objects in your game.
     *
     * @method Phaser.Input.InputPlugin#setPollAlways
     * @since 3.0.0
     *
     * @return {Phaser.Input.InputPlugin} This InputPlugin object.
     */
    public function setPollAlways():phaser.input.InputPlugin;
    /**
     * Sets the Pointers to only poll when they are moved or updated.
     *
     * When a pointer is polled it runs a hit test to see which Game Objects are currently below it,
     * or being interacted with it.
     *
     * @method Phaser.Input.InputPlugin#setPollOnMove
     * @since 3.0.0
     *
     * @return {Phaser.Input.InputPlugin} This InputPlugin object.
     */
    public function setPollOnMove():phaser.input.InputPlugin;
    /**
     * Sets the poll rate value. This is the amount of time that should have elapsed before a pointer
     * will be polled again. See the `setPollAlways` and `setPollOnMove` methods.
     *
     * @method Phaser.Input.InputPlugin#setPollRate
     * @since 3.0.0
     *
     * @param {number} value - The amount of time, in ms, that should elapsed before re-polling the pointers.
     *
     * @return {Phaser.Input.InputPlugin} This InputPlugin object.
     */
    public function setPollRate(value:Float):phaser.input.InputPlugin;
    /**
     * When set to `true` the global Input Manager will emulate DOM behavior by only emitting events from
     * the top-most Game Objects in the Display List.
     *
     * If set to `false` it will emit events from all Game Objects below a Pointer, not just the top one.
     *
     * @method Phaser.Input.InputPlugin#setGlobalTopOnly
     * @since 3.0.0
     *
     * @param {boolean} value - `true` to only include the top-most Game Object, or `false` to include all Game Objects in a hit test.
     *
     * @return {Phaser.Input.InputPlugin} This InputPlugin object.
     */
    public function setGlobalTopOnly(value:Bool):phaser.input.InputPlugin;
    /**
     * When set to `true` this Input Plugin will emulate DOM behavior by only emitting events from
     * the top-most Game Objects in the Display List.
     *
     * If set to `false` it will emit events from all Game Objects below a Pointer, not just the top one.
     *
     * @method Phaser.Input.InputPlugin#setTopOnly
     * @since 3.0.0
     *
     * @param {boolean} value - `true` to only include the top-most Game Object, or `false` to include all Game Objects in a hit test.
     *
     * @return {Phaser.Input.InputPlugin} This InputPlugin object.
     */
    public function setTopOnly(value:Bool):phaser.input.InputPlugin;
    /**
     * Given an array of Game Objects, sort the array and return it, so that the objects are in depth index order
     * with the lowest at the bottom.
     *
     * @method Phaser.Input.InputPlugin#sortGameObjects
     * @since 3.0.0
     *
     * @param {Phaser.GameObjects.GameObject[]} gameObjects - An array of Game Objects to be sorted.
     *
     * @return {Phaser.GameObjects.GameObject[]} The sorted array of Game Objects.
     */
    public function sortGameObjects(gameObjects:Array<phaser.gameobjects.GameObject>):Array<phaser.gameobjects.GameObject>;
    /**
     * Causes the Input Manager to stop emitting any events for the remainder of this game step.
     *
     * @method Phaser.Input.InputPlugin#stopPropagation
     * @since 3.0.0
     *
     * @return {Phaser.Input.InputPlugin} This InputPlugin object.
     */
    public function stopPropagation():phaser.input.InputPlugin;
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
     * @method Phaser.Input.InputPlugin#addUpCallback
     * @since 3.10.0
     *
     * @param {function} callback - The callback to be invoked on this DOM event.
     * @param {boolean} [isOnce=true] - `true` if the callback will only be invoked once, `false` to call every time this event happens.
     *
     * @return {this} The Input Plugin.
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
     * @method Phaser.Input.InputPlugin#addDownCallback
     * @since 3.10.0
     *
     * @param {function} callback - The callback to be invoked on this dom event.
     * @param {boolean} [isOnce=true] - `true` if the callback will only be invoked once, `false` to call every time this event happens.
     *
     * @return {this} The Input Plugin.
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
     * @method Phaser.Input.InputPlugin#addMoveCallback
     * @since 3.10.0
     *
     * @param {function} callback - The callback to be invoked on this dom event.
     * @param {boolean} [isOnce=false] - `true` if the callback will only be invoked once, `false` to call every time this event happens.
     *
     * @return {this} The Input Plugin.
     */
    public function addMoveCallback(callback:Dynamic, ?isOnce:Bool):Dynamic;
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
     * @method Phaser.Input.InputPlugin#addPointer
     * @since 3.10.0
     *
     * @param {integer} [quantity=1] The number of new Pointers to create. A maximum of 10 is allowed in total.
     *
     * @return {Phaser.Input.Pointer[]} An array containing all of the new Pointer objects that were created.
     */
    public function addPointer(?quantity:Int):Array<phaser.input.Pointer>;
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
     * @method Phaser.Input.InputPlugin#setDefaultCursor
     * @since 3.10.0
     *
     * @param {string} cursor - The CSS to be used when setting the default cursor.
     *
     * @return {Phaser.Input.InputPlugin} This Input instance.
     */
    public function setDefaultCursor(cursor:String):phaser.input.InputPlugin;
}
