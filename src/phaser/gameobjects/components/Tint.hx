package phaser.gameobjects.components;

/**
 * Provides methods used for setting the tint of a Game Object.
 * Should be applied as a mixin and not used directly.
 *
 * @name Phaser.GameObjects.Components.Tint
 * @webglOnly
 * @since 3.0.0
 */
@:native("Phaser.GameObjects.Components.Tint")
extern class Tint {
    public function new();
    /**
     * Fill or additive?
     *
     * @name Phaser.GameObjects.Components.Tint#tintFill
     * @type {boolean}
     * @default false
     * @since 3.11.0
     */
    public var tintFill:Bool;
    /**
     * The tint value being applied to the top-left of the Game Object.
     * This value is interpolated from the corner to the center of the Game Object.
     *
     * @name Phaser.GameObjects.Components.Tint#tintTopLeft
     * @type {integer}
     * @webglOnly
     * @since 3.0.0
     */
    public var tintTopLeft:Int;
    /**
     * The tint value being applied to the top-right of the Game Object.
     * This value is interpolated from the corner to the center of the Game Object.
     *
     * @name Phaser.GameObjects.Components.Tint#tintTopRight
     * @type {integer}
     * @webglOnly
     * @since 3.0.0
     */
    public var tintTopRight:Int;
    /**
     * The tint value being applied to the bottom-left of the Game Object.
     * This value is interpolated from the corner to the center of the Game Object.
     *
     * @name Phaser.GameObjects.Components.Tint#tintBottomLeft
     * @type {integer}
     * @webglOnly
     * @since 3.0.0
     */
    public var tintBottomLeft:Int;
    /**
     * The tint value being applied to the bottom-right of the Game Object.
     * This value is interpolated from the corner to the center of the Game Object.
     *
     * @name Phaser.GameObjects.Components.Tint#tintBottomRight
     * @type {integer}
     * @webglOnly
     * @since 3.0.0
     */
    public var tintBottomRight:Int;
    /**
     * The tint value being applied to the whole of the Game Object.
     *
     * @name Phaser.GameObjects.Components.Tint#tint
     * @type {integer}
     * @webglOnly
     * @since 3.0.0
     */
    public var tint:Int;
    /**
     * Does this Game Object have a tint applied to it or not?
     *
     * @name Phaser.GameObjects.Components.Tint#isTinted
     * @type {boolean}
     * @webglOnly
     * @readonly
     * @since 3.11.0
     */
    public var isTinted:Bool;
    /**
     * Clears all tint values associated with this Game Object.
     *
     * Immediately sets the color values back to 0xffffff and the tint type to 'additive',
     * which results in no visible change to the texture.
     *
     * @method Phaser.GameObjects.Components.Tint#clearTint
     * @webglOnly
     * @since 3.0.0
     *
     * @return {this} This Game Object instance.
     */
    public function clearTint():Dynamic;
    /**
     * Sets an additive tint on this Game Object.
     *
     * The tint works by taking the pixel color values from the Game Objects texture, and then
     * multiplying it by the color value of the tint. You can provide either one color value,
     * in which case the whole Game Object will be tinted in that color. Or you can provide a color
     * per corner. The colors are blended together across the extent of the Game Object.
     *
     * To modify the tint color once set, either call this method again with new values or use the
     * `tint` property to set all colors at once. Or, use the properties `tintTopLeft`, `tintTopRight,
     * `tintBottomLeft` and `tintBottomRight` to set the corner color values independently.
     *
     * To remove a tint call `clearTint`.
     *
     * To swap this from being an additive tint to a fill based tint set the property `tintFill` to `true`.
     *
     * @method Phaser.GameObjects.Components.Tint#setTint
     * @webglOnly
     * @since 3.0.0
     *
     * @param {integer} [topLeft=0xffffff] - The tint being applied to the top-left of the Game Object. If no other values are given this value is applied evenly, tinting the whole Game Object.
     * @param {integer} [topRight] - The tint being applied to the top-right of the Game Object.
     * @param {integer} [bottomLeft] - The tint being applied to the bottom-left of the Game Object.
     * @param {integer} [bottomRight] - The tint being applied to the bottom-right of the Game Object.
     *
     * @return {this} This Game Object instance.
     */
    public function setTint(?topLeft:Int, ?topRight:Int, ?bottomLeft:Int, ?bottomRight:Int):Dynamic;
    /**
     * Sets a fill-based tint on this Game Object.
     *
     * Unlike an additive tint, a fill-tint literally replaces the pixel colors from the texture
     * with those in the tint. You can use this for effects such as making a player flash 'white'
     * if hit by something. You can provide either one color value, in which case the whole
     * Game Object will be rendered in that color. Or you can provide a color per corner. The colors
     * are blended together across the extent of the Game Object.
     *
     * To modify the tint color once set, either call this method again with new values or use the
     * `tint` property to set all colors at once. Or, use the properties `tintTopLeft`, `tintTopRight,
     * `tintBottomLeft` and `tintBottomRight` to set the corner color values independently.
     *
     * To remove a tint call `clearTint`.
     *
     * To swap this from being a fill-tint to an additive tint set the property `tintFill` to `false`.
     *
     * @method Phaser.GameObjects.Components.Tint#setTintFill
     * @webglOnly
     * @since 3.11.0
     *
     * @param {integer} [topLeft=0xffffff] - The tint being applied to the top-left of the Game Object. If not other values are given this value is applied evenly, tinting the whole Game Object.
     * @param {integer} [topRight] - The tint being applied to the top-right of the Game Object.
     * @param {integer} [bottomLeft] - The tint being applied to the bottom-left of the Game Object.
     * @param {integer} [bottomRight] - The tint being applied to the bottom-right of the Game Object.
     *
     * @return {this} This Game Object instance.
     */
    public function setTintFill(?topLeft:Int, ?topRight:Int, ?bottomLeft:Int, ?bottomRight:Int):Dynamic;
}
