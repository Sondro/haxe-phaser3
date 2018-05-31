package phaser.gameobjects.text;

@:native("Phaser.GameObjects.Text.TextStyle")
extern class TextStyle {
    public function new(text:phaser.gameobjects.Text, style:Dynamic);
    public var parent:phaser.gameobjects.Text;
    public var fontFamily:String;
    public var fontSize:String;
    public var fontStyle:String;
    public var backgroundColor:String;
    public var color:String;
    public var stroke:String;
    public var strokeThickness:Float;
    public var shadowOffsetX:Float;
    public var shadowOffsetY:Float;
    public var shadowColor:String;
    public var shadowBlur:Float;
    public var shadowStroke:Bool;
    public var shadowFill:Bool;
    public var align:String;
    public var maxLines:Int;
    public var fixedWidth:Float;
    public var fixedHeight:Float;
    public var rtl:Bool;
    public var testString:String;
    public var baselineX:Float;
    public var baselineY:Float;
    public function setStyle(style:js.html.CSSStyleRule, ?updateText:Bool):phaser.gameobjects.Text;
    public function syncFont(canvas:js.html.CanvasElement, context:js.html.CanvasRenderingContext2D):Void;
    public function syncStyle(canvas:js.html.CanvasElement, context:js.html.CanvasRenderingContext2D):Void;
    public function syncShadow(context:js.html.CanvasRenderingContext2D, enabled:Bool):Void;
    public function update(recalculateMetrics:Bool):phaser.gameobjects.Text;
    public function setFont(font:Dynamic):phaser.gameobjects.Text;
    public function setFontFamily(family:String):phaser.gameobjects.Text;
    public function setFontStyle(style:String):phaser.gameobjects.Text;
    public function setFontSize(size:Dynamic):phaser.gameobjects.Text;
    public function setTestString(string:String):phaser.gameobjects.Text;
    public function setFixedSize(width:Float, height:Float):phaser.gameobjects.Text;
    public function setBackgroundColor(color:String):phaser.gameobjects.Text;
    public function setFill(color:String):phaser.gameobjects.Text;
    public function setColor(color:String):phaser.gameobjects.Text;
    public function setStroke(color:String, thickness:Float):phaser.gameobjects.Text;
    public function setShadow(?x:Float, ?y:Float, ?color:String, ?blur:Float, ?shadowStroke:Bool, ?shadowFill:Bool):phaser.gameobjects.Text;
    public function setShadowOffset(?x:Float, ?y:Float):phaser.gameobjects.Text;
    public function setShadowColor(?color:String):phaser.gameobjects.Text;
    public function setShadowBlur(?blur:Float):phaser.gameobjects.Text;
    public function setShadowStroke(enabled:Bool):phaser.gameobjects.Text;
    public function setShadowFill(enabled:Bool):phaser.gameobjects.Text;
    public function setWordWrapWidth(width:Float, ?useAdvancedWrap:Bool):phaser.gameobjects.Text;
    public function setWordWrapCallback(callback:TextStyleWordWrapCallback, ?scope:Dynamic):phaser.gameobjects.Text;
    public function setAlign(align:String):phaser.gameobjects.Text;
    public function setMaxLines(?max:Int):phaser.gameobjects.Text;
    public function getTextMetrics():Dynamic;
    public function toJSON():Dynamic;
    public function destroy():Void;
}