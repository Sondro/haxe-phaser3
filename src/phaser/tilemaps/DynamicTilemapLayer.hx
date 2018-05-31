package phaser.tilemaps;

@:native("Phaser.Tilemaps.DynamicTilemapLayer")
extern class DynamicTilemapLayer extends phaser.gameobjects.GameObject {
    public function new(scene:phaser.Scene, tilemap:phaser.tilemaps.Tilemap, layerIndex:Int, tileset:phaser.tilemaps.Tileset, ?x:Float, ?y:Float);
    public var isTilemap:Bool;
    public var tilemap:phaser.tilemaps.Tilemap;
    public var layerIndex:Int;
    public var layer:phaser.tilemaps.LayerData;
    public var tileset:phaser.tilemaps.Tileset;
    public var culledTiles:Array<Dynamic>;
    public function calculateFacesAt(tileX:Int, tileY:Int):phaser.tilemaps.DynamicTilemapLayer;
    public function calculateFacesWithin(?tileX:Int, ?tileY:Int, ?width:Int, ?height:Int):phaser.tilemaps.DynamicTilemapLayer;
    public function createFromTiles(indexes:Dynamic, replacements:Dynamic, spriteConfig:Dynamic, ?scene:phaser.Scene, ?camera:phaser.cameras.scene2d.Camera):Array<phaser.gameobjects.Sprite>;
    public function cull(?camera:phaser.cameras.scene2d.Camera):Array<phaser.tilemaps.Tile>;
    public function copy(srcTileX:Int, srcTileY:Int, width:Int, height:Int, destTileX:Int, destTileY:Int, ?recalculateFaces:Bool):phaser.tilemaps.DynamicTilemapLayer;
    public function fill(index:Int, ?tileX:Int, ?tileY:Int, ?width:Int, ?height:Int, ?recalculateFaces:Bool):phaser.tilemaps.DynamicTilemapLayer;
    public function filterTiles(callback:Dynamic, ?context:Dynamic, ?tileX:Int, ?tileY:Int, ?width:Int, ?height:Int, ?filteringOptions:Dynamic):Array<phaser.tilemaps.Tile>;
    public function findByIndex(index:Int, ?skip:Int, ?reverse:Bool):phaser.tilemaps.Tile;
    public function findTile(callback:Dynamic, ?context:Dynamic, ?tileX:Int, ?tileY:Int, ?width:Int, ?height:Int, ?filteringOptions:Dynamic):phaser.tilemaps.Tile;
    public function forEachTile(callback:Dynamic, ?context:Dynamic, ?tileX:Int, ?tileY:Int, ?width:Int, ?height:Int, ?filteringOptions:Dynamic):phaser.tilemaps.DynamicTilemapLayer;
    public function getTileAt(tileX:Int, tileY:Int, ?nonNull:Bool):phaser.tilemaps.Tile;
    public function getTileAtWorldXY(worldX:Float, worldY:Float, ?nonNull:Bool, ?camera:phaser.cameras.scene2d.Camera):phaser.tilemaps.Tile;
    public function getTilesWithin(?tileX:Int, ?tileY:Int, ?width:Int, ?height:Int, ?filteringOptions:Dynamic):Array<phaser.tilemaps.Tile>;
    public function getTilesWithinShape(shape:Dynamic, ?filteringOptions:Dynamic, ?camera:phaser.cameras.scene2d.Camera):Array<phaser.tilemaps.Tile>;
    public function getTilesWithinWorldXY(worldX:Float, worldY:Float, width:Float, height:Float, ?filteringOptions:Dynamic, ?camera:phaser.cameras.scene2d.Camera):Array<phaser.tilemaps.Tile>;
    public function hasTileAt(tileX:Int, tileY:Int):Bool;
    public function hasTileAtWorldXY(worldX:Float, worldY:Float, ?camera:phaser.cameras.scene2d.Camera):Bool;
    public function putTileAt(tile:Dynamic, tileX:Int, tileY:Int, ?recalculateFaces:Bool):phaser.tilemaps.Tile;
    public function putTileAtWorldXY(tile:Dynamic, worldX:Int, worldY:Int, ?recalculateFaces:Bool, ?camera:phaser.cameras.scene2d.Camera):phaser.tilemaps.Tile;
    public function putTilesAt(tile:Dynamic, tileX:Int, tileY:Int, ?recalculateFaces:Bool):phaser.tilemaps.DynamicTilemapLayer;
    public function randomize(?tileX:Int, ?tileY:Int, ?width:Int, ?height:Int, ?indexes:Array<Int>):phaser.tilemaps.DynamicTilemapLayer;
    public function removeTileAt(tile:Dynamic, tileX:Int, tileY:Int, ?replaceWithNull:Bool, ?recalculateFaces:Bool):phaser.tilemaps.Tile;
    public function removeTileAtWorldXY(tile:Dynamic, worldX:Float, worldY:Float, ?replaceWithNull:Bool, ?recalculateFaces:Bool, ?camera:phaser.cameras.scene2d.Camera):phaser.tilemaps.Tile;
    public function renderDebug(graphics:phaser.gameobjects.Graphics, styleConfig:Dynamic):phaser.tilemaps.DynamicTilemapLayer;
    public function replaceByIndex(findIndex:Int, newIndex:Int, ?tileX:Int, ?tileY:Int, ?width:Int, ?height:Int):phaser.tilemaps.DynamicTilemapLayer;
    public function setCollision(indexes:Dynamic, ?collides:Bool, ?recalculateFaces:Bool):phaser.tilemaps.DynamicTilemapLayer;
    public function setCollisionBetween(start:Int, stop:Int, ?collides:Bool, ?recalculateFaces:Bool):phaser.tilemaps.DynamicTilemapLayer;
    public function setCollisionByProperty(properties:Dynamic, ?collides:Bool, ?recalculateFaces:Bool):phaser.tilemaps.DynamicTilemapLayer;
    public function setCollisionByExclusion(indexes:Array<Int>, ?collides:Bool, ?recalculateFaces:Bool):phaser.tilemaps.DynamicTilemapLayer;
    public function setCollisionFromCollisionGroup(?collides:Bool, ?recalculateFaces:Bool):phaser.tilemaps.DynamicTilemapLayer;
    public function setTileIndexCallback(indexes:Dynamic, callback:Dynamic, callbackContext:Dynamic):phaser.tilemaps.DynamicTilemapLayer;
    public function setTileLocationCallback(tileX:Int, tileY:Int, width:Int, height:Int, callback:Dynamic, ?callbackContext:Dynamic):phaser.tilemaps.DynamicTilemapLayer;
    public function shuffle(?tileX:Int, ?tileY:Int, ?width:Int, ?height:Int):phaser.tilemaps.DynamicTilemapLayer;
    public function swapByIndex(tileA:Int, tileB:Int, ?tileX:Int, ?tileY:Int, ?width:Int, ?height:Int):phaser.tilemaps.DynamicTilemapLayer;
    public function tileToWorldX(tileX:Int, ?camera:phaser.cameras.scene2d.Camera):Float;
    public function tileToWorldY(tileY:Int, ?camera:phaser.cameras.scene2d.Camera):Float;
    public function tileToWorldXY(tileX:Int, tileY:Int, ?point:phaser.math.Vector2, ?camera:phaser.cameras.scene2d.Camera):phaser.math.Vector2;
    public function weightedRandomize(?tileX:Int, ?tileY:Int, ?width:Int, ?height:Int, ?weightedIndexes:Array<Dynamic>):phaser.tilemaps.DynamicTilemapLayer;
    public function worldToTileX(worldX:Float, ?snapToFloor:Bool, ?camera:phaser.cameras.scene2d.Camera):Float;
    public function worldToTileY(worldY:Float, ?snapToFloor:Bool, ?camera:phaser.cameras.scene2d.Camera):Float;
    public function worldToTileXY(worldX:Float, worldY:Float, ?snapToFloor:Bool, ?point:phaser.math.Vector2, ?camera:phaser.cameras.scene2d.Camera):phaser.math.Vector2;
    public var alpha:Float;
    public var alphaTopLeft:Float;
    public var alphaTopRight:Float;
    public var alphaBottomLeft:Float;
    public var alphaBottomRight:Float;
    public function clearAlpha():Dynamic;
    public function setAlpha(?topLeft:Float, ?topRight:Float, ?bottomLeft:Float, ?bottomRight:Float):Dynamic;
    public var blendMode:Dynamic;
    public function setBlendMode(value:Dynamic):Dynamic;
    public var width:Float;
    public var height:Float;
    public var displayWidth:Float;
    public var displayHeight:Float;
    public function setSize(width:Float, height:Float):Dynamic;
    public function setDisplaySize(width:Float, height:Float):Dynamic;
    public var depth:Float;
    public function setDepth(value:Int):Dynamic;
    public var flipX:Bool;
    public var flipY:Bool;
    public function toggleFlipX():Dynamic;
    public function toggleFlipY():Dynamic;
    public function setFlipX(value:Bool):Dynamic;
    public function setFlipY(value:Bool):Dynamic;
    public function setFlip(x:Bool, y:Bool):Dynamic;
    public function resetFlip():Dynamic;
    public function getCenter(?output:Dynamic):phaser.math.Vector2;
    public function getTopLeft(?output:Dynamic, ?includeParent:Bool):phaser.math.Vector2;
    public function getTopRight(?output:Dynamic, ?includeParent:Bool):phaser.math.Vector2;
    public function getBottomLeft(?output:Dynamic, ?includeParent:Bool):phaser.math.Vector2;
    public function getBottomRight(?output:Dynamic, ?includeParent:Bool):phaser.math.Vector2;
    public function getBounds(?output:Dynamic):phaser.geom.Rectangle;
    public var originX:Float;
    public var originY:Float;
    public var displayOriginX:Float;
    public var displayOriginY:Float;
    public function setOrigin(?x:Float, ?y:Float):Dynamic;
    public function setOriginFromFrame():Dynamic;
    public function setDisplayOrigin(?x:Float, ?y:Float):Dynamic;
    public function updateDisplayOrigin():Dynamic;
    public var defaultPipeline:phaser.renderer.webgl.WebGLPipeline;
    public var pipeline:phaser.renderer.webgl.WebGLPipeline;
    public function initPipeline(pipelineName:String):Bool;
    public function setPipeline(pipelineName:String):Bool;
    public function resetPipeline():Bool;
    public function getPipelineName():String;
    public var scaleMode:Dynamic;
    public function setScaleMode(value:Dynamic):Dynamic;
    public var scrollFactorX:Float;
    public var scrollFactorY:Float;
    public function setScrollFactor(x:Float, ?y:Float):Dynamic;
    public var x:Float;
    public var y:Float;
    public var z:Float;
    public var w:Float;
    public var scaleX:Float;
    public var scaleY:Float;
    public var angle:Int;
    public var rotation:Float;
    public function setPosition(?x:Float, ?y:Float, ?z:Float, ?w:Float):Dynamic;
    public function setRandomPosition(?x:Float, ?y:Float, ?width:Float, ?height:Float):Dynamic;
    public function setRotation(?radians:Float):Dynamic;
    public function setAngle(?degrees:Float):Dynamic;
    public function setScale(x:Float, ?y:Float):Dynamic;
    public function setX(?value:Float):Dynamic;
    public function setY(?value:Float):Dynamic;
    public function setZ(?value:Float):Dynamic;
    public function setW(?value:Float):Dynamic;
    public function getLocalTransformMatrix(?tempMatrix:phaser.gameobjects.components.TransformMatrix):phaser.gameobjects.components.TransformMatrix;
    public function getWorldTransformMatrix(?tempMatrix:phaser.gameobjects.components.TransformMatrix):phaser.gameobjects.components.TransformMatrix;
    public var visible:Bool;
    public function setVisible(value:Bool):Dynamic;
}
