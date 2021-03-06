package phaser;

/**
 * The `Matter.Pairs` module contains methods for creating and manipulating collision pair sets.
 *
 * @class Pairs
 */
@:native("Pairs")
extern class Pairs {
    public function new();
    public function create():Void;
    public function update():Void;
    public function removeOld():Void;
    public function clear():Void;
}
