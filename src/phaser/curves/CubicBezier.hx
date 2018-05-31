package phaser.curves;

@:native("Phaser.Curves.CubicBezier")
extern class CubicBezier extends phaser.curves.Curve {
    public function new(p0:Dynamic, p1:phaser.math.Vector2, p2:phaser.math.Vector2, p3:phaser.math.Vector2);
    public var p0:phaser.math.Vector2;
    public var p1:phaser.math.Vector2;
    public var p2:phaser.math.Vector2;
    public var p3:phaser.math.Vector2;
    public function getResolution(divisions:Float):Float;
    public function getPoint(t:Float, ?out:phaser.math.Vector2):phaser.math.Vector2;
    public function toJSON():JSONCurve;
    public function fromJSON(data:JSONCurve):phaser.curves.CubicBezier;
}
