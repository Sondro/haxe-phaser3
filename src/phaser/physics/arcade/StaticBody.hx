package phaser.physics.arcade;

/**
 * @classdesc
 * A Static Arcade Physics Body.
 *
 * A Static Body never moves, and isn't automatically synchronized with its parent Game Object.
 * That means if you make any change to the parent's origin, position, or scale after creating or adding the body, you'll need to update the Body manually.
 *
 * A Static Body can collide with other Bodies, but is never moved by collisions.
 *
 * Its dynamic counterpart is {@link Phaser.Physics.Arcade.Body}.
 *
 * @class StaticBody
 * @memberof Phaser.Physics.Arcade
 * @constructor
 * @since 3.0.0
 *
 * @param {Phaser.Physics.Arcade.World} world - [description]
 * @param {Phaser.GameObjects.GameObject} gameObject - [description]
 */
@:native("Phaser.Physics.Arcade.StaticBody")
extern class StaticBody {
    public function new(world:phaser.physics.arcade.World, gameObject:phaser.gameobjects.GameObject);
    /**
     * [description]
     *
     * @name Phaser.Physics.Arcade.StaticBody#world
     * @type {Phaser.Physics.Arcade.World}
     * @since 3.0.0
     */
    public var world:phaser.physics.arcade.World;
    /**
     * [description]
     *
     * @name Phaser.Physics.Arcade.StaticBody#gameObject
     * @type {Phaser.GameObjects.GameObject}
     * @since 3.0.0
     */
    public var gameObject:phaser.gameobjects.GameObject;
    /**
     * [description]
     *
     * @name Phaser.Physics.Arcade.StaticBody#debugShowBody
     * @type {boolean}
     * @since 3.0.0
     */
    public var debugShowBody:Bool;
    /**
     * [description]
     *
     * @name Phaser.Physics.Arcade.StaticBody#debugBodyColor
     * @type {integer}
     * @since 3.0.0
     */
    public var debugBodyColor:Int;
    /**
     * [description]
     *
     * @name Phaser.Physics.Arcade.StaticBody#enable
     * @type {boolean}
     * @default true
     * @since 3.0.0
     */
    public var enable:Bool;
    /**
     * [description]
     *
     * @name Phaser.Physics.Arcade.StaticBody#isCircle
     * @type {boolean}
     * @default false
     * @since 3.0.0
     */
    public var isCircle:Bool;
    /**
     * [description]
     *
     * @name Phaser.Physics.Arcade.StaticBody#radius
     * @type {number}
     * @default 0
     * @since 3.0.0
     */
    public var radius:Float;
    /**
     * [description]
     *
     * @name Phaser.Physics.Arcade.StaticBody#offset
     * @type {Phaser.Math.Vector2}
     * @since 3.0.0
     */
    public var offset:phaser.math.Vector2;
    /**
     * [description]
     *
     * @name Phaser.Physics.Arcade.StaticBody#position
     * @type {Phaser.Math.Vector2}
     * @since 3.0.0
     */
    public var position:phaser.math.Vector2;
    /**
     * [description]
     *
     * @name Phaser.Physics.Arcade.StaticBody#width
     * @type {number}
     * @since 3.0.0
     */
    public var width:Float;
    /**
     * [description]
     *
     * @name Phaser.Physics.Arcade.StaticBody#height
     * @type {number}
     * @since 3.0.0
     */
    public var height:Float;
    /**
     * [description]
     *
     * @name Phaser.Physics.Arcade.StaticBody#halfWidth
     * @type {number}
     * @since 3.0.0
     */
    public var halfWidth:Float;
    /**
     * [description]
     *
     * @name Phaser.Physics.Arcade.StaticBody#halfHeight
     * @type {number}
     * @since 3.0.0
     */
    public var halfHeight:Float;
    /**
     * [description]
     *
     * @name Phaser.Physics.Arcade.StaticBody#center
     * @type {Phaser.Math.Vector2}
     * @since 3.0.0
     */
    public var center:phaser.math.Vector2;
    /**
     * [description]
     *
     * @name Phaser.Physics.Arcade.StaticBody#velocity
     * @type {Phaser.Math.Vector2}
     * @readonly
     * @since 3.0.0
     */
    public var velocity:phaser.math.Vector2;
    /**
     * [description]
     *
     * @name Phaser.Physics.Arcade.StaticBody#allowGravity
     * @type {boolean}
     * @readonly
     * @default false
     * @since 3.0.0
     */
    public var allowGravity:Bool;
    /**
     * Gravitational force applied specifically to this Body. Values are in pixels per second squared. Always zero for a Static Body.
     *
     * @name Phaser.Physics.Arcade.StaticBody#gravity
     * @type {Phaser.Math.Vector2}
     * @readonly
     * @since 3.0.0
     */
    public var gravity:phaser.math.Vector2;
    /**
     * Rebound, or restitution, following a collision, relative to 1. Always zero for a Static Body.
     *
     * @name Phaser.Physics.Arcade.StaticBody#bounce
     * @type {Phaser.Math.Vector2}
     * @readonly
     * @since 3.0.0
     */
    public var bounce:phaser.math.Vector2;
    /**
     * Whether the simulation emits a `worldbounds` event when this StaticBody collides with the world boundary (and `collideWorldBounds` is also true).
     *
     * @name Phaser.Physics.Arcade.StaticBody#onWorldBounds
     * @type {boolean}
     * @default false
     * @since 3.0.0
     */
    public var onWorldBounds:Bool;
    /**
     * Whether the simulation emits a `collide` event when this StaticBody collides with another.
     *
     * @name Phaser.Physics.Arcade.StaticBody#onCollide
     * @type {boolean}
     * @default false
     * @since 3.0.0
     */
    public var onCollide:Bool;
    /**
     * Whether the simulation emits an `overlap` event when this StaticBody overlaps with another.
     *
     * @name Phaser.Physics.Arcade.StaticBody#onOverlap
     * @type {boolean}
     * @default false
     * @since 3.0.0
     */
    public var onOverlap:Bool;
    /**
     * The StaticBody's inertia, relative to a default unit (1). With `bounce`, this affects the exchange of momentum (velocities) during collisions.
     *
     * @name Phaser.Physics.Arcade.StaticBody#mass
     * @type {number}
     * @default 1
     * @since 3.0.0
     */
    public var mass:Float;
    /**
     * Whether this object can be moved by collisions with another body.
     *
     * @name Phaser.Physics.Arcade.StaticBody#immovable
     * @type {boolean}
     * @default true
     * @since 3.0.0
     */
    public var immovable:Bool;
    /**
     * A flag disabling the default horizontal separation of colliding bodies. Pass your own `processHandler` to the collider.
     *
     * @name Phaser.Physics.Arcade.StaticBody#customSeparateX
     * @type {boolean}
     * @default false
     * @since 3.0.0
     */
    public var customSeparateX:Bool;
    /**
     * A flag disabling the default vertical separation of colliding bodies. Pass your own `processHandler` to the collider.
     *
     * @name Phaser.Physics.Arcade.StaticBody#customSeparateY
     * @type {boolean}
     * @default false
     * @since 3.0.0
     */
    public var customSeparateY:Bool;
    /**
     * The amount of horizontal overlap (before separation), if this Body is colliding with another.
     *
     * @name Phaser.Physics.Arcade.StaticBody#overlapX
     * @type {number}
     * @default 0
     * @since 3.0.0
     */
    public var overlapX:Float;
    /**
     * The amount of vertical overlap (before separation), if this Body is colliding with another.
     *
     * @name Phaser.Physics.Arcade.StaticBody#overlapY
     * @type {number}
     * @default 0
     * @since 3.0.0
     */
    public var overlapY:Float;
    /**
     * The amount of overlap (before separation), if this StaticBody is circular and colliding with another circular body.
     *
     * @name Phaser.Physics.Arcade.StaticBody#overlapR
     * @type {number}
     * @default 0
     * @since 3.0.0
     */
    public var overlapR:Float;
    /**
     * Whether this StaticBody is overlapped with another and both have zero velocity.
     *
     * @name Phaser.Physics.Arcade.StaticBody#embedded
     * @type {boolean}
     * @default false
     * @since 3.0.0
     */
    public var embedded:Bool;
    /**
     * Whether this StaticBody interacts with the world boundary.
     *
     * @name Phaser.Physics.Arcade.StaticBody#collideWorldBounds
     * @type {boolean}
     * @default false
     * @since 3.0.0
     */
    public var collideWorldBounds:Bool;
    /**
     * Whether this StaticBody is checked for collisions and for which directions. You can set `checkCollision.none = false` to disable collision checks.
     *
     * @name Phaser.Physics.Arcade.StaticBody#checkCollision
     * @type {ArcadeBodyCollision}
     * @since 3.0.0
     */
    public var checkCollision:ArcadeBodyCollision;
    /**
     * Whether this StaticBody is colliding with another and in which direction.
     *
     * @name Phaser.Physics.Arcade.StaticBody#touching
     * @type {ArcadeBodyCollision}
     * @since 3.0.0
     */
    public var touching:ArcadeBodyCollision;
    /**
     * Whether this StaticBody was colliding with another during the last step, and in which direction.
     *
     * @name Phaser.Physics.Arcade.StaticBody#wasTouching
     * @type {ArcadeBodyCollision}
     * @since 3.0.0
     */
    public var wasTouching:ArcadeBodyCollision;
    /**
     * Whether this StaticBody is colliding with a tile or the world boundary.
     *
     * @name Phaser.Physics.Arcade.StaticBody#blocked
     * @type {ArcadeBodyCollision}
     * @since 3.0.0
     */
    public var blocked:ArcadeBodyCollision;
    /**
     * The StaticBody's physics type (static by default).
     *
     * @name Phaser.Physics.Arcade.StaticBody#physicsType
     * @type {integer}
     * @since 3.0.0
     */
    public var physicsType:Int;
    /**
     * The x coordinate of the StaticBody.
     *
     * @name Phaser.Physics.Arcade.StaticBody#x
     * @type {number}
     * @since 3.0.0
     */
    public var x:Float;
    /**
     * The y coordinate of the StaticBody.
     *
     * @name Phaser.Physics.Arcade.StaticBody#y
     * @type {number}
     * @since 3.0.0
     */
    public var y:Float;
    /**
     * Returns the left-most x coordinate of the area of the StaticBody.
     *
     * @name Phaser.Physics.Arcade.StaticBody#left
     * @type {number}
     * @readonly
     * @since 3.0.0
     */
    public var left:Float;
    /**
     * The right-most x coordinate of the area of the StaticBody.
     *
     * @name Phaser.Physics.Arcade.StaticBody#right
     * @type {number}
     * @readonly
     * @since 3.0.0
     */
    public var right:Float;
    /**
     * The highest y coordinate of the area of the StaticBody.
     *
     * @name Phaser.Physics.Arcade.StaticBody#top
     * @type {number}
     * @readonly
     * @since 3.0.0
     */
    public var top:Float;
    /**
     * The lowest y coordinate of the area of the StaticBody. (y + height)
     *
     * @name Phaser.Physics.Arcade.StaticBody#bottom
     * @type {number}
     * @readonly
     * @since 3.0.0
     */
    public var bottom:Float;
    /**
     * Changes the Game Object this Body is bound to.
     * First it removes its reference from the old Game Object, then sets the new one.
     * You can optionally update the position and dimensions of this Body to reflect that of the new Game Object.
     *
     * @method Phaser.Physics.Arcade.StaticBody#setGameObject
     * @since 3.1.0
     *
     * @param {Phaser.GameObjects.GameObject} gameObject - The new Game Object that will own this Body.
     * @param {boolean} [update=true] - Reposition and resize this Body to match the new Game Object?
     *
     * @return {Phaser.Physics.Arcade.StaticBody} This Static Body object.
     *
     * @see Phaser.Physics.Arcade.StaticBody#updateFromGameObject
     */
    public function setGameObject(gameObject:phaser.gameobjects.GameObject, ?update:Bool):phaser.physics.arcade.StaticBody;
    /**
     * Updates this Static Body so that its position and dimensions are updated
     * based on the current Game Object it is bound to.
     *
     * @method Phaser.Physics.Arcade.StaticBody#updateFromGameObject
     * @since 3.1.0
     *
     * @return {Phaser.Physics.Arcade.StaticBody} This Static Body object.
     */
    public function updateFromGameObject():phaser.physics.arcade.StaticBody;
    /**
     * Sets the offset of the body.
     *
     * @method Phaser.Physics.Arcade.StaticBody#setOffset
     * @since 3.4.0
     *
     * @param {number} x - The horizontal offset of the Body from the Game Object's center.
     * @param {number} y - The vertical offset of the Body from the Game Object's center.
     *
     * @return {Phaser.Physics.Arcade.StaticBody} This Static Body object.
     */
    public function setOffset(x:Float, y:Float):phaser.physics.arcade.StaticBody;
    /**
     * Sets the size of the body.
     * Resets the width and height to match current frame, if no width and height provided and a frame is found.
     *
     * @method Phaser.Physics.Arcade.StaticBody#setSize
     * @since 3.0.0
     *
     * @param {integer} [width] - The width of the Body in pixels. Cannot be zero. If not given, and the parent Game Object has a frame, it will use the frame width.
     * @param {integer} [height] - The height of the Body in pixels. Cannot be zero. If not given, and the parent Game Object has a frame, it will use the frame height.
     * @param {number} [offsetX] - The horizontal offset of the Body from the Game Object's center.
     * @param {number} [offsetY] - The vertical offset of the Body from the Game Object's center.
     *
     * @return {Phaser.Physics.Arcade.StaticBody} This Static Body object.
     */
    public function setSize(?width:Int, ?height:Int, ?offsetX:Float, ?offsetY:Float):phaser.physics.arcade.StaticBody;
    /**
     * Sets this Static Body to have a circular body and sets its sizes and position.
     *
     * @method Phaser.Physics.Arcade.StaticBody#setCircle
     * @since 3.0.0
     *
     * @param {number} radius - The radius of the StaticBody, in pixels.
     * @param {number} [offsetX] - The horizontal offset of the StaticBody from its Game Object, in pixels.
     * @param {number} [offsetY] - The vertical offset of the StaticBody from its Game Object, in pixels.
     *
     * @return {Phaser.Physics.Arcade.StaticBody} This Static Body object.
     */
    public function setCircle(radius:Float, ?offsetX:Float, ?offsetY:Float):phaser.physics.arcade.StaticBody;
    /**
     * Updates the StaticBody's `center` from its `position` and dimensions.
     *
     * @method Phaser.Physics.Arcade.StaticBody#updateCenter
     * @since 3.0.0
     */
    public function updateCenter():Void;
    /**
     * Updates this Static Body's position based on the current Game Object it is bound to.
     * Similar to `updateFromGameObject`, but doesn't modify the Body's dimensions.
     *
     * @method Phaser.Physics.Arcade.StaticBody#reset
     * @since 3.0.0
     *
     * @param {number} x - The x coordinate to reset the body to.
     * @param {number} y - The y coordinate to reset the body to.
     */
    public function reset(x:Float, y:Float):Void;
    /**
     * NOOP function. A Static Body cannot be stopped.
     *
     * @method Phaser.Physics.Arcade.StaticBody#stop
     * @since 3.0.0
     *
     * @return {Phaser.Physics.Arcade.StaticBody} This Static Body object.
     */
    public function stop():phaser.physics.arcade.StaticBody;
    /**
     * Returns the x and y coordinates of the top left and bottom right points of the StaticBody.
     *
     * @method Phaser.Physics.Arcade.StaticBody#getBounds
     * @since 3.0.0
     *
     * @param {ArcadeBodyBounds} obj - The object which will hold the coordinates of the bounds.
     *
     * @return {ArcadeBodyBounds} The same object that was passed with `x`, `y`, `right` and `bottom` values matching the respective values of the StaticBody.
     */
    public function getBounds(obj:ArcadeBodyBounds):ArcadeBodyBounds;
    /**
     * Checks to see if a given x,y coordinate is colliding with this Static Body.
     *
     * @method Phaser.Physics.Arcade.StaticBody#hitTest
     * @since 3.0.0
     *
     * @param {number} x - The x coordinate to check against this body.
     * @param {number} y - The y coordinate to check against this body.
     *
     * @return {boolean} `true` if the given coordinate lies within this body, otherwise `false`.
     */
    public function hitTest(x:Float, y:Float):Bool;
    /**
     * NOOP
     *
     * @method Phaser.Physics.Arcade.StaticBody#postUpdate
     * @since 3.12.0
     */
    public function postUpdate():Void;
    /**
     * The absolute (non-negative) change in this StaticBody's horizontal position from the previous step. Always zero.
     *
     * @method Phaser.Physics.Arcade.StaticBody#deltaAbsX
     * @since 3.0.0
     *
     * @return {number} Always zero for a Static Body.
     */
    public function deltaAbsX():Float;
    /**
     * The absolute (non-negative) change in this StaticBody's vertical position from the previous step. Always zero.
     *
     * @method Phaser.Physics.Arcade.StaticBody#deltaAbsY
     * @since 3.0.0
     *
     * @return {number} Always zero for a Static Body.
     */
    public function deltaAbsY():Float;
    /**
     * The change in this StaticBody's horizontal position from the previous step. Always zero.
     *
     * @method Phaser.Physics.Arcade.StaticBody#deltaX
     * @since 3.0.0
     *
     * @return {number} Always zero for a Static Body.
     */
    public function deltaX():Float;
    /**
     * The change in this StaticBody's vertical position from the previous step. Always zero.
     *
     * @method Phaser.Physics.Arcade.StaticBody#deltaY
     * @since 3.0.0
     *
     * @return {number} 0
     */
    public function deltaY():Float;
    /**
     * [description]
     *
     * @method Phaser.Physics.Arcade.StaticBody#deltaZ
     * @since 3.0.0
     *
     * @return {number} 0
     */
    public function deltaZ():Float;
    /**
     * Disables this Body and marks it for destruction during the next step.
     *
     * @method Phaser.Physics.Arcade.StaticBody#destroy
     * @since 3.0.0
     */
    public function destroy():Void;
    /**
     * Draws a graphical representation of the StaticBody for visual debugging purposes.
     *
     * @method Phaser.Physics.Arcade.StaticBody#drawDebug
     * @since 3.0.0
     *
     * @param {Phaser.GameObjects.Graphics} graphic - The Graphics object to use for the debug drawing of the StaticBody.
     */
    public function drawDebug(graphic:phaser.gameobjects.Graphics):Void;
    /**
     * Indicates whether the StaticBody is going to be showing a debug visualization during postUpdate.
     *
     * @method Phaser.Physics.Arcade.StaticBody#willDrawDebug
     * @since 3.0.0
     *
     * @return {boolean} Whether or not the StaticBody is going to show the debug visualization during postUpdate.
     */
    public function willDrawDebug():Bool;
    /**
     * Sets the Mass of the StaticBody. Will set the Mass to 0.1 if the value passed is less than or equal to zero.
     *
     * @method Phaser.Physics.Arcade.StaticBody#setMass
     * @since 3.0.0
     *
     * @param {number} value - The value to set the Mass to. Values of zero or less are changed to 0.1.
     *
     * @return {Phaser.Physics.Arcade.StaticBody} This Static Body object.
     */
    public function setMass(value:Float):phaser.physics.arcade.StaticBody;
}
