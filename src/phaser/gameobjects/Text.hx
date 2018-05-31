package phaser.gameobjects;

@:native("Phaser.GameObjects.Text")
extern class Text extends phaser.gameobjects.GameObject {
    public function new(scene:phaser.Scene, x:Float, y:Float, text:Dynamic, style:Dynamic);
    public var canvas:js.html.CanvasElement;
    public var context:js.html.CanvasRenderingContext2D;
    public var style:phaser.gameobjects.text.TextStyle;
    public var autoRound:Bool;
    public var splitRegExp:Dynamic;
    public var text:String;
    public var resolution:Float;
    public var padding:Dynamic;
    public var canvasTexture:js.html.CanvasElement;
    public var dirty:Bool;
    public function GetTextSize(text:phaser.gameobjects.Text, size:Float, lines:Array<Dynamic>):Dynamic;
    public function MeasureText(textStyle:phaser.gameobjects.text.TextStyle):Dynamic;
    public function initRTL():Void;
    public function runWordWrap(text:String):String;
    public function advancedWordWrap(text:String, context:js.html.CanvasRenderingContext2D, wordWrapWidth:Float):String;
    public function basicWordWrap(text:String, context:js.html.CanvasRenderingContext2D, wordWrapWidth:Float):String;
    public function getWrappedText(text:String):Array<String>;
    public function setText(value:Dynamic):phaser.gameobjects.Text;
    public function setStyle(style:Dynamic):phaser.gameobjects.Text;
    public function setFont(font:String):phaser.gameobjects.Text;
    public function setFontFamily(family:String):phaser.gameobjects.Text;
    public function setFontSize(size:Float):phaser.gameobjects.Text;
    public function setFontStyle(style:String):phaser.gameobjects.Text;
    public function setFixedSize(width:Float, height:Float):phaser.gameobjects.Text;
    public function setBackgroundColor(color:String):phaser.gameobjects.Text;
    public function setFill(color:String):phaser.gameobjects.Text;
    public function setColor(color:String):phaser.gameobjects.Text;
    public function setStroke(color:String, thickness:Float):phaser.gameobjects.Text;
    public function setShadow(x:Float, y:Float, color:String, blur:Float, shadowStroke:Bool, shadowFill:Bool):phaser.gameobjects.Text;
    public function setShadowOffset(x:Float, y:Float):phaser.gameobjects.Text;
    public function setShadowColor(color:String):phaser.gameobjects.Text;
    public function setShadowBlur(blur:Float):phaser.gameobjects.Text;
    public function setShadowStroke(enabled:Bool):phaser.gameobjects.Text;
    public function setShadowFill(enabled:Bool):phaser.gameobjects.Text;
    public function setWordWrapWidth(width:Float, ?useAdvancedWrap:Bool):phaser.gameobjects.Text;
    public function setWordWrapCallback(callback:TextStyleWordWrapCallback, ?scope:Dynamic):phaser.gameobjects.Text;
    public function setAlign(align:String):phaser.gameobjects.Text;
    public function setPadding(left:Dynamic, top:Float, right:Float, bottom:Float):phaser.gameobjects.Text;
    public function setMaxLines(?max:Int):phaser.gameobjects.Text;
    public function updateText():phaser.gameobjects.Text;
    public function getTextMetrics():Dynamic;
    public function preDestroy():Void;
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
    public var mask:Dynamic;
    public function setMask(mask:Dynamic):Dynamic;
    public function clearMask(?destroyMask:Bool):Dynamic;
    public function createBitmapMask(?renderable:phaser.gameobjects.GameObject):phaser.display.masks.BitmapMask;
    public function createGeometryMask(?graphics:phaser.gameobjects.Graphics):phaser.display.masks.GeometryMask;
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
    public var tintTopLeft:Int;
    public var tintTopRight:Int;
    public var tintBottomLeft:Int;
    public var tintBottomRight:Int;
    public var tint:Int;
    public function clearTint():Dynamic;
    public function setTint(?topLeft:Int, ?topRight:Int, ?bottomLeft:Int, ?bottomRight:Int):Dynamic;
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
