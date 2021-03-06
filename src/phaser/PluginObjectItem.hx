package phaser;

/**
 * @typedef {object} PluginObjectItem
 *
 * @property {string} [key] - A key to identify the plugin in the Plugin Manager.
 * @property {*} [plugin] - The plugin itself. Usually a class/constructor.
 * @property {boolean} [start] - Whether the plugin should be started automatically.
 * @property {string} [systemKey] - For a scene plugin, add the plugin to the scene's systems object under this key (`this.sys.KEY`, from the scene).
 * @property {string} [sceneKey] - For a scene plugin, add the plugin to the scene object under this key (`this.KEY`, from the scene).
 * @property {*} [data] - Arbitrary data passed to the plugin's init() method.
 *
 * @example
 * // Global plugin
 * { key: 'BankPlugin', plugin: BankPluginV3, start: true, data: { gold: 5000 } }
 * @example
 * // Scene plugin
 * { key: 'WireFramePlugin', plugin: WireFramePlugin, systemKey: 'wireFramePlugin', sceneKey: 'wireframe' }
 */
typedef PluginObjectItem = {
    @:optional var key:String;
    @:optional var plugin:Dynamic;
    @:optional var start:Bool;
    @:optional var systemKey:String;
    @:optional var sceneKey:String;
    @:optional var data:Dynamic;
};
