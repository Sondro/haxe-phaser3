package phaser.tilemaps;

@:native("Phaser.Tilemaps.Tile")
extern class Tile extends phaser.gameobjects.components.Alpha {
    public function new(layer:phaser.tilemaps.LayerData, index:Int, x:Int, y:Int, width:Int, height:Int, baseWidth:Int, baseHeight:Int);
    public var layer:phaser.tilemaps.LayerData;
    public var index:Int;
    public var x:Int;
    public var y:Int;
    public var width:Int;
    public var height:Int;
    public var baseWidth:Int;
    public var baseHeight:Int;
    public var pixelX:Float;
    public var pixelY:Float;
    public var properties:Dynamic;
    public var rotation:Float;
    public var collideLeft:Bool;
    public var collideRight:Bool;
    public var collideUp:Bool;
    public var collideDown:Bool;
    public var faceLeft:Bool;
    public var faceRight:Bool;
    public var faceTop:Bool;
    public var faceBottom:Bool;
    public var collisionCallback:Dynamic;
    public var collisionCallbackContext:Dynamic;
    public var tint:Float;
    public var physics:Dynamic;
    public var canCollide:Bool;
    public var collides:Bool;
    public var hasInterestingFace:Bool;
    public var tileset:phaser.tilemaps.Tileset;
    public var tilemapLayer:Dynamic;
    public var tilemap:phaser.tilemaps.Tilemap;
    public function containsPoint(x:Float, y:Float):Bool;
    public function copy(tile:phaser.tilemaps.Tile):phaser.tilemaps.Tile;
    public function getCollisionGroup():Dynamic;
    public function getTileData():Dynamic;
    public function getLeft(?camera:phaser.cameras.scene2d.Camera):Float;
    public function getRight(?camera:phaser.cameras.scene2d.Camera):Float;
    public function getTop(?camera:phaser.cameras.scene2d.Camera):Float;
    public function getBottom(?camera:phaser.cameras.scene2d.Camera):Float;
    public function getBounds(?camera:phaser.cameras.scene2d.Camera, ?output:Dynamic):phaser.geom.Rectangle;
    public function getCenterX(?camera:phaser.cameras.scene2d.Camera):Float;
    public function getCenterY(?camera:phaser.cameras.scene2d.Camera):Float;
    public function destroy():Void;
    public function intersects(x:Float, y:Float, right:Float, bottom:Float):Bool;
    public function isInteresting(collides:Bool, faces:Bool):Bool;
    public function resetCollision(?recalculateFaces:Bool):phaser.tilemaps.Tile;
    public function resetFaces():phaser.tilemaps.Tile;
    public function setCollision(left:Bool, ?right:Bool, ?up:Bool, ?down:Bool, ?recalculateFaces:Bool):phaser.tilemaps.Tile;
    public function setCollisionCallback(callback:Dynamic, context:Dynamic):phaser.tilemaps.Tile;
    public function setSize(tileWidth:Int, tileHeight:Int, baseWidth:Int, baseHeight:Int):phaser.tilemaps.Tile;
    public function updatePixelXY():phaser.tilemaps.Tile;
    public var flipX:Bool;
    public var flipY:Bool;
    public function toggleFlipX():Dynamic;
    public function toggleFlipY():Dynamic;
    public function setFlipX(value:Bool):Dynamic;
    public function setFlipY(value:Bool):Dynamic;
    public function setFlip(x:Bool, y:Bool):Dynamic;
    public function resetFlip():Dynamic;
    public var visible:Bool;
    public function setVisible(value:Bool):Dynamic;
}
