package phaser;

/**
 * @typedef {object} ParticleEmitterFrameConfig
 *
 * @property {number|number[]|string|string[]|Phaser.Textures.Frame|Phaser.Textures.Frame[]} [frames] - One or more texture frames.
 * @property {boolean} [cycle] - Whether texture frames will be assigned consecutively (true) or at random (false).
 * @property {integer} [quantity] - The number of consecutive particles receiving each texture frame, when `cycle` is true.
 */
typedef ParticleEmitterFrameConfig = {
    @:optional var frames:Dynamic;
    @:optional var cycle:Bool;
    @:optional var quantity:Int;
};
