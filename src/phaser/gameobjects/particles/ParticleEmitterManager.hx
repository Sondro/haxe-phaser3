package phaser.gameobjects.particles;

/**
 * @classdesc
 * A Particle Emitter Manager creates and controls {@link Phaser.GameObjects.Particles.ParticleEmitter Particle Emitters} and {@link Phaser.GameObjects.Particles.GravityWell Gravity Wells}.
 *
 * @class ParticleEmitterManager
 * @extends Phaser.GameObjects.GameObject
 * @memberof Phaser.GameObjects.Particles
 * @constructor
 * @since 3.0.0
 *
 * @extends Phaser.GameObjects.Components.Depth
 * @extends Phaser.GameObjects.Components.Pipeline
 * @extends Phaser.GameObjects.Components.Transform
 * @extends Phaser.GameObjects.Components.Visible
 *
 * @param {Phaser.Scene} scene - The Scene to which this Emitter Manager belongs.
 * @param {string} texture - The key of the Texture this Emitter Manager will use to render particles, as stored in the Texture Manager.
 * @param {(string|integer)} [frame] - An optional frame from the Texture this Emitter Manager will use to render particles.
 * @param {ParticleEmitterConfig|ParticleEmitterConfig[]} [emitters] - Configuration settings for one or more emitters to create.
 */
@:native("Phaser.GameObjects.Particles.ParticleEmitterManager")
extern class ParticleEmitterManager extends phaser.gameobjects.GameObject {
    public function new(scene:phaser.Scene, texture:String, ?frame:Dynamic, ?emitters:Dynamic);
    /**
     * The time scale applied to all emitters and particles, affecting flow rate, lifespan, and movement.
     * Values larger than 1 are faster than normal.
     * This is multiplied with any timeScale set on each individual emitter.
     *
     * @name Phaser.GameObjects.Particles.ParticleEmitterManager#timeScale
     * @type {number}
     * @default 1
     * @since 3.0.0
     */
    public var timeScale:Float;
    /**
     * The texture used to render this Emitter Manager's particles.
     *
     * @name Phaser.GameObjects.Particles.ParticleEmitterManager#texture
     * @type {Phaser.Textures.Texture}
     * @default null
     * @since 3.0.0
     */
    public var texture:phaser.textures.Texture;
    /**
     * The texture frame used to render this Emitter Manager's particles.
     *
     * @name Phaser.GameObjects.Particles.ParticleEmitterManager#frame
     * @type {Phaser.Textures.Frame}
     * @default null
     * @since 3.0.0
     */
    public var frame:phaser.textures.Frame;
    /**
     * Names of this Emitter Manager's texture frames.
     *
     * @name Phaser.GameObjects.Particles.ParticleEmitterManager#frameNames
     * @type {string[]}
     * @since 3.0.0
     */
    public var frameNames:Array<String>;
    /**
     * A list of Emitters being managed by this Emitter Manager.
     *
     * @name Phaser.GameObjects.Particles.ParticleEmitterManager#emitters
     * @type {Phaser.Structs.List.<Phaser.GameObjects.Particles.ParticleEmitter>}
     * @since 3.0.0
     */
    public var emitters:Dynamic;
    /**
     * A list of Gravity Wells being managed by this Emitter Manager.
     *
     * @name Phaser.GameObjects.Particles.ParticleEmitterManager#wells
     * @type {Phaser.Structs.List.<Phaser.GameObjects.Particles.GravityWell>}
     * @since 3.0.0
     */
    public var wells:Dynamic;
    /**
     * Sets the texture and frame this Emitter Manager will use to render with.
     *
     * Textures are referenced by their string-based keys, as stored in the Texture Manager.
     *
     * @method Phaser.GameObjects.Particles.ParticleEmitterManager#setTexture
     * @since 3.0.0
     *
     * @param {string} key - The key of the texture to be used, as stored in the Texture Manager.
     * @param {(string|integer)} [frame] - The name or index of the frame within the Texture.
     *
     * @return {Phaser.GameObjects.Particles.ParticleEmitterManager} This Emitter Manager.
     */
    public function setTexture(key:String, ?frame:Dynamic):phaser.gameobjects.particles.ParticleEmitterManager;
    /**
     * Sets the frame this Emitter Manager will use to render with.
     *
     * The Frame has to belong to the current Texture being used.
     *
     * It can be either a string or an index.
     *
     * @method Phaser.GameObjects.Particles.ParticleEmitterManager#setFrame
     * @since 3.0.0
     *
     * @param {(string|integer)} [frame] - The name or index of the frame within the Texture.
     *
     * @return {Phaser.GameObjects.Particles.ParticleEmitterManager} This Emitter Manager.
     */
    public function setFrame(?frame:Dynamic):phaser.gameobjects.particles.ParticleEmitterManager;
    /**
     * Assigns texture frames to an emitter.
     *
     * @method Phaser.GameObjects.Particles.ParticleEmitterManager#setEmitterFrames
     * @since 3.0.0
     *
     * @param {(Phaser.Textures.Frame|Phaser.Textures.Frame[])} frames - The texture frames.
     * @param {Phaser.GameObjects.Particles.ParticleEmitter} emitter - The particle emitter to modify.
     *
     * @return {Phaser.GameObjects.Particles.ParticleEmitterManager} This Emitter Manager.
     */
    public function setEmitterFrames(frames:Dynamic, emitter:phaser.gameobjects.particles.ParticleEmitter):phaser.gameobjects.particles.ParticleEmitterManager;
    /**
     * Adds an existing Particle Emitter to this Emitter Manager.
     *
     * @method Phaser.GameObjects.Particles.ParticleEmitterManager#addEmitter
     * @since 3.0.0
     *
     * @param {Phaser.GameObjects.Particles.ParticleEmitter} emitter - The Particle Emitter to add to this Emitter Manager.
     *
     * @return {Phaser.GameObjects.Particles.ParticleEmitter} The Particle Emitter that was added to this Emitter Manager.
     */
    public function addEmitter(emitter:phaser.gameobjects.particles.ParticleEmitter):phaser.gameobjects.particles.ParticleEmitter;
    /**
     * Creates a new Particle Emitter object, adds it to this Emitter Manager and returns a reference to it.
     *
     * @method Phaser.GameObjects.Particles.ParticleEmitterManager#createEmitter
     * @since 3.0.0
     *
     * @param {ParticleEmitterConfig} config - Configuration settings for the Particle Emitter to create.
     *
     * @return {Phaser.GameObjects.Particles.ParticleEmitter} The Particle Emitter that was created.
     */
    public function createEmitter(config:ParticleEmitterConfig):phaser.gameobjects.particles.ParticleEmitter;
    /**
     * Adds an existing Gravity Well object to this Emitter Manager.
     *
     * @method Phaser.GameObjects.Particles.ParticleEmitterManager#addGravityWell
     * @since 3.0.0
     *
     * @param {Phaser.GameObjects.Particles.GravityWell} well - The Gravity Well to add to this Emitter Manager.
     *
     * @return {Phaser.GameObjects.Particles.GravityWell} The Gravity Well that was added to this Emitter Manager.
     */
    public function addGravityWell(well:phaser.gameobjects.particles.GravityWell):phaser.gameobjects.particles.GravityWell;
    /**
     * Creates a new Gravity Well, adds it to this Emitter Manager and returns a reference to it.
     *
     * @method Phaser.GameObjects.Particles.ParticleEmitterManager#createGravityWell
     * @since 3.0.0
     *
     * @param {GravityWellConfig} config - Configuration settings for the Gravity Well to create.
     *
     * @return {Phaser.GameObjects.Particles.GravityWell} The Gravity Well that was created.
     */
    public function createGravityWell(config:GravityWellConfig):phaser.gameobjects.particles.GravityWell;
    /**
     * Emits particles from each active emitter.
     *
     * @method Phaser.GameObjects.Particles.ParticleEmitterManager#emitParticle
     * @since 3.0.0
     *
     * @param {integer} [count] - The number of particles to release from each emitter. The default is the emitter's own {@link Phaser.GameObjects.Particles.ParticleEmitter#quantity}.
     * @param {number} [x] - The x-coordinate to to emit particles from. The default is the x-coordinate of the emitter's current location.
     * @param {number} [y] - The y-coordinate to to emit particles from. The default is the y-coordinate of the emitter's current location.
     *
     * @return {Phaser.GameObjects.Particles.ParticleEmitterManager} This Emitter Manager.
     */
    public function emitParticle(?count:Int, ?x:Float, ?y:Float):phaser.gameobjects.particles.ParticleEmitterManager;
    /**
     * Emits particles from each active emitter.
     *
     * @method Phaser.GameObjects.Particles.ParticleEmitterManager#emitParticleAt
     * @since 3.0.0
     *
     * @param {number} [x] - The x-coordinate to to emit particles from. The default is the x-coordinate of the emitter's current location.
     * @param {number} [y] - The y-coordinate to to emit particles from. The default is the y-coordinate of the emitter's current location.
     * @param {integer} [count] - The number of particles to release from each emitter. The default is the emitter's own {@link Phaser.GameObjects.Particles.ParticleEmitter#quantity}.
     *
     * @return {Phaser.GameObjects.Particles.ParticleEmitterManager} This Emitter Manager.
     */
    public function emitParticleAt(?x:Float, ?y:Float, ?count:Int):phaser.gameobjects.particles.ParticleEmitterManager;
    /**
     * Pauses this Emitter Manager.
     *
     * This has the effect of pausing all emitters, and all particles of those emitters, currently under its control.
     *
     * The particles will still render, but they will not have any of their logic updated.
     *
     * @method Phaser.GameObjects.Particles.ParticleEmitterManager#pause
     * @since 3.0.0
     *
     * @return {Phaser.GameObjects.Particles.ParticleEmitterManager} This Emitter Manager.
     */
    public function pause():phaser.gameobjects.particles.ParticleEmitterManager;
    /**
     * Resumes this Emitter Manager, should it have been previously paused.
     *
     * @method Phaser.GameObjects.Particles.ParticleEmitterManager#resume
     * @since 3.0.0
     *
     * @return {Phaser.GameObjects.Particles.ParticleEmitterManager} This Emitter Manager.
     */
    public function resume():phaser.gameobjects.particles.ParticleEmitterManager;
    /**
     * Gets all active particle processors (gravity wells).
     *
     * @method Phaser.GameObjects.Particles.ParticleEmitterManager#getProcessors
     * @since 3.0.0
     *
     * @return {Phaser.GameObjects.Particles.GravityWell[]} - The active gravity wells.
     */
    public function getProcessors():Array<phaser.gameobjects.particles.GravityWell>;
    /**
     * Updates all active emitters.
     *
     * @method Phaser.GameObjects.Particles.ParticleEmitterManager#preUpdate
     * @since 3.0.0
     *
     * @param {integer} time - The current timestamp as generated by the Request Animation Frame or SetTimeout.
     * @param {number} delta - The delta time, in ms, elapsed since the last frame.
     */
    public function preUpdate(time:Int, delta:Float):Void;
    /**
     * The depth of this Game Object within the Scene.
     *
     * The depth is also known as the 'z-index' in some environments, and allows you to change the rendering order
     * of Game Objects, without actually moving their position in the display list.
     *
     * The depth starts from zero (the default value) and increases from that point. A Game Object with a higher depth
     * value will always render in front of one with a lower value.
     *
     * Setting the depth will queue a depth sort event within the Scene.
     *
     * @name Phaser.GameObjects.Components.Depth#depth
     * @type {number}
     * @since 3.0.0
     */
    public var depth:Float;
    /**
     * The depth of this Game Object within the Scene.
     *
     * The depth is also known as the 'z-index' in some environments, and allows you to change the rendering order
     * of Game Objects, without actually moving their position in the display list.
     *
     * The depth starts from zero (the default value) and increases from that point. A Game Object with a higher depth
     * value will always render in front of one with a lower value.
     *
     * Setting the depth will queue a depth sort event within the Scene.
     *
     * @method Phaser.GameObjects.Components.Depth#setDepth
     * @since 3.0.0
     *
     * @param {integer} value - The depth of this Game Object.
     *
     * @return {this} This Game Object instance.
     */
    public function setDepth(value:Int):Dynamic;
    /**
     * The initial WebGL pipeline of this Game Object.
     *
     * @name Phaser.GameObjects.Components.Pipeline#defaultPipeline
     * @type {Phaser.Renderer.WebGL.WebGLPipeline}
     * @default null
     * @webglOnly
     * @since 3.0.0
     */
    public var defaultPipeline:phaser.renderer.webgl.WebGLPipeline;
    /**
     * The current WebGL pipeline of this Game Object.
     *
     * @name Phaser.GameObjects.Components.Pipeline#pipeline
     * @type {Phaser.Renderer.WebGL.WebGLPipeline}
     * @default null
     * @webglOnly
     * @since 3.0.0
     */
    public var pipeline:phaser.renderer.webgl.WebGLPipeline;
    /**
     * Sets the initial WebGL Pipeline of this Game Object.
     * This should only be called during the instantiation of the Game Object.
     *
     * @method Phaser.GameObjects.Components.Pipeline#initPipeline
     * @webglOnly
     * @since 3.0.0
     *
     * @param {string} [pipelineName=TextureTintPipeline] - The name of the pipeline to set on this Game Object. Defaults to the Texture Tint Pipeline.
     *
     * @return {boolean} `true` if the pipeline was set successfully, otherwise `false`.
     */
    public function initPipeline(?pipelineName:String):Bool;
    /**
     * Sets the active WebGL Pipeline of this Game Object.
     *
     * @method Phaser.GameObjects.Components.Pipeline#setPipeline
     * @webglOnly
     * @since 3.0.0
     *
     * @param {string} pipelineName - The name of the pipeline to set on this Game Object.
     *
     * @return {this} This Game Object instance.
     */
    public function setPipeline(pipelineName:String):Dynamic;
    /**
     * Resets the WebGL Pipeline of this Game Object back to the default it was created with.
     *
     * @method Phaser.GameObjects.Components.Pipeline#resetPipeline
     * @webglOnly
     * @since 3.0.0
     *
     * @return {boolean} `true` if the pipeline was set successfully, otherwise `false`.
     */
    public function resetPipeline():Bool;
    /**
     * Gets the name of the WebGL Pipeline this Game Object is currently using.
     *
     * @method Phaser.GameObjects.Components.Pipeline#getPipelineName
     * @webglOnly
     * @since 3.0.0
     *
     * @return {string} The string-based name of the pipeline being used by this Game Object.
     */
    public function getPipelineName():String;
    /**
     * The x position of this Game Object.
     *
     * @name Phaser.GameObjects.Components.Transform#x
     * @type {number}
     * @default 0
     * @since 3.0.0
     */
    public var x:Float;
    /**
     * The y position of this Game Object.
     *
     * @name Phaser.GameObjects.Components.Transform#y
     * @type {number}
     * @default 0
     * @since 3.0.0
     */
    public var y:Float;
    /**
     * The z position of this Game Object.
     * Note: Do not use this value to set the z-index, instead see the `depth` property.
     *
     * @name Phaser.GameObjects.Components.Transform#z
     * @type {number}
     * @default 0
     * @since 3.0.0
     */
    public var z:Float;
    /**
     * The w position of this Game Object.
     *
     * @name Phaser.GameObjects.Components.Transform#w
     * @type {number}
     * @default 0
     * @since 3.0.0
     */
    public var w:Float;
    /**
     * The horizontal scale of this Game Object.
     *
     * @name Phaser.GameObjects.Components.Transform#scaleX
     * @type {number}
     * @default 1
     * @since 3.0.0
     */
    public var scaleX:Float;
    /**
     * The vertical scale of this Game Object.
     *
     * @name Phaser.GameObjects.Components.Transform#scaleY
     * @type {number}
     * @default 1
     * @since 3.0.0
     */
    public var scaleY:Float;
    /**
     * The angle of this Game Object as expressed in degrees.
     *
     * Where 0 is to the right, 90 is down, 180 is left.
     *
     * If you prefer to work in radians, see the `rotation` property instead.
     *
     * @name Phaser.GameObjects.Components.Transform#angle
     * @type {integer}
     * @default 0
     * @since 3.0.0
     */
    public var angle:Int;
    /**
     * The angle of this Game Object in radians.
     *
     * If you prefer to work in degrees, see the `angle` property instead.
     *
     * @name Phaser.GameObjects.Components.Transform#rotation
     * @type {number}
     * @default 1
     * @since 3.0.0
     */
    public var rotation:Float;
    /**
     * Sets the position of this Game Object.
     *
     * @method Phaser.GameObjects.Components.Transform#setPosition
     * @since 3.0.0
     *
     * @param {number} [x=0] - The x position of this Game Object.
     * @param {number} [y=x] - The y position of this Game Object. If not set it will use the `x` value.
     * @param {number} [z=0] - The z position of this Game Object.
     * @param {number} [w=0] - The w position of this Game Object.
     *
     * @return {this} This Game Object instance.
     */
    public function setPosition(?x:Float, ?y:Float, ?z:Float, ?w:Float):Dynamic;
    /**
     * Sets the position of this Game Object to be a random position within the confines of
     * the given area.
     *
     * If no area is specified a random position between 0 x 0 and the game width x height is used instead.
     *
     * The position does not factor in the size of this Game Object, meaning that only the origin is
     * guaranteed to be within the area.
     *
     * @method Phaser.GameObjects.Components.Transform#setRandomPosition
     * @since 3.8.0
     *
     * @param {number} [x=0] - The x position of the top-left of the random area.
     * @param {number} [y=0] - The y position of the top-left of the random area.
     * @param {number} [width] - The width of the random area.
     * @param {number} [height] - The height of the random area.
     *
     * @return {this} This Game Object instance.
     */
    public function setRandomPosition(?x:Float, ?y:Float, ?width:Float, ?height:Float):Dynamic;
    /**
     * Sets the rotation of this Game Object.
     *
     * @method Phaser.GameObjects.Components.Transform#setRotation
     * @since 3.0.0
     *
     * @param {number} [radians=0] - The rotation of this Game Object, in radians.
     *
     * @return {this} This Game Object instance.
     */
    public function setRotation(?radians:Float):Dynamic;
    /**
     * Sets the angle of this Game Object.
     *
     * @method Phaser.GameObjects.Components.Transform#setAngle
     * @since 3.0.0
     *
     * @param {number} [degrees=0] - The rotation of this Game Object, in degrees.
     *
     * @return {this} This Game Object instance.
     */
    public function setAngle(?degrees:Float):Dynamic;
    /**
     * Sets the scale of this Game Object.
     *
     * @method Phaser.GameObjects.Components.Transform#setScale
     * @since 3.0.0
     *
     * @param {number} x - The horizontal scale of this Game Object.
     * @param {number} [y=x] - The vertical scale of this Game Object. If not set it will use the `x` value.
     *
     * @return {this} This Game Object instance.
     */
    public function setScale(x:Float, ?y:Float):Dynamic;
    /**
     * Sets the x position of this Game Object.
     *
     * @method Phaser.GameObjects.Components.Transform#setX
     * @since 3.0.0
     *
     * @param {number} [value=0] - The x position of this Game Object.
     *
     * @return {this} This Game Object instance.
     */
    public function setX(?value:Float):Dynamic;
    /**
     * Sets the y position of this Game Object.
     *
     * @method Phaser.GameObjects.Components.Transform#setY
     * @since 3.0.0
     *
     * @param {number} [value=0] - The y position of this Game Object.
     *
     * @return {this} This Game Object instance.
     */
    public function setY(?value:Float):Dynamic;
    /**
     * Sets the z position of this Game Object.
     *
     * @method Phaser.GameObjects.Components.Transform#setZ
     * @since 3.0.0
     *
     * @param {number} [value=0] - The z position of this Game Object.
     *
     * @return {this} This Game Object instance.
     */
    public function setZ(?value:Float):Dynamic;
    /**
     * Sets the w position of this Game Object.
     *
     * @method Phaser.GameObjects.Components.Transform#setW
     * @since 3.0.0
     *
     * @param {number} [value=0] - The w position of this Game Object.
     *
     * @return {this} This Game Object instance.
     */
    public function setW(?value:Float):Dynamic;
    /**
     * Gets the local transform matrix for this Game Object.
     *
     * @method Phaser.GameObjects.Components.Transform#getLocalTransformMatrix
     * @since 3.4.0
     *
     * @param {Phaser.GameObjects.Components.TransformMatrix} [tempMatrix] - The matrix to populate with the values from this Game Object.
     *
     * @return {Phaser.GameObjects.Components.TransformMatrix} The populated Transform Matrix.
     */
    public function getLocalTransformMatrix(?tempMatrix:phaser.gameobjects.components.TransformMatrix):phaser.gameobjects.components.TransformMatrix;
    /**
     * Gets the world transform matrix for this Game Object, factoring in any parent Containers.
     *
     * @method Phaser.GameObjects.Components.Transform#getWorldTransformMatrix
     * @since 3.4.0
     *
     * @param {Phaser.GameObjects.Components.TransformMatrix} [tempMatrix] - The matrix to populate with the values from this Game Object.
     * @param {Phaser.GameObjects.Components.TransformMatrix} [parentMatrix] - A temporary matrix to hold parent values during the calculations.
     *
     * @return {Phaser.GameObjects.Components.TransformMatrix} The populated Transform Matrix.
     */
    public function getWorldTransformMatrix(?tempMatrix:phaser.gameobjects.components.TransformMatrix, ?parentMatrix:phaser.gameobjects.components.TransformMatrix):phaser.gameobjects.components.TransformMatrix;
    /**
     * The visible state of the Game Object.
     *
     * An invisible Game Object will skip rendering, but will still process update logic.
     *
     * @name Phaser.GameObjects.Components.Visible#visible
     * @type {boolean}
     * @since 3.0.0
     */
    public var visible:Bool;
    /**
     * Sets the visibility of this Game Object.
     *
     * An invisible Game Object will skip rendering, but will still process update logic.
     *
     * @method Phaser.GameObjects.Components.Visible#setVisible
     * @since 3.0.0
     *
     * @param {boolean} value - The visible state of the Game Object.
     *
     * @return {this} This Game Object instance.
     */
    public function setVisible(value:Bool):Dynamic;
}
