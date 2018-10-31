package phaser.physics.impact;

@:native("Phaser.Physics.Impact.ImpactBody")
extern class ImpactBody extends phaser.physics.impact.components.Acceleration {
    public function new(world:phaser.physics.impact.World, x:Float, y:Float, width:Float, height:Float);
    public var body:phaser.physics.impact.Body;
    public var size:Dynamic;
    public var offset:Dynamic;
    public var vel:Dynamic;
    public var accel:Dynamic;
    public var friction:Dynamic;
    public var maxVel:Dynamic;
    public function setBodySize(width:Float, ?height:Float):Dynamic;
    public function setBodyScale(scaleX:Float, ?scaleY:Float):Dynamic;
    public function getBodyType():Float;
    public function setTypeNone():phaser.gameobjects.GameObject;
    public function setTypeA():phaser.gameobjects.GameObject;
    public function setTypeB():phaser.gameobjects.GameObject;
    public var bounce:Float;
    public function setBounce(value:Float):phaser.gameobjects.GameObject;
    public function setMinBounceVelocity(value:Float):phaser.gameobjects.GameObject;
    public var checkAgainst:Float;
    public function setAvsB():phaser.gameobjects.GameObject;
    public function setBvsA():phaser.gameobjects.GameObject;
    public function setCheckAgainstNone():phaser.gameobjects.GameObject;
    public function setCheckAgainstA():phaser.gameobjects.GameObject;
    public function setCheckAgainstB():phaser.gameobjects.GameObject;
    public var collides:Float;
    public function setCollideCallback(callback:CollideCallback, scope:Dynamic):phaser.gameobjects.GameObject;
    public function setCollidesNever():phaser.gameobjects.GameObject;
    public function setLiteCollision():phaser.gameobjects.GameObject;
    public function setPassiveCollision():phaser.gameobjects.GameObject;
    public function setActiveCollision():phaser.gameobjects.GameObject;
    public function setFixedCollision():phaser.gameobjects.GameObject;
    public var debugShowBody:Bool;
    public var debugShowVelocity:Bool;
    public var debugBodyColor:Float;
    public function setDebug(showBody:Bool, showVelocity:Bool, bodyColor:Float):phaser.gameobjects.GameObject;
    public function setDebugBodyColor(value:Float):phaser.gameobjects.GameObject;
    public function setFrictionX(x:Float):phaser.gameobjects.GameObject;
    public function setFrictionY(y:Float):phaser.gameobjects.GameObject;
    public function setFriction(x:Float, y:Float):phaser.gameobjects.GameObject;
    public var gravity:Float;
    public function setGravity(value:Float):phaser.gameobjects.GameObject;
    public function setOffset(x:Float, y:Float, ?width:Float, ?height:Float):phaser.gameobjects.GameObject;
    public function setGameObject(gameObject:phaser.gameobjects.GameObject, ?sync:Bool):phaser.gameobjects.GameObject;
    public function syncGameObject():phaser.gameobjects.GameObject;
    public function setVelocityX(x:Float):Dynamic;
    public function setVelocityY(y:Float):Dynamic;
    public function setVelocity(x:Float, ?y:Float):Dynamic;
    public function setMaxVelocity(x:Float, ?y:Float):Dynamic;
}
