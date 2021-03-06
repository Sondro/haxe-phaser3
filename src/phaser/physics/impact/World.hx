package phaser.physics.impact;

/**
 * @classdesc
 * [description]
 *
 * @class World
 * @extends Phaser.Events.EventEmitter
 * @memberof Phaser.Physics.Impact
 * @constructor
 * @since 3.0.0
 *
 * @param {Phaser.Scene} scene - [description]
 * @param {Phaser.Physics.Impact.WorldConfig} config - [description]
 */
@:native("Phaser.Physics.Impact.World")
extern class World extends phaser.events.EventEmitter {
    public function new(scene:phaser.Scene, config:phaser.physics.impact.WorldConfig);
    /**
     * [description]
     *
     * @name Phaser.Physics.Impact.World#scene
     * @type {Phaser.Scene}
     * @since 3.0.0
     */
    public var scene:phaser.Scene;
    /**
     * [description]
     *
     * @name Phaser.Physics.Impact.World#bodies
     * @type {Phaser.Structs.Set.<Phaser.Physics.Impact.Body>}
     * @since 3.0.0
     */
    public var bodies:Dynamic;
    /**
     * [description]
     *
     * @name Phaser.Physics.Impact.World#gravity
     * @type {number}
     * @default 0
     * @since 3.0.0
     */
    public var gravity:Float;
    /**
     * Spatial hash cell dimensions
     *
     * @name Phaser.Physics.Impact.World#cellSize
     * @type {integer}
     * @default 64
     * @since 3.0.0
     */
    public var cellSize:Int;
    /**
     * [description]
     *
     * @name Phaser.Physics.Impact.World#collisionMap
     * @type {Phaser.Physics.Impact.CollisionMap}
     * @since 3.0.0
     */
    public var collisionMap:phaser.physics.impact.CollisionMap;
    /**
     * [description]
     *
     * @name Phaser.Physics.Impact.World#timeScale
     * @type {number}
     * @default 1
     * @since 3.0.0
     */
    public var timeScale:Float;
    /**
     * Impacts maximum time step is 20 fps.
     *
     * @name Phaser.Physics.Impact.World#maxStep
     * @type {number}
     * @default 0.05
     * @since 3.0.0
     */
    public var maxStep:Float;
    /**
     * [description]
     *
     * @name Phaser.Physics.Impact.World#enabled
     * @type {boolean}
     * @default true
     * @since 3.0.0
     */
    public var enabled:Bool;
    /**
     * [description]
     *
     * @name Phaser.Physics.Impact.World#drawDebug
     * @type {boolean}
     * @since 3.0.0
     */
    public var drawDebug:Bool;
    /**
     * [description]
     *
     * @name Phaser.Physics.Impact.World#debugGraphic
     * @type {Phaser.GameObjects.Graphics}
     * @since 3.0.0
     */
    public var debugGraphic:phaser.gameobjects.Graphics;
    /**
     * [description]
     *
     * @name Phaser.Physics.Impact.World#defaults
     * @type {Phaser.Physics.Impact.WorldDefaults}
     * @since 3.0.0
     */
    public var defaults:phaser.physics.impact.WorldDefaults;
    /**
     * An object containing the 4 wall bodies that bound the physics world.
     *
     * @name Phaser.Physics.Impact.World#walls
     * @type {Phaser.Physics.Impact.WorldWalls}
     * @since 3.0.0
     */
    public var walls:phaser.physics.impact.WorldWalls;
    /**
     * [description]
     *
     * @name Phaser.Physics.Impact.World#delta
     * @type {number}
     * @default 0
     * @since 3.0.0
     */
    public var delta:Float;
    /**
     * Sets the collision map for the world either from a Weltmeister JSON level in the cache or from
     * a 2D array. If loading from a Weltmeister level, the map must have a layer called "collision".
     *
     * @method Phaser.Physics.Impact.World#setCollisionMap
     * @since 3.0.0
     *
     * @param {(string|integer[][])} key - Either a string key that corresponds to a Weltmeister level
     * in the cache, or a 2D array of collision IDs.
     * @param {integer} tileSize - The size of a tile. This is optional if loading from a Weltmeister
     * level in the cache.
     *
     * @return {?Phaser.Physics.Impact.CollisionMap} The newly created CollisionMap, or null if the method failed to
     * create the CollisionMap.
     */
    public function setCollisionMap(key:Dynamic, tileSize:Int):phaser.physics.impact.CollisionMap;
    /**
     * Sets the collision map for the world from a tilemap layer. Only tiles that are marked as
     * colliding will be used. You can specify the mapping from tiles to slope IDs in a couple of
     * ways. The easiest is to use Tiled and the slopeTileProperty option. Alternatively, you can
     * manually create a slopeMap that stores the mapping between tile indices and slope IDs.
     *
     * @method Phaser.Physics.Impact.World#setCollisionMapFromTilemapLayer
     * @since 3.0.0
     *
     * @param {(Phaser.Tilemaps.DynamicTilemapLayer|Phaser.Tilemaps.StaticTilemapLayer)} tilemapLayer - The tilemap layer to use.
     * @param {object} [options] - Options for controlling the mapping from tiles to slope IDs.
     * @param {string} [options.slopeTileProperty=null] - Slope IDs can be stored on tiles directly
     * using Tiled's tileset editor. If a tile has a property with the given slopeTileProperty string
     * name, the value of that property for the tile will be used for its slope mapping. E.g. a 45
     * degree slope upward could be given a "slope" property with a value of 2.
     * @param {object} [options.slopeMap=null] - A tile index to slope definition map.
     * @param {integer} [options.defaultCollidingSlope=null] - If specified, the default slope ID to
     * assign to a colliding tile. If not specified, the tile's index is used.
     * @param {integer} [options.defaultNonCollidingSlope=0] - The default slope ID to assign to a
     * non-colliding tile.
     *
     * @return {Phaser.Physics.Impact.CollisionMap} The newly created CollisionMap.
     */
    public function setCollisionMapFromTilemapLayer(tilemapLayer:Dynamic, ?options:Dynamic):phaser.physics.impact.CollisionMap;
    /**
     * Sets the bounds of the Physics world to match the given world pixel dimensions.
     * You can optionally set which 'walls' to create: left, right, top or bottom.
     * If none of the walls are given it will default to use the walls settings it had previously.
     * I.e. if you previously told it to not have the left or right walls, and you then adjust the world size
     * the newly created bounds will also not have the left and right walls.
     * Explicitly state them in the parameters to override this.
     *
     * @method Phaser.Physics.Impact.World#setBounds
     * @since 3.0.0
     *
     * @param {number} [x] - The x coordinate of the top-left corner of the bounds.
     * @param {number} [y] - The y coordinate of the top-left corner of the bounds.
     * @param {number} [width] - The width of the bounds.
     * @param {number} [height] - The height of the bounds.
     * @param {number} [thickness=64] - [description]
     * @param {boolean} [left=true] - If true will create the left bounds wall.
     * @param {boolean} [right=true] - If true will create the right bounds wall.
     * @param {boolean} [top=true] - If true will create the top bounds wall.
     * @param {boolean} [bottom=true] - If true will create the bottom bounds wall.
     *
     * @return {Phaser.Physics.Impact.World} This World object.
     */
    public function setBounds(?x:Float, ?y:Float, ?width:Float, ?height:Float, ?thickness:Float, ?left:Bool, ?right:Bool, ?top:Bool, ?bottom:Bool):phaser.physics.impact.World;
    /**
     * position = 'left', 'right', 'top' or 'bottom'
     *
     * @method Phaser.Physics.Impact.World#updateWall
     * @since 3.0.0
     *
     * @param {boolean} add - [description]
     * @param {string} position - [description]
     * @param {number} x - [description]
     * @param {number} y - [description]
     * @param {number} width - [description]
     * @param {number} height - [description]
     */
    public function updateWall(add:Bool, position:String, x:Float, y:Float, width:Float, height:Float):Void;
    /**
     * Creates a Graphics Game Object used for debug display and enables the world for debug drawing.
     *
     * @method Phaser.Physics.Impact.World#createDebugGraphic
     * @since 3.0.0
     *
     * @return {Phaser.GameObjects.Graphics} The Graphics object created that will have the debug visuals drawn to it.
     */
    public function createDebugGraphic():phaser.gameobjects.Graphics;
    /**
     * [description]
     *
     * @method Phaser.Physics.Impact.World#getNextID
     * @since 3.0.0
     *
     * @return {integer} [description]
     */
    public function getNextID():Int;
    /**
     * [description]
     *
     * @method Phaser.Physics.Impact.World#create
     * @since 3.0.0
     *
     * @param {number} x - [description]
     * @param {number} y - [description]
     * @param {number} sizeX - [description]
     * @param {number} sizeY - [description]
     *
     * @return {Phaser.Physics.Impact.Body} The Body that was added to this World.
     */
    public function create(x:Float, y:Float, sizeX:Float, sizeY:Float):phaser.physics.impact.Body;
    /**
     * [description]
     *
     * @method Phaser.Physics.Impact.World#remove
     * @since 3.0.0
     *
     * @param {Phaser.Physics.Impact.Body} object - The Body to remove from this World.
     */
    public function remove(object:phaser.physics.impact.Body):Void;
    /**
     * [description]
     *
     * @method Phaser.Physics.Impact.World#pause
     * @since 3.0.0
     *
     * @return {Phaser.Physics.Impact.World} This World object.
     */
    public function pause():phaser.physics.impact.World;
    /**
     * [description]
     *
     * @method Phaser.Physics.Impact.World#resume
     * @since 3.0.0
     *
     * @return {Phaser.Physics.Impact.World} This World object.
     */
    public function resume():phaser.physics.impact.World;
    /**
     * [description]
     *
     * @method Phaser.Physics.Impact.World#update
     * @since 3.0.0
     *
     * @param {number} time - The current time. Either a High Resolution Timer value if it comes from Request Animation Frame, or Date.now if using SetTimeout.
     * @param {number} delta - The delta time in ms since the last frame. This is a smoothed and capped value based on the FPS rate.
     */
    public function update(time:Float, delta:Float):Void;
    /**
     * Check the body against the spatial hash.
     *
     * @method Phaser.Physics.Impact.World#checkHash
     * @since 3.0.0
     *
     * @param {Phaser.Physics.Impact.Body} body - [description]
     * @param {object} hash - [description]
     * @param {number} size - [description]
     */
    public function checkHash(body:phaser.physics.impact.Body, hash:Dynamic, size:Float):Void;
    /**
     * [description]
     *
     * @method Phaser.Physics.Impact.World#checkBodies
     * @since 3.0.0
     *
     * @param {Phaser.Physics.Impact.Body} bodyA - [description]
     * @param {Phaser.Physics.Impact.Body} bodyB - [description]
     */
    public function checkBodies(bodyA:phaser.physics.impact.Body, bodyB:phaser.physics.impact.Body):Void;
    /**
     * [description]
     *
     * @method Phaser.Physics.Impact.World#setCollidesNever
     * @since 3.0.0
     *
     * @param {Phaser.Physics.Impact.Body[]} bodies - An Array of Impact Bodies to set the collides value on.
     *
     * @return {Phaser.Physics.Impact.World} This World object.
     */
    public function setCollidesNever(bodies:Array<phaser.physics.impact.Body>):phaser.physics.impact.World;
    /**
     * [description]
     *
     * @method Phaser.Physics.Impact.World#setLite
     * @since 3.0.0
     *
     * @param {Phaser.Physics.Impact.Body[]} bodies - An Array of Impact Bodies to set the collides value on.
     *
     * @return {Phaser.Physics.Impact.World} This World object.
     */
    public function setLite(bodies:Array<phaser.physics.impact.Body>):phaser.physics.impact.World;
    /**
     * [description]
     *
     * @method Phaser.Physics.Impact.World#setPassive
     * @since 3.0.0
     *
     * @param {Phaser.Physics.Impact.Body[]} bodies - An Array of Impact Bodies to set the collides value on.
     *
     * @return {Phaser.Physics.Impact.World} This World object.
     */
    public function setPassive(bodies:Array<phaser.physics.impact.Body>):phaser.physics.impact.World;
    /**
     * [description]
     *
     * @method Phaser.Physics.Impact.World#setActive
     * @since 3.0.0
     *
     * @param {Phaser.Physics.Impact.Body[]} bodies - An Array of Impact Bodies to set the collides value on.
     *
     * @return {Phaser.Physics.Impact.World} This World object.
     */
    public function setActive(bodies:Array<phaser.physics.impact.Body>):phaser.physics.impact.World;
    /**
     * [description]
     *
     * @method Phaser.Physics.Impact.World#setFixed
     * @since 3.0.0
     *
     * @param {Phaser.Physics.Impact.Body[]} bodies - An Array of Impact Bodies to set the collides value on.
     *
     * @return {Phaser.Physics.Impact.World} This World object.
     */
    public function setFixed(bodies:Array<phaser.physics.impact.Body>):phaser.physics.impact.World;
    /**
     * [description]
     *
     * @method Phaser.Physics.Impact.World#setTypeNone
     * @since 3.0.0
     *
     * @param {Phaser.Physics.Impact.Body[]} bodies - An Array of Impact Bodies to set the type value on.
     *
     * @return {Phaser.Physics.Impact.World} This World object.
     */
    public function setTypeNone(bodies:Array<phaser.physics.impact.Body>):phaser.physics.impact.World;
    /**
     * [description]
     *
     * @method Phaser.Physics.Impact.World#setTypeA
     * @since 3.0.0
     *
     * @param {Phaser.Physics.Impact.Body[]} bodies - An Array of Impact Bodies to set the type value on.
     *
     * @return {Phaser.Physics.Impact.World} This World object.
     */
    public function setTypeA(bodies:Array<phaser.physics.impact.Body>):phaser.physics.impact.World;
    /**
     * [description]
     *
     * @method Phaser.Physics.Impact.World#setTypeB
     * @since 3.0.0
     *
     * @param {Phaser.Physics.Impact.Body[]} bodies - An Array of Impact Bodies to set the type value on.
     *
     * @return {Phaser.Physics.Impact.World} This World object.
     */
    public function setTypeB(bodies:Array<phaser.physics.impact.Body>):phaser.physics.impact.World;
    /**
     * [description]
     *
     * @method Phaser.Physics.Impact.World#setAvsB
     * @since 3.0.0
     *
     * @param {Phaser.Physics.Impact.Body[]} bodies - An Array of Impact Bodies to set the type value on.
     *
     * @return {Phaser.Physics.Impact.World} This World object.
     */
    public function setAvsB(bodies:Array<phaser.physics.impact.Body>):phaser.physics.impact.World;
    /**
     * [description]
     *
     * @method Phaser.Physics.Impact.World#setBvsA
     * @since 3.0.0
     *
     * @param {Phaser.Physics.Impact.Body[]} bodies - An Array of Impact Bodies to set the type value on.
     *
     * @return {Phaser.Physics.Impact.World} This World object.
     */
    public function setBvsA(bodies:Array<phaser.physics.impact.Body>):phaser.physics.impact.World;
    /**
     * [description]
     *
     * @method Phaser.Physics.Impact.World#setCheckAgainstNone
     * @since 3.0.0
     *
     * @param {Phaser.Physics.Impact.Body[]} bodies - An Array of Impact Bodies to set the type value on.
     *
     * @return {Phaser.Physics.Impact.World} This World object.
     */
    public function setCheckAgainstNone(bodies:Array<phaser.physics.impact.Body>):phaser.physics.impact.World;
    /**
     * [description]
     *
     * @method Phaser.Physics.Impact.World#setCheckAgainstA
     * @since 3.0.0
     *
     * @param {Phaser.Physics.Impact.Body[]} bodies - An Array of Impact Bodies to set the type value on.
     *
     * @return {Phaser.Physics.Impact.World} This World object.
     */
    public function setCheckAgainstA(bodies:Array<phaser.physics.impact.Body>):phaser.physics.impact.World;
    /**
     * [description]
     *
     * @method Phaser.Physics.Impact.World#setCheckAgainstB
     * @since 3.0.0
     *
     * @param {Phaser.Physics.Impact.Body[]} bodies - An Array of Impact Bodies to set the type value on.
     *
     * @return {Phaser.Physics.Impact.World} This World object.
     */
    public function setCheckAgainstB(bodies:Array<phaser.physics.impact.Body>):phaser.physics.impact.World;
}
