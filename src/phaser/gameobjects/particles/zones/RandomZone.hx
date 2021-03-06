package phaser.gameobjects.particles.zones;

/**
 * @classdesc
 * A zone that places particles randomly within a shape's area.
 *
 * @class RandomZone
 * @memberof Phaser.GameObjects.Particles.Zones
 * @constructor
 * @since 3.0.0
 *
 * @param {RandomZoneSource} source - An object instance with a `getRandomPoint(point)` method.
 */
@:native("Phaser.GameObjects.Particles.Zones.RandomZone")
extern class RandomZone {
    public function new(source:RandomZoneSource);
    /**
     * An object instance with a `getRandomPoint(point)` method.
     *
     * @name Phaser.GameObjects.Particles.Zones.RandomZone#source
     * @type {RandomZoneSource}
     * @since 3.0.0
     */
    public var source:RandomZoneSource;
    /**
     * Get the next point in the Zone and set its coordinates on the given Particle.
     *
     * @method Phaser.GameObjects.Particles.Zones.RandomZone#getPoint
     * @since 3.0.0
     *
     * @param {Phaser.GameObjects.Particles.Particle} particle - The Particle.
     */
    public function getPoint(particle:phaser.gameobjects.particles.Particle):Void;
}
