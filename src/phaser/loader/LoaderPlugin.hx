package phaser.loader;

/**
 * @classdesc
 * The Loader handles loading all external content such as Images, Sounds, Texture Atlases and data files.
 * You typically interact with it via `this.load` in your Scene. Scenes can have a `preload` method, which is always
 * called before the Scenes `create` method, allowing you to preload assets that the Scene may need.
 *
 * If you call any `this.load` methods from outside of `Scene.preload` then you need to start the Loader going
 * yourself by calling `Loader.start()`. It's only automatically started during the Scene preload.
 *
 * The Loader uses a combination of tag loading (eg. Audio elements) and XHR and provides progress and completion events.
 * Files are loaded in parallel by default. The amount of concurrent connections can be controlled in your Game Configuration.
 *
 * Once the Loader has started loading you are still able to add files to it. These can be injected as a result of a loader
 * event, the type of file being loaded (such as a pack file) or other external events. As long as the Loader hasn't finished
 * simply adding a new file to it, while running, will ensure it's added into the current queue.
 *
 * Every Scene has its own instance of the Loader and they are bound to the Scene in which they are created. However,
 * assets loaded by the Loader are placed into global game-level caches. For example, loading an XML file will place that
 * file inside `Game.cache.xml`, which is accessible from every Scene in your game, no matter who was responsible
 * for loading it. The same is true of Textures. A texture loaded in one Scene is instantly available to all other Scenes
 * in your game.
 *
 * The Loader works by using custom File Types. These are stored in the FileTypesManager, which injects them into the Loader
 * when it's instantiated. You can create your own custom file types by extending either the File or MultiFile classes.
 * See those files for more details.
 *
 * @class LoaderPlugin
 * @extends Phaser.Events.EventEmitter
 * @memberof Phaser.Loader
 * @constructor
 * @since 3.0.0
 *
 * @param {Phaser.Scene} scene - The Scene which owns this Loader instance.
 */
@:native("Phaser.Loader.LoaderPlugin")
extern class LoaderPlugin extends phaser.events.EventEmitter {
    public function new(scene:phaser.Scene);
    /**
     * The Scene which owns this Loader instance.
     *
     * @name Phaser.Loader.LoaderPlugin#scene
     * @type {Phaser.Scene}
     * @protected
     * @since 3.0.0
     */
    public var scene:phaser.Scene;
    /**
     * A reference to the Scene Systems.
     *
     * @name Phaser.Loader.LoaderPlugin#systems
     * @type {Phaser.Scenes.Systems}
     * @protected
     * @since 3.0.0
     */
    public var systems:phaser.scenes.Systems;
    /**
     * A reference to the global Cache Manager.
     *
     * @name Phaser.Loader.LoaderPlugin#cacheManager
     * @type {Phaser.Cache.CacheManager}
     * @protected
     * @since 3.7.0
     */
    public var cacheManager:phaser.cache.CacheManager;
    /**
     * A reference to the global Texture Manager.
     *
     * @name Phaser.Loader.LoaderPlugin#textureManager
     * @type {Phaser.Textures.TextureManager}
     * @protected
     * @since 3.7.0
     */
    public var textureManager:phaser.textures.TextureManager;
    /**
     * An optional prefix that is automatically prepended to the start of every file key.
     * If prefix was `MENU.` and you load an image with the key 'Background' the resulting key would be `MENU.Background`.
     * You can set this directly, or call `Loader.setPrefix()`. It will then affect every file added to the Loader
     * from that point on. It does _not_ change any file already in the load queue.
     *
     * @name Phaser.Loader.LoaderPlugin#prefix
     * @type {string}
     * @default ''
     * @since 3.7.0
     */
    public var prefix:String;
    /**
     * The value of `path`, if set, is placed before any _relative_ file path given. For example:
     *
     * ```javascript
     * this.load.path = "images/sprites/";
     * this.load.image("ball", "ball.png");
     * this.load.image("tree", "level1/oaktree.png");
     * this.load.image("boom", "http://server.com/explode.png");
     * ```
     *
     * Would load the `ball` file from `images/sprites/ball.png` and the tree from
     * `images/sprites/level1/oaktree.png` but the file `boom` would load from the URL
     * given as it's an absolute URL.
     *
     * Please note that the path is added before the filename but *after* the baseURL (if set.)
     *
     * If you set this property directly then it _must_ end with a "/". Alternatively, call `setPath()` and it'll do it for you.
     *
     * @name Phaser.Loader.LoaderPlugin#path
     * @type {string}
     * @default ''
     * @since 3.0.0
     */
    public var path:String;
    /**
     * If you want to append a URL before the path of any asset you can set this here.
     *
     * Useful if allowing the asset base url to be configured outside of the game code.
     *
     * If you set this property directly then it _must_ end with a "/". Alternatively, call `setBaseURL()` and it'll do it for you.
     *
     * @name Phaser.Loader.LoaderPlugin#baseURL
     * @type {string}
     * @default ''
     * @since 3.0.0
     */
    public var baseURL:String;
    /**
     * The number of concurrent / parallel resources to try and fetch at once.
     *
     * Old browsers limit 6 requests per domain; modern ones, especially those with HTTP/2 don't limit it at all.
     *
     * The default is 32 but you can change this in your Game Config, or by changing this property before the Loader starts.
     *
     * @name Phaser.Loader.LoaderPlugin#maxParallelDownloads
     * @type {integer}
     * @since 3.0.0
     */
    public var maxParallelDownloads:Int;
    /**
     * xhr specific global settings (can be overridden on a per-file basis)
     *
     * @name Phaser.Loader.LoaderPlugin#xhr
     * @type {XHRSettingsObject}
     * @since 3.0.0
     */
    public var xhr:XHRSettingsObject;
    /**
     * The crossOrigin value applied to loaded images. Very often this needs to be set to 'anonymous'.
     *
     * @name Phaser.Loader.LoaderPlugin#crossOrigin
     * @type {string}
     * @since 3.0.0
     */
    public var crossOrigin:String;
    /**
     * The total number of files to load. It may not always be accurate because you may add to the Loader during the process
     * of loading, especially if you load a Pack File. Therefore this value can change, but in most cases remains static.
     *
     * @name Phaser.Loader.LoaderPlugin#totalToLoad
     * @type {integer}
     * @default 0
     * @since 3.0.0
     */
    public var totalToLoad:Int;
    /**
     * The progress of the current load queue, as a float value between 0 and 1.
     * This is updated automatically as files complete loading.
     * Note that it is possible for this value to go down again if you add content to the current load queue during a load.
     *
     * @name Phaser.Loader.LoaderPlugin#progress
     * @type {number}
     * @default 0
     * @since 3.0.0
     */
    public var progress:Float;
    /**
     * Files are placed in this Set when they're added to the Loader via `addFile`.
     *
     * They are moved to the `inflight` Set when they start loading, and assuming a successful
     * load, to the `queue` Set for further processing.
     *
     * By the end of the load process this Set will be empty.
     *
     * @name Phaser.Loader.LoaderPlugin#list
     * @type {Phaser.Structs.Set.<Phaser.Loader.File>}
     * @since 3.0.0
     */
    public var list:Dynamic;
    /**
     * Files are stored in this Set while they're in the process of being loaded.
     *
     * Upon a successful load they are moved to the `queue` Set.
     *
     * By the end of the load process this Set will be empty.
     *
     * @name Phaser.Loader.LoaderPlugin#inflight
     * @type {Phaser.Structs.Set.<Phaser.Loader.File>}
     * @since 3.0.0
     */
    public var inflight:Dynamic;
    /**
     * Files are stored in this Set while they're being processed.
     *
     * If the process is successful they are moved to their final destination, which could be
     * a Cache or the Texture Manager.
     *
     * At the end of the load process this Set will be empty.
     *
     * @name Phaser.Loader.LoaderPlugin#queue
     * @type {Phaser.Structs.Set.<Phaser.Loader.File>}
     * @since 3.0.0
     */
    public var queue:Dynamic;
    /**
     * The total number of files that failed to load during the most recent load.
     * This value is reset when you call `Loader.start`.
     *
     * @name Phaser.Loader.LoaderPlugin#totalFailed
     * @type {integer}
     * @default 0
     * @since 3.7.0
     */
    public var totalFailed:Int;
    /**
     * The total number of files that successfully loaded during the most recent load.
     * This value is reset when you call `Loader.start`.
     *
     * @name Phaser.Loader.LoaderPlugin#totalComplete
     * @type {integer}
     * @default 0
     * @since 3.7.0
     */
    public var totalComplete:Int;
    /**
     * The current state of the Loader.
     *
     * @name Phaser.Loader.LoaderPlugin#state
     * @type {integer}
     * @readonly
     * @since 3.0.0
     */
    public var state:Int;
    /**
     * If you want to append a URL before the path of any asset you can set this here.
     *
     * Useful if allowing the asset base url to be configured outside of the game code.
     *
     * Once a base URL is set it will affect every file loaded by the Loader from that point on. It does _not_ change any
     * file _already_ being loaded. To reset it, call this method with no arguments.
     *
     * @method Phaser.Loader.LoaderPlugin#setBaseURL
     * @since 3.0.0
     *
     * @param {string} [url] - The URL to use. Leave empty to reset.
     *
     * @return {Phaser.Loader.LoaderPlugin} This Loader object.
     */
    public function setBaseURL(?url:String):phaser.loader.LoaderPlugin;
    /**
     * The value of `path`, if set, is placed before any _relative_ file path given. For example:
     *
     * ```javascript
     * this.load.setPath("images/sprites/");
     * this.load.image("ball", "ball.png");
     * this.load.image("tree", "level1/oaktree.png");
     * this.load.image("boom", "http://server.com/explode.png");
     * ```
     *
     * Would load the `ball` file from `images/sprites/ball.png` and the tree from
     * `images/sprites/level1/oaktree.png` but the file `boom` would load from the URL
     * given as it's an absolute URL.
     *
     * Please note that the path is added before the filename but *after* the baseURL (if set.)
     *
     * Once a path is set it will then affect every file added to the Loader from that point on. It does _not_ change any
     * file _already_ in the load queue. To reset it, call this method with no arguments.
     *
     * @method Phaser.Loader.LoaderPlugin#setPath
     * @since 3.0.0
     *
     * @param {string} [path] - The path to use. Leave empty to reset.
     *
     * @return {Phaser.Loader.LoaderPlugin} This Loader object.
     */
    public function setPath(?path:String):phaser.loader.LoaderPlugin;
    /**
     * An optional prefix that is automatically prepended to the start of every file key.
     *
     * If prefix was `MENU.` and you load an image with the key 'Background' the resulting key would be `MENU.Background`.
     *
     * Once a prefix is set it will then affect every file added to the Loader from that point on. It does _not_ change any
     * file _already_ in the load queue. To reset it, call this method with no arguments.
     *
     * @method Phaser.Loader.LoaderPlugin#setPrefix
     * @since 3.7.0
     *
     * @param {string} [prefix] - The prefix to use. Leave empty to reset.
     *
     * @return {Phaser.Loader.LoaderPlugin} This Loader object.
     */
    public function setPrefix(?prefix:String):phaser.loader.LoaderPlugin;
    /**
     * Sets the Cross Origin Resource Sharing value used when loading files.
     *
     * Files can override this value on a per-file basis by specifying an alternative `crossOrigin` value in their file config.
     *
     * Once CORs is set it will then affect every file loaded by the Loader from that point on, as long as they don't have
     * their own CORs setting. To reset it, call this method with no arguments.
     *
     * For more details about CORs see https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS
     *
     * @method Phaser.Loader.LoaderPlugin#setCORS
     * @since 3.0.0
     *
     * @param {string} [crossOrigin] - The value to use for the `crossOrigin` property in the load request.
     *
     * @return {Phaser.Loader.LoaderPlugin} This Loader object.
     */
    public function setCORS(?crossOrigin:String):phaser.loader.LoaderPlugin;
    /**
     * Adds a file, or array of files, into the load queue.
     *
     * The file must be an instance of `Phaser.Loader.File`, or a class that extends it. The Loader will check that the key
     * used by the file won't conflict with any other key either in the loader, the inflight queue or the target cache.
     * If allowed it will then add the file into the pending list, read for the load to start. Or, if the load has already
     * started, ready for the next batch of files to be pulled from the list to the inflight queue.
     *
     * You should not normally call this method directly, but rather use one of the Loader methods like `image` or `atlas`,
     * however you can call this as long as the file given to it is well formed.
     *
     * @method Phaser.Loader.LoaderPlugin#addFile
     * @fires Phaser.Loader.LoaderPlugin#addFileEvent
     * @since 3.0.0
     *
     * @param {(Phaser.Loader.File|Phaser.Loader.File[])} file - The file, or array of files, to be added to the load queue.
     */
    public function addFile(file:Dynamic):Void;
    /**
     * Checks the key and type of the given file to see if it will conflict with anything already
     * in a Cache, the Texture Manager, or the list or inflight queues.
     *
     * @method Phaser.Loader.LoaderPlugin#keyExists
     * @since 3.7.0
     *
     * @param {Phaser.Loader.File} file - The file to check the key of.
     *
     * @return {boolean} `true` if adding this file will cause a cache or queue conflict, otherwise `false`.
     */
    public function keyExists(file:phaser.loader.File):Bool;
    /**
     * Takes a well formed, fully parsed pack file object and adds its entries into the load queue. Usually you do not call
     * this method directly, but instead use `Loader.pack` and supply a path to a JSON file that holds the
     * pack data. However, if you've got the data prepared you can pass it to this method.
     *
     * You can also provide an optional key. If you do then it will only add the entries from that part of the pack into
     * to the load queue. If not specified it will add all entries it finds. For more details about the pack file format
     * see the `LoaderPlugin.pack` method.
     *
     * @method Phaser.Loader.LoaderPlugin#addPack
     * @since 3.7.0
     *
     * @param {any} data - The Pack File data to be parsed and each entry of it to added to the load queue.
     * @param {string} [packKey] - An optional key to use from the pack file data.
     *
     * @return {boolean} `true` if any files were added to the queue, otherwise `false`.
     */
    public function addPack(data:Dynamic, ?packKey:String):Bool;
    /**
     * Is the Loader actively loading, or processing loaded files?
     *
     * @method Phaser.Loader.LoaderPlugin#isLoading
     * @since 3.0.0
     *
     * @return {boolean} `true` if the Loader is busy loading or processing, otherwise `false`.
     */
    public function isLoading():Bool;
    /**
     * Is the Loader ready to start a new load?
     *
     * @method Phaser.Loader.LoaderPlugin#isReady
     * @since 3.0.0
     *
     * @return {boolean} `true` if the Loader is ready to start a new load, otherwise `false`.
     */
    public function isReady():Bool;
    /**
     * Starts the Loader running. This will reset the progress and totals and then emit a `start` event.
     * If there is nothing in the queue the Loader will immediately complete, otherwise it will start
     * loading the first batch of files.
     *
     * The Loader is started automatically if the queue is populated within your Scenes `preload` method.
     *
     * However, outside of this, you need to call this method to start it.
     *
     * If the Loader is already running this method will simply return.
     *
     * @method Phaser.Loader.LoaderPlugin#start
     * @fires Phaser.Loader.LoaderPlugin#startEvent
     * @since 3.0.0
     */
    public function start():Void;
    /**
     * Called automatically during the load process.
     * It updates the `progress` value and then emits a progress event, which you can use to
     * display a loading bar in your game.
     *
     * @method Phaser.Loader.LoaderPlugin#updateProgress
     * @fires Phaser.Loader.LoaderPlugin#progressEvent
     * @since 3.0.0
     */
    public function updateProgress():Void;
    /**
     * Called automatically during the load process.
     *
     * @method Phaser.Loader.LoaderPlugin#update
     * @since 3.10.0
     */
    public function update():Void;
    /**
     * An internal method called automatically by the XHRLoader belong to a File.
     *
     * This method will remove the given file from the inflight Set and update the load progress.
     * If the file was successful its `onProcess` method is called, otherwise it is added to the delete queue.
     *
     * @method Phaser.Loader.LoaderPlugin#nextFile
     * @fires Phaser.Loader.LoaderPlugin#loadEvent
     * @fires Phaser.Loader.LoaderPlugin#loadErrorEvent
     * @since 3.0.0
     *
     * @param {Phaser.Loader.File} file - The File that just finished loading, or errored during load.
     * @param {boolean} success - `true` if the file loaded successfully, otherwise `false`.
     */
    public function nextFile(file:phaser.loader.File, success:Bool):Void;
    /**
     * An internal method that is called automatically by the File when it has finished processing.
     *
     * If the process was successful, and the File isn't part of a MultiFile, its `addToCache` method is called.
     *
     * It this then removed from the queue. If there are no more files to load `loadComplete` is called.
     *
     * @method Phaser.Loader.LoaderPlugin#fileProcessComplete
     * @since 3.7.0
     *
     * @param {Phaser.Loader.File} file - The file that has finished processing.
     */
    public function fileProcessComplete(file:phaser.loader.File):Void;
    /**
     * Called at the end when the load queue is exhausted and all files have either loaded or errored.
     * By this point every loaded file will now be in its associated cache and ready for use.
     *
     * Also clears down the Sets, puts progress to 1 and clears the deletion queue.
     *
     * @method Phaser.Loader.LoaderPlugin#loadComplete
     * @fires Phaser.Loader.LoaderPlugin#completeEvent
     * @since 3.7.0
     */
    public function loadComplete():Void;
    /**
     * Adds a File into the pending-deletion queue.
     *
     * @method Phaser.Loader.LoaderPlugin#flagForRemoval
     * @since 3.7.0
     *
     * @param {Phaser.Loader.File} file - The File to be queued for deletion when the Loader completes.
     */
    public function flagForRemoval(file:phaser.loader.File):Void;
    /**
     * Converts the given JSON data into a file that the browser then prompts you to download so you can save it locally.
     *
     * The data must be well formed JSON and ready-parsed, not a JavaScript object.
     *
     * @method Phaser.Loader.LoaderPlugin#saveJSON
     * @since 3.0.0
     *
     * @param {*} data - The JSON data, ready parsed.
     * @param {string} [filename=file.json] - The name to save the JSON file as.
     *
     * @return {Phaser.Loader.LoaderPlugin} This Loader plugin.
     */
    public function saveJSON(data:Dynamic, ?filename:String):phaser.loader.LoaderPlugin;
    /**
     * Causes the browser to save the given data as a file to its default Downloads folder.
     *
     * Creates a DOM level anchor link, assigns it as being a `download` anchor, sets the href
     * to be an ObjectURL based on the given data, and then invokes a click event.
     *
     * @method Phaser.Loader.LoaderPlugin#save
     * @since 3.0.0
     *
     * @param {*} data - The data to be saved. Will be passed through URL.createObjectURL.
     * @param {string} [filename=file.json] - The filename to save the file as.
     * @param {string} [filetype=application/json] - The file type to use when saving the file. Defaults to JSON.
     *
     * @return {Phaser.Loader.LoaderPlugin} This Loader plugin.
     */
    public function save(data:Dynamic, ?filename:String, ?filetype:String):phaser.loader.LoaderPlugin;
    /**
     * Resets the Loader.
     *
     * This will clear all lists and reset the base URL, path and prefix.
     *
     * Warning: If the Loader is currently downloading files, or has files in its queue, they will be aborted.
     *
     * @method Phaser.Loader.LoaderPlugin#reset
     * @since 3.0.0
     */
    public function reset():Void;
    /**
     * Adds an Animation JSON Data file, or array of Animation JSON files, to the current load queue.
     *
     * You can call this method from within your Scene's `preload`, along with any other files you wish to load:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.animation('baddieAnims', 'files/BaddieAnims.json');
     * }
     * ```
     *
     * The file is **not** loaded right away. It is added to a queue ready to be loaded either when the loader starts,
     * or if it's already running, when the next free load slot becomes available. This happens automatically if you
     * are calling this from within the Scene's `preload` method, or a related callback. Because the file is queued
     * it means you cannot use the file immediately after calling this method, but must wait for the file to complete.
     * The typical flow for a Phaser Scene is that you load assets in the Scene's `preload` method and then when the
     * Scene's `create` method is called you are guaranteed that all of those assets are ready for use and have been
     * loaded.
     *
     * If you call this from outside of `preload` then you are responsible for starting the Loader afterwards and monitoring
     * its events to know when it's safe to use the asset. Please see the Phaser.Loader.LoaderPlugin class for more details.
     *
     * The key must be a unique String. It is used to add the file to the global JSON Cache upon a successful load.
     * The key should be unique both in terms of files being loaded and files already present in the JSON Cache.
     * Loading a file using a key that is already taken will result in a warning. If you wish to replace an existing file
     * then remove it from the JSON Cache first, before loading a new one.
     *
     * Instead of passing arguments you can pass a configuration object, such as:
     *
     * ```javascript
     * this.load.animation({
     *     key: 'baddieAnims',
     *     url: 'files/BaddieAnims.json'
     * });
     * ```
     *
     * See the documentation for `Phaser.Loader.FileTypes.JSONFileConfig` for more details.
     *
     * Once the file has finished loading it will automatically be passed to the global Animation Managers `fromJSON` method.
     * This will parse all of the JSON data and create animation data from it. This process happens at the very end
     * of the Loader, once every other file in the load queue has finished. The reason for this is to allow you to load
     * both animation data and the images it relies upon in the same load call.
     *
     * Once the animation data has been parsed you will be able to play animations using that data.
     * Please see the Animation Manager `fromJSON` method for more details about the format and playback.
     *
     * You can also access the raw animation data from its Cache using its key:
     *
     * ```javascript
     * this.load.animation('baddieAnims', 'files/BaddieAnims.json');
     * // and later in your game ...
     * var data = this.cache.json.get('baddieAnims');
     * ```
     *
     * If you have specified a prefix in the loader, via `Loader.setPrefix` then this value will be prepended to this files
     * key. For example, if the prefix was `LEVEL1.` and the key was `Waves` the final key will be `LEVEL1.Waves` and
     * this is what you would use to retrieve the text from the JSON Cache.
     *
     * The URL can be relative or absolute. If the URL is relative the `Loader.baseURL` and `Loader.path` values will be prepended to it.
     *
     * If the URL isn't specified the Loader will take the key and create a filename from that. For example if the key is "data"
     * and no URL is given then the Loader will set the URL to be "data.json". It will always add `.json` as the extension, although
     * this can be overridden if using an object instead of method arguments. If you do not desire this action then provide a URL.
     *
     * You can also optionally provide a `dataKey` to use. This allows you to extract only a part of the JSON and store it in the Cache,
     * rather than the whole file. For example, if your JSON data had a structure like this:
     *
     * ```json
     * {
     *     "level1": {
     *         "baddies": {
     *             "aliens": {},
     *             "boss": {}
     *         }
     *     },
     *     "level2": {},
     *     "level3": {}
     * }
     * ```
     *
     * And if you only wanted to create animations from the `boss` data, then you could pass `level1.baddies.boss`as the `dataKey`.
     *
     * Note: The ability to load this type of file will only be available if the JSON File type has been built into Phaser.
     * It is available in the default build but can be excluded from custom builds.
     *
     * @method Phaser.Loader.LoaderPlugin#animation
     * @fires Phaser.Loader.LoaderPlugin#addFileEvent
     * @since 3.0.0
     *
     * @param {(string|Phaser.Loader.FileTypes.JSONFileConfig|Phaser.Loader.FileTypes.JSONFileConfig[])} key - The key to use for this file, or a file configuration object, or array of them.
     * @param {string} [url] - The absolute or relative URL to load this file from. If undefined or `null` it will be set to `<key>.json`, i.e. if `key` was "alien" then the URL will be "alien.json".
     * @param {string} [dataKey] - When the Animation JSON file loads only this property will be stored in the Cache and used to create animation data.
     * @param {XHRSettingsObject} [xhrSettings] - An XHR Settings configuration object. Used in replacement of the Loaders default XHR Settings.
     *
     * @return {Phaser.Loader.LoaderPlugin} The Loader instance.
     */
    public function animation(key:Dynamic, ?url:String, ?dataKey:String, ?xhrSettings:XHRSettingsObject):phaser.loader.LoaderPlugin;
    /**
     * Adds a JSON based Texture Atlas, or array of atlases, to the current load queue.
     *
     * You can call this method from within your Scene's `preload`, along with any other files you wish to load:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.atlas('mainmenu', 'images/MainMenu.png', 'images/MainMenu.json');
     * }
     * ```
     *
     * The file is **not** loaded right away. It is added to a queue ready to be loaded either when the loader starts,
     * or if it's already running, when the next free load slot becomes available. This happens automatically if you
     * are calling this from within the Scene's `preload` method, or a related callback. Because the file is queued
     * it means you cannot use the file immediately after calling this method, but must wait for the file to complete.
     * The typical flow for a Phaser Scene is that you load assets in the Scene's `preload` method and then when the
     * Scene's `create` method is called you are guaranteed that all of those assets are ready for use and have been
     * loaded.
     *
     * If you call this from outside of `preload` then you are responsible for starting the Loader afterwards and monitoring
     * its events to know when it's safe to use the asset. Please see the Phaser.Loader.LoaderPlugin class for more details.
     *
     * Phaser expects the atlas data to be provided in a JSON file, using either the JSON Hash or JSON Array format.
     * These files are created by software such as Texture Packer, Shoebox and Adobe Flash / Animate.
     * If you are using Texture Packer and have enabled multi-atlas support, then please use the Phaser Multi Atlas loader
     * instead of this one.
     *
     * Phaser can load all common image types: png, jpg, gif and any other format the browser can natively handle.
     *
     * The key must be a unique String. It is used to add the file to the global Texture Manager upon a successful load.
     * The key should be unique both in terms of files being loaded and files already present in the Texture Manager.
     * Loading a file using a key that is already taken will result in a warning. If you wish to replace an existing file
     * then remove it from the Texture Manager first, before loading a new one.
     *
     * Instead of passing arguments you can pass a configuration object, such as:
     *
     * ```javascript
     * this.load.atlas({
     *     key: 'mainmenu',
     *     textureURL: 'images/MainMenu.png',
     *     atlasURL: 'images/MainMenu.json'
     * });
     * ```
     *
     * See the documentation for `Phaser.Loader.FileTypes.AtlasJSONFileConfig` for more details.
     *
     * Instead of passing a URL for the atlas JSON data you can also pass in a well formed JSON object instead.
     *
     * Once the atlas has finished loading you can use frames from it as textures for a Game Object by referencing its key:
     *
     * ```javascript
     * this.load.atlas('mainmenu', 'images/MainMenu.png', 'images/MainMenu.json');
     * // and later in your game ...
     * this.add.image(x, y, 'mainmenu', 'background');
     * ```
     *
     * To get a list of all available frames within an atlas please consult your Texture Atlas software.
     *
     * If you have specified a prefix in the loader, via `Loader.setPrefix` then this value will be prepended to this files
     * key. For example, if the prefix was `MENU.` and the key was `Background` the final key will be `MENU.Background` and
     * this is what you would use to retrieve the image from the Texture Manager.
     *
     * The URL can be relative or absolute. If the URL is relative the `Loader.baseURL` and `Loader.path` values will be prepended to it.
     *
     * If the URL isn't specified the Loader will take the key and create a filename from that. For example if the key is "alien"
     * and no URL is given then the Loader will set the URL to be "alien.png". It will always add `.png` as the extension, although
     * this can be overridden if using an object instead of method arguments. If you do not desire this action then provide a URL.
     *
     * Phaser also supports the automatic loading of associated normal maps. If you have a normal map to go with this image,
     * then you can specify it by providing an array as the `url` where the second element is the normal map:
     *
     * ```javascript
     * this.load.atlas('mainmenu', [ 'images/MainMenu.png', 'images/MainMenu-n.png' ], 'images/MainMenu.json');
     * ```
     *
     * Or, if you are using a config object use the `normalMap` property:
     *
     * ```javascript
     * this.load.atlas({
     *     key: 'mainmenu',
     *     textureURL: 'images/MainMenu.png',
     *     normalMap: 'images/MainMenu-n.png',
     *     atlasURL: 'images/MainMenu.json'
     * });
     * ```
     *
     * The normal map file is subject to the same conditions as the image file with regard to the path, baseURL, CORs and XHR Settings.
     * Normal maps are a WebGL only feature.
     *
     * Note: The ability to load this type of file will only be available if the Atlas JSON File type has been built into Phaser.
     * It is available in the default build but can be excluded from custom builds.
     *
     * @method Phaser.Loader.LoaderPlugin#atlas
     * @fires Phaser.Loader.LoaderPlugin#addFileEvent
     * @since 3.0.0
     *
     * @param {(string|Phaser.Loader.FileTypes.AtlasJSONFileConfig|Phaser.Loader.FileTypes.AtlasJSONFileConfig[])} key - The key to use for this file, or a file configuration object, or array of them.
     * @param {string|string[]} [textureURL] - The absolute or relative URL to load the texture image file from. If undefined or `null` it will be set to `<key>.png`, i.e. if `key` was "alien" then the URL will be "alien.png".
     * @param {string} [atlasURL] - The absolute or relative URL to load the texture atlas json data file from. If undefined or `null` it will be set to `<key>.json`, i.e. if `key` was "alien" then the URL will be "alien.json".
     * @param {XHRSettingsObject} [textureXhrSettings] - An XHR Settings configuration object for the atlas image file. Used in replacement of the Loaders default XHR Settings.
     * @param {XHRSettingsObject} [atlasXhrSettings] - An XHR Settings configuration object for the atlas json file. Used in replacement of the Loaders default XHR Settings.
     *
     * @return {Phaser.Loader.LoaderPlugin} The Loader instance.
     */
    public function atlas(key:Dynamic, ?textureURL:Dynamic, ?atlasURL:String, ?textureXhrSettings:XHRSettingsObject, ?atlasXhrSettings:XHRSettingsObject):phaser.loader.LoaderPlugin;
    /**
     * Adds an XML based Texture Atlas, or array of atlases, to the current load queue.
     *
     * You can call this method from within your Scene's `preload`, along with any other files you wish to load:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.atlasXML('mainmenu', 'images/MainMenu.png', 'images/MainMenu.xml');
     * }
     * ```
     *
     * The file is **not** loaded right away. It is added to a queue ready to be loaded either when the loader starts,
     * or if it's already running, when the next free load slot becomes available. This happens automatically if you
     * are calling this from within the Scene's `preload` method, or a related callback. Because the file is queued
     * it means you cannot use the file immediately after calling this method, but must wait for the file to complete.
     * The typical flow for a Phaser Scene is that you load assets in the Scene's `preload` method and then when the
     * Scene's `create` method is called you are guaranteed that all of those assets are ready for use and have been
     * loaded.
     *
     * If you call this from outside of `preload` then you are responsible for starting the Loader afterwards and monitoring
     * its events to know when it's safe to use the asset. Please see the Phaser.Loader.LoaderPlugin class for more details.
     *
     * Phaser expects the atlas data to be provided in an XML file format.
     * These files are created by software such as Shoebox and Adobe Flash / Animate.
     *
     * Phaser can load all common image types: png, jpg, gif and any other format the browser can natively handle.
     *
     * The key must be a unique String. It is used to add the file to the global Texture Manager upon a successful load.
     * The key should be unique both in terms of files being loaded and files already present in the Texture Manager.
     * Loading a file using a key that is already taken will result in a warning. If you wish to replace an existing file
     * then remove it from the Texture Manager first, before loading a new one.
     *
     * Instead of passing arguments you can pass a configuration object, such as:
     *
     * ```javascript
     * this.load.atlasXML({
     *     key: 'mainmenu',
     *     textureURL: 'images/MainMenu.png',
     *     atlasURL: 'images/MainMenu.xml'
     * });
     * ```
     *
     * See the documentation for `Phaser.Loader.FileTypes.AtlasXMLFileConfig` for more details.
     *
     * Once the atlas has finished loading you can use frames from it as textures for a Game Object by referencing its key:
     *
     * ```javascript
     * this.load.atlasXML('mainmenu', 'images/MainMenu.png', 'images/MainMenu.xml');
     * // and later in your game ...
     * this.add.image(x, y, 'mainmenu', 'background');
     * ```
     *
     * To get a list of all available frames within an atlas please consult your Texture Atlas software.
     *
     * If you have specified a prefix in the loader, via `Loader.setPrefix` then this value will be prepended to this files
     * key. For example, if the prefix was `MENU.` and the key was `Background` the final key will be `MENU.Background` and
     * this is what you would use to retrieve the image from the Texture Manager.
     *
     * The URL can be relative or absolute. If the URL is relative the `Loader.baseURL` and `Loader.path` values will be prepended to it.
     *
     * If the URL isn't specified the Loader will take the key and create a filename from that. For example if the key is "alien"
     * and no URL is given then the Loader will set the URL to be "alien.png". It will always add `.png` as the extension, although
     * this can be overridden if using an object instead of method arguments. If you do not desire this action then provide a URL.
     *
     * Phaser also supports the automatic loading of associated normal maps. If you have a normal map to go with this image,
     * then you can specify it by providing an array as the `url` where the second element is the normal map:
     *
     * ```javascript
     * this.load.atlasXML('mainmenu', [ 'images/MainMenu.png', 'images/MainMenu-n.png' ], 'images/MainMenu.xml');
     * ```
     *
     * Or, if you are using a config object use the `normalMap` property:
     *
     * ```javascript
     * this.load.atlasXML({
     *     key: 'mainmenu',
     *     textureURL: 'images/MainMenu.png',
     *     normalMap: 'images/MainMenu-n.png',
     *     atlasURL: 'images/MainMenu.xml'
     * });
     * ```
     *
     * The normal map file is subject to the same conditions as the image file with regard to the path, baseURL, CORs and XHR Settings.
     * Normal maps are a WebGL only feature.
     *
     * Note: The ability to load this type of file will only be available if the Atlas XML File type has been built into Phaser.
     * It is available in the default build but can be excluded from custom builds.
     *
     * @method Phaser.Loader.LoaderPlugin#atlasXML
     * @fires Phaser.Loader.LoaderPlugin#addFileEvent
     * @since 3.7.0
     *
     * @param {(string|Phaser.Loader.FileTypes.AtlasXMLFileConfig|Phaser.Loader.FileTypes.AtlasXMLFileConfig[])} key - The key to use for this file, or a file configuration object, or array of them.
     * @param {string|string[]} [textureURL] - The absolute or relative URL to load the texture image file from. If undefined or `null` it will be set to `<key>.png`, i.e. if `key` was "alien" then the URL will be "alien.png".
     * @param {string} [atlasURL] - The absolute or relative URL to load the texture atlas xml data file from. If undefined or `null` it will be set to `<key>.xml`, i.e. if `key` was "alien" then the URL will be "alien.xml".
     * @param {XHRSettingsObject} [textureXhrSettings] - An XHR Settings configuration object for the atlas image file. Used in replacement of the Loaders default XHR Settings.
     * @param {XHRSettingsObject} [atlasXhrSettings] - An XHR Settings configuration object for the atlas xml file. Used in replacement of the Loaders default XHR Settings.
     *
     * @return {Phaser.Loader.LoaderPlugin} The Loader instance.
     */
    public function atlasXML(key:Dynamic, ?textureURL:Dynamic, ?atlasURL:String, ?textureXhrSettings:XHRSettingsObject, ?atlasXhrSettings:XHRSettingsObject):phaser.loader.LoaderPlugin;
    /**
     * Adds an Audio or HTML5Audio file, or array of audio files, to the current load queue.
     *
     * You can call this method from within your Scene's `preload`, along with any other files you wish to load:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.audio('title', [ 'music/Title.ogg', 'music/Title.mp3', 'music/Title.m4a' ]);
     * }
     * ```
     *
     * The file is **not** loaded right away. It is added to a queue ready to be loaded either when the loader starts,
     * or if it's already running, when the next free load slot becomes available. This happens automatically if you
     * are calling this from within the Scene's `preload` method, or a related callback. Because the file is queued
     * it means you cannot use the file immediately after calling this method, but must wait for the file to complete.
     * The typical flow for a Phaser Scene is that you load assets in the Scene's `preload` method and then when the
     * Scene's `create` method is called you are guaranteed that all of those assets are ready for use and have been
     * loaded.
     *
     * The key must be a unique String. It is used to add the file to the global Audio Cache upon a successful load.
     * The key should be unique both in terms of files being loaded and files already present in the Audio Cache.
     * Loading a file using a key that is already taken will result in a warning. If you wish to replace an existing file
     * then remove it from the Audio Cache first, before loading a new one.
     *
     * Instead of passing arguments you can pass a configuration object, such as:
     *
     * ```javascript
     * this.load.audio({
     *     key: 'title',
     *     url: [ 'music/Title.ogg', 'music/Title.mp3', 'music/Title.m4a' ]
     * });
     * ```
     *
     * See the documentation for `Phaser.Loader.FileTypes.AudioFileConfig` for more details.
     *
     * The URLs can be relative or absolute. If the URLs are relative the `Loader.baseURL` and `Loader.path` values will be prepended to them.
     *
     * Due to different browsers supporting different audio file types you should usually provide your audio files in a variety of formats.
     * ogg, mp3 and m4a are the most common. If you provide an array of URLs then the Loader will determine which _one_ file to load based on
     * browser support.
     *
     * If audio has been disabled in your game, either via the game config, or lack of support from the device, then no audio will be loaded.
     *
     * Note: The ability to load this type of file will only be available if the Audio File type has been built into Phaser.
     * It is available in the default build but can be excluded from custom builds.
     *
     * @method Phaser.Loader.LoaderPlugin#audio
     * @fires Phaser.Loader.LoaderPlugin#addFileEvent
     * @since 3.0.0
     *
     * @param {(string|Phaser.Loader.FileTypes.AudioFileConfig|Phaser.Loader.FileTypes.AudioFileConfig[])} key - The key to use for this file, or a file configuration object, or array of them.
     * @param {(string|string[])} [urls] - The absolute or relative URL to load the audio files from.
     * @param {any} [config] - An object containing an `instances` property for HTML5Audio. Defaults to 1.
     * @param {XHRSettingsObject} [xhrSettings] - An XHR Settings configuration object. Used in replacement of the Loaders default XHR Settings.
     *
     * @return {Phaser.Loader.LoaderPlugin} The Loader instance.
     */
    public function audio(key:Dynamic, ?urls:Dynamic, ?config:Dynamic, ?xhrSettings:XHRSettingsObject):phaser.loader.LoaderPlugin;
    /**
     * Adds a JSON based Audio Sprite, or array of audio sprites, to the current load queue.
     *
     * You can call this method from within your Scene's `preload`, along with any other files you wish to load:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.audioSprite('kyobi', 'kyobi.json', [
     *         'kyobi.ogg',
     *         'kyobi.mp3',
     *         'kyobi.m4a'
     *     ]);
     * }
     * ```
     *
     * Audio Sprites are a combination of audio files and a JSON configuration.
     * The JSON follows the format of that created by https://github.com/tonistiigi/audiosprite
     *
     * If the JSON file includes a 'resource' object then you can let Phaser parse it and load the audio
     * files automatically based on its content. To do this exclude the audio URLs from the load:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.audioSprite('kyobi', 'kyobi.json');
     * }
     * ```
     *
     * The file is **not** loaded right away. It is added to a queue ready to be loaded either when the loader starts,
     * or if it's already running, when the next free load slot becomes available. This happens automatically if you
     * are calling this from within the Scene's `preload` method, or a related callback. Because the file is queued
     * it means you cannot use the file immediately after calling this method, but must wait for the file to complete.
     * The typical flow for a Phaser Scene is that you load assets in the Scene's `preload` method and then when the
     * Scene's `create` method is called you are guaranteed that all of those assets are ready for use and have been
     * loaded.
     *
     * If you call this from outside of `preload` then you are responsible for starting the Loader afterwards and monitoring
     * its events to know when it's safe to use the asset. Please see the Phaser.Loader.LoaderPlugin class for more details.
     *
     * The key must be a unique String. It is used to add the file to the global Audio Cache upon a successful load.
     * The key should be unique both in terms of files being loaded and files already present in the Audio Cache.
     * Loading a file using a key that is already taken will result in a warning. If you wish to replace an existing file
     * then remove it from the Audio Cache first, before loading a new one.
     *
     * Instead of passing arguments you can pass a configuration object, such as:
     *
     * ```javascript
     * this.load.audioSprite({
     *     key: 'kyobi',
     *     jsonURL: 'audio/Kyobi.json',
     *     audioURL: [
     *         'audio/Kyobi.ogg',
     *         'audio/Kyobi.mp3',
     *         'audio/Kyobi.m4a'
     *     ]
     * });
     * ```
     *
     * See the documentation for `Phaser.Loader.FileTypes.AudioSpriteFileConfig` for more details.
     *
     * Instead of passing a URL for the audio JSON data you can also pass in a well formed JSON object instead.
     *
     * Once the audio has finished loading you can use it create an Audio Sprite by referencing its key:
     *
     * ```javascript
     * this.load.audioSprite('kyobi', 'kyobi.json');
     * // and later in your game ...
     * var music = this.sound.addAudioSprite('kyobi');
     * music.play('title');
     * ```
     *
     * If you have specified a prefix in the loader, via `Loader.setPrefix` then this value will be prepended to this files
     * key. For example, if the prefix was `MENU.` and the key was `Background` the final key will be `MENU.Background` and
     * this is what you would use to retrieve the image from the Texture Manager.
     *
     * The URL can be relative or absolute. If the URL is relative the `Loader.baseURL` and `Loader.path` values will be prepended to it.
     *
     * Due to different browsers supporting different audio file types you should usually provide your audio files in a variety of formats.
     * ogg, mp3 and m4a are the most common. If you provide an array of URLs then the Loader will determine which _one_ file to load based on
     * browser support.
     *
     * If audio has been disabled in your game, either via the game config, or lack of support from the device, then no audio will be loaded.
     *
     * Note: The ability to load this type of file will only be available if the Audio Sprite File type has been built into Phaser.
     * It is available in the default build but can be excluded from custom builds.
     *
     * @method Phaser.Loader.LoaderPlugin#audioSprite
     * @fires Phaser.Loader.LoaderPlugin#addFileEvent
     * @since 3.0.0
     *
     * @param {(string|Phaser.Loader.FileTypes.AudioSpriteFileConfig|Phaser.Loader.FileTypes.AudioSpriteFileConfig[])} key - The key to use for this file, or a file configuration object, or an array of objects.
     * @param {string} jsonURL - The absolute or relative URL to load the json file from. Or a well formed JSON object to use instead.
     * @param {(string|string[])} [audioURL] - The absolute or relative URL to load the audio file from. If empty it will be obtained by parsing the JSON file.
     * @param {any} [audioConfig] - The audio configuration options.
     * @param {XHRSettingsObject} [audioXhrSettings] - An XHR Settings configuration object for the audio file. Used in replacement of the Loaders default XHR Settings.
     * @param {XHRSettingsObject} [jsonXhrSettings] - An XHR Settings configuration object for the json file. Used in replacement of the Loaders default XHR Settings.
     *
     * @return {Phaser.Loader.LoaderPlugin} The Loader.
     */
    public function audioSprite(key:Dynamic, jsonURL:String, ?audioURL:Dynamic, ?audioConfig:Dynamic, ?audioXhrSettings:XHRSettingsObject, ?jsonXhrSettings:XHRSettingsObject):phaser.loader.LoaderPlugin;
    /**
     * Adds a Binary file, or array of Binary files, to the current load queue.
     *
     * You can call this method from within your Scene's `preload`, along with any other files you wish to load:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.binary('doom', 'files/Doom.wad');
     * }
     * ```
     *
     * The file is **not** loaded right away. It is added to a queue ready to be loaded either when the loader starts,
     * or if it's already running, when the next free load slot becomes available. This happens automatically if you
     * are calling this from within the Scene's `preload` method, or a related callback. Because the file is queued
     * it means you cannot use the file immediately after calling this method, but must wait for the file to complete.
     * The typical flow for a Phaser Scene is that you load assets in the Scene's `preload` method and then when the
     * Scene's `create` method is called you are guaranteed that all of those assets are ready for use and have been
     * loaded.
     *
     * The key must be a unique String. It is used to add the file to the global Binary Cache upon a successful load.
     * The key should be unique both in terms of files being loaded and files already present in the Binary Cache.
     * Loading a file using a key that is already taken will result in a warning. If you wish to replace an existing file
     * then remove it from the Binary Cache first, before loading a new one.
     *
     * Instead of passing arguments you can pass a configuration object, such as:
     *
     * ```javascript
     * this.load.binary({
     *     key: 'doom',
     *     url: 'files/Doom.wad',
     *     dataType: Uint8Array
     * });
     * ```
     *
     * See the documentation for `Phaser.Loader.FileTypes.BinaryFileConfig` for more details.
     *
     * Once the file has finished loading you can access it from its Cache using its key:
     *
     * ```javascript
     * this.load.binary('doom', 'files/Doom.wad');
     * // and later in your game ...
     * var data = this.cache.binary.get('doom');
     * ```
     *
     * If you have specified a prefix in the loader, via `Loader.setPrefix` then this value will be prepended to this files
     * key. For example, if the prefix was `LEVEL1.` and the key was `Data` the final key will be `LEVEL1.Data` and
     * this is what you would use to retrieve the text from the Binary Cache.
     *
     * The URL can be relative or absolute. If the URL is relative the `Loader.baseURL` and `Loader.path` values will be prepended to it.
     *
     * If the URL isn't specified the Loader will take the key and create a filename from that. For example if the key is "doom"
     * and no URL is given then the Loader will set the URL to be "doom.bin". It will always add `.bin` as the extension, although
     * this can be overridden if using an object instead of method arguments. If you do not desire this action then provide a URL.
     *
     * Note: The ability to load this type of file will only be available if the Binary File type has been built into Phaser.
     * It is available in the default build but can be excluded from custom builds.
     *
     * @method Phaser.Loader.LoaderPlugin#binary
     * @fires Phaser.Loader.LoaderPlugin#addFileEvent
     * @since 3.0.0
     *
     * @param {(string|Phaser.Loader.FileTypes.BinaryFileConfig|Phaser.Loader.FileTypes.BinaryFileConfig[])} key - The key to use for this file, or a file configuration object, or array of them.
     * @param {string} [url] - The absolute or relative URL to load this file from. If undefined or `null` it will be set to `<key>.bin`, i.e. if `key` was "alien" then the URL will be "alien.bin".
     * @param {any} [dataType] - Optional type to cast the binary file to once loaded. For example, `Uint8Array`.
     * @param {XHRSettingsObject} [xhrSettings] - An XHR Settings configuration object. Used in replacement of the Loaders default XHR Settings.
     *
     * @return {Phaser.Loader.LoaderPlugin} The Loader instance.
     */
    public function binary(key:Dynamic, ?url:String, ?dataType:Dynamic, ?xhrSettings:XHRSettingsObject):phaser.loader.LoaderPlugin;
    /**
     * Adds an XML based Bitmap Font, or array of fonts, to the current load queue.
     *
     * You can call this method from within your Scene's `preload`, along with any other files you wish to load:
     
     * ```javascript
     * function preload ()
     * {
     *     this.load.bitmapFont('goldenFont', 'images/GoldFont.png', 'images/GoldFont.xml');
     * }
     * ```
     *
     * The file is **not** loaded right away. It is added to a queue ready to be loaded either when the loader starts,
     * or if it's already running, when the next free load slot becomes available. This happens automatically if you
     * are calling this from within the Scene's `preload` method, or a related callback. Because the file is queued
     * it means you cannot use the file immediately after calling this method, but must wait for the file to complete.
     * The typical flow for a Phaser Scene is that you load assets in the Scene's `preload` method and then when the
     * Scene's `create` method is called you are guaranteed that all of those assets are ready for use and have been
     * loaded.
     *
     * If you call this from outside of `preload` then you are responsible for starting the Loader afterwards and monitoring
     * its events to know when it's safe to use the asset. Please see the Phaser.Loader.LoaderPlugin class for more details.
     *
     * Phaser expects the font data to be provided in an XML file format.
     * These files are created by software such as the [Angelcode Bitmap Font Generator](http://www.angelcode.com/products/bmfont/),
     * [Littera](http://kvazars.com/littera/) or [Glyph Designer](https://71squared.com/glyphdesigner)
     *
     * Phaser can load all common image types: png, jpg, gif and any other format the browser can natively handle.
     *
     * The key must be a unique String. It is used to add the file to the global Texture Manager upon a successful load.
     * The key should be unique both in terms of files being loaded and files already present in the Texture Manager.
     * Loading a file using a key that is already taken will result in a warning. If you wish to replace an existing file
     * then remove it from the Texture Manager first, before loading a new one.
     *
     * Instead of passing arguments you can pass a configuration object, such as:
     *
     * ```javascript
     * this.load.bitmapFont({
     *     key: 'goldenFont',
     *     textureURL: 'images/GoldFont.png',
     *     fontDataURL: 'images/GoldFont.xml'
     * });
     * ```
     *
     * See the documentation for `Phaser.Loader.FileTypes.BitmapFontFileConfig` for more details.
     *
     * Once the atlas has finished loading you can use key of it when creating a Bitmap Text Game Object:
     *
     * ```javascript
     * this.load.bitmapFont('goldenFont', 'images/GoldFont.png', 'images/GoldFont.xml');
     * // and later in your game ...
     * this.add.bitmapText(x, y, 'goldenFont', 'Hello World');
     * ```
     *
     * If you have specified a prefix in the loader, via `Loader.setPrefix` then this value will be prepended to this files
     * key. For example, if the prefix was `MENU.` and the key was `Background` the final key will be `MENU.Background` and
     * this is what you would use when creating a Bitmap Text object.
     *
     * The URL can be relative or absolute. If the URL is relative the `Loader.baseURL` and `Loader.path` values will be prepended to it.
     *
     * If the URL isn't specified the Loader will take the key and create a filename from that. For example if the key is "alien"
     * and no URL is given then the Loader will set the URL to be "alien.png". It will always add `.png` as the extension, although
     * this can be overridden if using an object instead of method arguments. If you do not desire this action then provide a URL.
     *
     * Phaser also supports the automatic loading of associated normal maps. If you have a normal map to go with this image,
     * then you can specify it by providing an array as the `url` where the second element is the normal map:
     *
     * ```javascript
     * this.load.bitmapFont('goldenFont', [ 'images/GoldFont.png', 'images/GoldFont-n.png' ], 'images/GoldFont.xml');
     * ```
     *
     * Or, if you are using a config object use the `normalMap` property:
     *
     * ```javascript
     * this.load.bitmapFont({
     *     key: 'goldenFont',
     *     textureURL: 'images/GoldFont.png',
     *     normalMap: 'images/GoldFont-n.png',
     *     fontDataURL: 'images/GoldFont.xml'
     * });
     * ```
     *
     * The normal map file is subject to the same conditions as the image file with regard to the path, baseURL, CORs and XHR Settings.
     * Normal maps are a WebGL only feature.
     *
     * Note: The ability to load this type of file will only be available if the Bitmap Font File type has been built into Phaser.
     * It is available in the default build but can be excluded from custom builds.
     *
     * @method Phaser.Loader.LoaderPlugin#bitmapFont
     * @fires Phaser.Loader.LoaderPlugin#addFileEvent
     * @since 3.0.0
     *
     * @param {(string|Phaser.Loader.FileTypes.BitmapFontFileConfig|Phaser.Loader.FileTypes.BitmapFontFileConfig[])} key - The key to use for this file, or a file configuration object, or array of them.
     * @param {string|string[]} [textureURL] - The absolute or relative URL to load the font image file from. If undefined or `null` it will be set to `<key>.png`, i.e. if `key` was "alien" then the URL will be "alien.png".
     * @param {string} [fontDataURL] - The absolute or relative URL to load the font xml data file from. If undefined or `null` it will be set to `<key>.xml`, i.e. if `key` was "alien" then the URL will be "alien.xml".
     * @param {XHRSettingsObject} [textureXhrSettings] - An XHR Settings configuration object for the font image file. Used in replacement of the Loaders default XHR Settings.
     * @param {XHRSettingsObject} [fontDataXhrSettings] - An XHR Settings configuration object for the font data xml file. Used in replacement of the Loaders default XHR Settings.
     *
     * @return {Phaser.Loader.LoaderPlugin} The Loader instance.
     */
    public function bitmapFont(key:Dynamic, ?textureURL:Dynamic, ?fontDataURL:String, ?textureXhrSettings:XHRSettingsObject, ?fontDataXhrSettings:XHRSettingsObject):phaser.loader.LoaderPlugin;
    /**
     * Adds a GLSL file, or array of GLSL files, to the current load queue.
     * In Phaser 3 GLSL files are just plain Text files at the current moment in time.
     *
     * You can call this method from within your Scene's `preload`, along with any other files you wish to load:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.glsl('plasma', 'shaders/Plasma.glsl');
     * }
     * ```
     *
     * The file is **not** loaded right away. It is added to a queue ready to be loaded either when the loader starts,
     * or if it's already running, when the next free load slot becomes available. This happens automatically if you
     * are calling this from within the Scene's `preload` method, or a related callback. Because the file is queued
     * it means you cannot use the file immediately after calling this method, but must wait for the file to complete.
     * The typical flow for a Phaser Scene is that you load assets in the Scene's `preload` method and then when the
     * Scene's `create` method is called you are guaranteed that all of those assets are ready for use and have been
     * loaded.
     *
     * The key must be a unique String. It is used to add the file to the global Shader Cache upon a successful load.
     * The key should be unique both in terms of files being loaded and files already present in the Shader Cache.
     * Loading a file using a key that is already taken will result in a warning. If you wish to replace an existing file
     * then remove it from the Shader Cache first, before loading a new one.
     *
     * Instead of passing arguments you can pass a configuration object, such as:
     *
     * ```javascript
     * this.load.glsl({
     *     key: 'plasma',
     *     url: 'shaders/Plasma.glsl'
     * });
     * ```
     *
     * See the documentation for `Phaser.Loader.FileTypes.GLSLFileConfig` for more details.
     *
     * Once the file has finished loading you can access it from its Cache using its key:
     *
     * ```javascript
     * this.load.glsl('plasma', 'shaders/Plasma.glsl');
     * // and later in your game ...
     * var data = this.cache.shader.get('plasma');
     * ```
     *
     * If you have specified a prefix in the loader, via `Loader.setPrefix` then this value will be prepended to this files
     * key. For example, if the prefix was `FX.` and the key was `Plasma` the final key will be `FX.Plasma` and
     * this is what you would use to retrieve the text from the Shader Cache.
     *
     * The URL can be relative or absolute. If the URL is relative the `Loader.baseURL` and `Loader.path` values will be prepended to it.
     *
     * If the URL isn't specified the Loader will take the key and create a filename from that. For example if the key is "plasma"
     * and no URL is given then the Loader will set the URL to be "plasma.glsl". It will always add `.glsl` as the extension, although
     * this can be overridden if using an object instead of method arguments. If you do not desire this action then provide a URL.
     *
     * Note: The ability to load this type of file will only be available if the GLSL File type has been built into Phaser.
     * It is available in the default build but can be excluded from custom builds.
     *
     * @method Phaser.Loader.LoaderPlugin#glsl
     * @fires Phaser.Loader.LoaderPlugin#addFileEvent
     * @since 3.0.0
     *
     * @param {(string|Phaser.Loader.FileTypes.GLSLFileConfig|Phaser.Loader.FileTypes.GLSLFileConfig[])} key - The key to use for this file, or a file configuration object, or array of them.
     * @param {string} [url] - The absolute or relative URL to load this file from. If undefined or `null` it will be set to `<key>.glsl`, i.e. if `key` was "alien" then the URL will be "alien.glsl".
     * @param {XHRSettingsObject} [xhrSettings] - An XHR Settings configuration object. Used in replacement of the Loaders default XHR Settings.
     *
     * @return {Phaser.Loader.LoaderPlugin} The Loader instance.
     */
    public function glsl(key:Dynamic, ?url:String, ?xhrSettings:XHRSettingsObject):phaser.loader.LoaderPlugin;
    /**
     * Adds an HTML file, or array of HTML files, to the current load queue.
     *
     * You can call this method from within your Scene's `preload`, along with any other files you wish to load:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.html('story', 'files/LoginForm.html');
     * }
     * ```
     *
     * The file is **not** loaded right away. It is added to a queue ready to be loaded either when the loader starts,
     * or if it's already running, when the next free load slot becomes available. This happens automatically if you
     * are calling this from within the Scene's `preload` method, or a related callback. Because the file is queued
     * it means you cannot use the file immediately after calling this method, but must wait for the file to complete.
     * The typical flow for a Phaser Scene is that you load assets in the Scene's `preload` method and then when the
     * Scene's `create` method is called you are guaranteed that all of those assets are ready for use and have been
     * loaded.
     *
     * The key must be a unique String. It is used to add the file to the global HTML Cache upon a successful load.
     * The key should be unique both in terms of files being loaded and files already present in the HTML Cache.
     * Loading a file using a key that is already taken will result in a warning. If you wish to replace an existing file
     * then remove it from the HTML Cache first, before loading a new one.
     *
     * Instead of passing arguments you can pass a configuration object, such as:
     *
     * ```javascript
     * this.load.html({
     *     key: 'login',
     *     url: 'files/LoginForm.html'
     * });
     * ```
     *
     * See the documentation for `Phaser.Loader.FileTypes.HTMLFileConfig` for more details.
     *
     * Once the file has finished loading you can access it from its Cache using its key:
     *
     * ```javascript
     * this.load.html('login', 'files/LoginForm.html');
     * // and later in your game ...
     * var data = this.cache.html.get('login');
     * ```
     *
     * If you have specified a prefix in the loader, via `Loader.setPrefix` then this value will be prepended to this files
     * key. For example, if the prefix was `LEVEL1.` and the key was `Story` the final key will be `LEVEL1.Story` and
     * this is what you would use to retrieve the html from the HTML Cache.
     *
     * The URL can be relative or absolute. If the URL is relative the `Loader.baseURL` and `Loader.path` values will be prepended to it.
     *
     * If the URL isn't specified the Loader will take the key and create a filename from that. For example if the key is "story"
     * and no URL is given then the Loader will set the URL to be "story.html". It will always add `.html` as the extension, although
     * this can be overridden if using an object instead of method arguments. If you do not desire this action then provide a URL.
     *
     * Note: The ability to load this type of file will only be available if the HTML File type has been built into Phaser.
     * It is available in the default build but can be excluded from custom builds.
     *
     * @method Phaser.Loader.LoaderPlugin#html
     * @fires Phaser.Loader.LoaderPlugin#addFileEvent
     * @since 3.12.0
     *
     * @param {(string|Phaser.Loader.FileTypes.HTMLFileConfig|Phaser.Loader.FileTypes.HTMLFileConfig[])} key - The key to use for this file, or a file configuration object, or array of them.
     * @param {string} [url] - The absolute or relative URL to load this file from. If undefined or `null` it will be set to `<key>.html`, i.e. if `key` was "alien" then the URL will be "alien.html".
     * @param {XHRSettingsObject} [xhrSettings] - An XHR Settings configuration object. Used in replacement of the Loaders default XHR Settings.
     *
     * @return {Phaser.Loader.LoaderPlugin} The Loader instance.
     */
    public function html(key:Dynamic, ?url:String, ?xhrSettings:XHRSettingsObject):phaser.loader.LoaderPlugin;
    /**
     * Adds an HTML File, or array of HTML Files, to the current load queue. When the files are loaded they
     * will be rendered to textures and stored in the Texture Manager.
     *
     * You can call this method from within your Scene's `preload`, along with any other files you wish to load:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.htmlTexture('instructions', 'content/intro.html', 256, 512);
     * }
     * ```
     *
     * The file is **not** loaded right away. It is added to a queue ready to be loaded either when the loader starts,
     * or if it's already running, when the next free load slot becomes available. This happens automatically if you
     * are calling this from within the Scene's `preload` method, or a related callback. Because the file is queued
     * it means you cannot use the file immediately after calling this method, but must wait for the file to complete.
     * The typical flow for a Phaser Scene is that you load assets in the Scene's `preload` method and then when the
     * Scene's `create` method is called you are guaranteed that all of those assets are ready for use and have been
     * loaded.
     *
     * The key must be a unique String. It is used to add the file to the global Texture Manager upon a successful load.
     * The key should be unique both in terms of files being loaded and files already present in the Texture Manager.
     * Loading a file using a key that is already taken will result in a warning. If you wish to replace an existing file
     * then remove it from the Texture Manager first, before loading a new one.
     *
     * Instead of passing arguments you can pass a configuration object, such as:
     *
     * ```javascript
     * this.load.htmlTexture({
     *     key: 'instructions',
     *     url: 'content/intro.html',
     *     width: 256,
     *     height: 512
     * });
     * ```
     *
     * See the documentation for `Phaser.Loader.FileTypes.HTMLTextureFileConfig` for more details.
     *
     * Once the file has finished loading you can use it as a texture for a Game Object by referencing its key:
     *
     * ```javascript
     * this.load.htmlTexture('instructions', 'content/intro.html', 256, 512);
     * // and later in your game ...
     * this.add.image(x, y, 'instructions');
     * ```
     *
     * If you have specified a prefix in the loader, via `Loader.setPrefix` then this value will be prepended to this files
     * key. For example, if the prefix was `MENU.` and the key was `Background` the final key will be `MENU.Background` and
     * this is what you would use to retrieve the image from the Texture Manager.
     *
     * The URL can be relative or absolute. If the URL is relative the `Loader.baseURL` and `Loader.path` values will be prepended to it.
     *
     * If the URL isn't specified the Loader will take the key and create a filename from that. For example if the key is "alien"
     * and no URL is given then the Loader will set the URL to be "alien.html". It will always add `.html` as the extension, although
     * this can be overridden if using an object instead of method arguments. If you do not desire this action then provide a URL.
     *
     * The width and height are the size of the texture to which the HTML will be rendered. It's not possible to determine these
     * automatically, so you will need to provide them, either as arguments or in the file config object.
     * When the HTML file has loaded a new SVG element is created with a size and viewbox set to the width and height given.
     * The SVG file has a body tag added to it, with the HTML file contents included. It then calls `window.Blob` on the SVG,
     * and if successful is added to the Texture Manager, otherwise it fails processing. The overall quality of the rendered
     * HTML depends on your browser, and some of them may not even support the svg / blob process used. Be aware that there are
     * limitations on what HTML can be inside an SVG. You can find out more details in this
     * [Mozilla MDN entry](https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API/Drawing_DOM_objects_into_a_canvas).
     *
     * Note: The ability to load this type of file will only be available if the HTMLTextureFile File type has been built into Phaser.
     * It is available in the default build but can be excluded from custom builds.
     *
     * @method Phaser.Loader.LoaderPlugin#htmlTexture
     * @fires Phaser.Loader.LoaderPlugin#addFileEvent
     * @since 3.12.0
     *
     * @param {(string|Phaser.Loader.FileTypes.HTMLTextureFileConfig|Phaser.Loader.FileTypes.HTMLTextureFileConfig[])} key - The key to use for this file, or a file configuration object, or array of them.
     * @param {string} [url] - The absolute or relative URL to load this file from. If undefined or `null` it will be set to `<key>.html`, i.e. if `key` was "alien" then the URL will be "alien.html".
     * @param {integer} [width=512] - The width of the texture the HTML will be rendered to.
     * @param {integer} [height=512] - The height of the texture the HTML will be rendered to.
     * @param {XHRSettingsObject} [xhrSettings] - An XHR Settings configuration object. Used in replacement of the Loaders default XHR Settings.
     *
     * @return {Phaser.Loader.LoaderPlugin} The Loader instance.
     */
    public function htmlTexture(key:Dynamic, ?url:String, ?width:Int, ?height:Int, ?xhrSettings:XHRSettingsObject):phaser.loader.LoaderPlugin;
    /**
     * Adds an Image, or array of Images, to the current load queue.
     *
     * You can call this method from within your Scene's `preload`, along with any other files you wish to load:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.image('logo', 'images/phaserLogo.png');
     * }
     * ```
     *
     * The file is **not** loaded right away. It is added to a queue ready to be loaded either when the loader starts,
     * or if it's already running, when the next free load slot becomes available. This happens automatically if you
     * are calling this from within the Scene's `preload` method, or a related callback. Because the file is queued
     * it means you cannot use the file immediately after calling this method, but must wait for the file to complete.
     * The typical flow for a Phaser Scene is that you load assets in the Scene's `preload` method and then when the
     * Scene's `create` method is called you are guaranteed that all of those assets are ready for use and have been
     * loaded.
     *
     * Phaser can load all common image types: png, jpg, gif and any other format the browser can natively handle.
     * If you try to load an animated gif only the first frame will be rendered. Browsers do not natively support playback
     * of animated gifs to Canvas elements.
     *
     * The key must be a unique String. It is used to add the file to the global Texture Manager upon a successful load.
     * The key should be unique both in terms of files being loaded and files already present in the Texture Manager.
     * Loading a file using a key that is already taken will result in a warning. If you wish to replace an existing file
     * then remove it from the Texture Manager first, before loading a new one.
     *
     * Instead of passing arguments you can pass a configuration object, such as:
     *
     * ```javascript
     * this.load.image({
     *     key: 'logo',
     *     url: 'images/AtariLogo.png'
     * });
     * ```
     *
     * See the documentation for `Phaser.Loader.FileTypes.ImageFileConfig` for more details.
     *
     * Once the file has finished loading you can use it as a texture for a Game Object by referencing its key:
     *
     * ```javascript
     * this.load.image('logo', 'images/AtariLogo.png');
     * // and later in your game ...
     * this.add.image(x, y, 'logo');
     * ```
     *
     * If you have specified a prefix in the loader, via `Loader.setPrefix` then this value will be prepended to this files
     * key. For example, if the prefix was `MENU.` and the key was `Background` the final key will be `MENU.Background` and
     * this is what you would use to retrieve the image from the Texture Manager.
     *
     * The URL can be relative or absolute. If the URL is relative the `Loader.baseURL` and `Loader.path` values will be prepended to it.
     *
     * If the URL isn't specified the Loader will take the key and create a filename from that. For example if the key is "alien"
     * and no URL is given then the Loader will set the URL to be "alien.png". It will always add `.png` as the extension, although
     * this can be overridden if using an object instead of method arguments. If you do not desire this action then provide a URL.
     *
     * Phaser also supports the automatic loading of associated normal maps. If you have a normal map to go with this image,
     * then you can specify it by providing an array as the `url` where the second element is the normal map:
     *
     * ```javascript
     * this.load.image('logo', [ 'images/AtariLogo.png', 'images/AtariLogo-n.png' ]);
     * ```
     *
     * Or, if you are using a config object use the `normalMap` property:
     *
     * ```javascript
     * this.load.image({
     *     key: 'logo',
     *     url: 'images/AtariLogo.png',
     *     normalMap: 'images/AtariLogo-n.png'
     * });
     * ```
     *
     * The normal map file is subject to the same conditions as the image file with regard to the path, baseURL, CORs and XHR Settings.
     * Normal maps are a WebGL only feature.
     *
     * Note: The ability to load this type of file will only be available if the Image File type has been built into Phaser.
     * It is available in the default build but can be excluded from custom builds.
     *
     * @method Phaser.Loader.LoaderPlugin#image
     * @fires Phaser.Loader.LoaderPlugin#addFileEvent
     * @since 3.0.0
     *
     * @param {(string|Phaser.Loader.FileTypes.ImageFileConfig|Phaser.Loader.FileTypes.ImageFileConfig[])} key - The key to use for this file, or a file configuration object, or array of them.
     * @param {string|string[]} [url] - The absolute or relative URL to load this file from. If undefined or `null` it will be set to `<key>.png`, i.e. if `key` was "alien" then the URL will be "alien.png".
     * @param {XHRSettingsObject} [xhrSettings] - An XHR Settings configuration object. Used in replacement of the Loaders default XHR Settings.
     *
     * @return {Phaser.Loader.LoaderPlugin} The Loader instance.
     */
    public function image(key:Dynamic, ?url:Dynamic, ?xhrSettings:XHRSettingsObject):phaser.loader.LoaderPlugin;
    /**
     * Adds a JSON file, or array of JSON files, to the current load queue.
     *
     * You can call this method from within your Scene's `preload`, along with any other files you wish to load:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.json('wavedata', 'files/AlienWaveData.json');
     * }
     * ```
     *
     * The file is **not** loaded right away. It is added to a queue ready to be loaded either when the loader starts,
     * or if it's already running, when the next free load slot becomes available. This happens automatically if you
     * are calling this from within the Scene's `preload` method, or a related callback. Because the file is queued
     * it means you cannot use the file immediately after calling this method, but must wait for the file to complete.
     * The typical flow for a Phaser Scene is that you load assets in the Scene's `preload` method and then when the
     * Scene's `create` method is called you are guaranteed that all of those assets are ready for use and have been
     * loaded.
     *
     * The key must be a unique String. It is used to add the file to the global JSON Cache upon a successful load.
     * The key should be unique both in terms of files being loaded and files already present in the JSON Cache.
     * Loading a file using a key that is already taken will result in a warning. If you wish to replace an existing file
     * then remove it from the JSON Cache first, before loading a new one.
     *
     * Instead of passing arguments you can pass a configuration object, such as:
     *
     * ```javascript
     * this.load.json({
     *     key: 'wavedata',
     *     url: 'files/AlienWaveData.json'
     * });
     * ```
     *
     * See the documentation for `Phaser.Loader.FileTypes.JSONFileConfig` for more details.
     *
     * Once the file has finished loading you can access it from its Cache using its key:
     *
     * ```javascript
     * this.load.json('wavedata', 'files/AlienWaveData.json');
     * // and later in your game ...
     * var data = this.cache.json.get('wavedata');
     * ```
     *
     * If you have specified a prefix in the loader, via `Loader.setPrefix` then this value will be prepended to this files
     * key. For example, if the prefix was `LEVEL1.` and the key was `Waves` the final key will be `LEVEL1.Waves` and
     * this is what you would use to retrieve the text from the JSON Cache.
     *
     * The URL can be relative or absolute. If the URL is relative the `Loader.baseURL` and `Loader.path` values will be prepended to it.
     *
     * If the URL isn't specified the Loader will take the key and create a filename from that. For example if the key is "data"
     * and no URL is given then the Loader will set the URL to be "data.json". It will always add `.json` as the extension, although
     * this can be overridden if using an object instead of method arguments. If you do not desire this action then provide a URL.
     *
     * You can also optionally provide a `dataKey` to use. This allows you to extract only a part of the JSON and store it in the Cache,
     * rather than the whole file. For example, if your JSON data had a structure like this:
     *
     * ```json
     * {
     *     "level1": {
     *         "baddies": {
     *             "aliens": {},
     *             "boss": {}
     *         }
     *     },
     *     "level2": {},
     *     "level3": {}
     * }
     * ```
     *
     * And you only wanted to store the `boss` data in the Cache, then you could pass `level1.baddies.boss`as the `dataKey`.
     *
     * Note: The ability to load this type of file will only be available if the JSON File type has been built into Phaser.
     * It is available in the default build but can be excluded from custom builds.
     *
     * @method Phaser.Loader.LoaderPlugin#json
     * @fires Phaser.Loader.LoaderPlugin#addFileEvent
     * @since 3.0.0
     *
     * @param {(string|Phaser.Loader.FileTypes.JSONFileConfig|Phaser.Loader.FileTypes.JSONFileConfig[])} key - The key to use for this file, or a file configuration object, or array of them.
     * @param {string} [url] - The absolute or relative URL to load this file from. If undefined or `null` it will be set to `<key>.json`, i.e. if `key` was "alien" then the URL will be "alien.json".
     * @param {string} [dataKey] - When the JSON file loads only this property will be stored in the Cache.
     * @param {XHRSettingsObject} [xhrSettings] - An XHR Settings configuration object. Used in replacement of the Loaders default XHR Settings.
     *
     * @return {Phaser.Loader.LoaderPlugin} The Loader instance.
     */
    public function json(key:Dynamic, ?url:String, ?dataKey:String, ?xhrSettings:XHRSettingsObject):phaser.loader.LoaderPlugin;
    /**
     * Adds a Multi Texture Atlas, or array of multi atlases, to the current load queue.
     *
     * You can call this method from within your Scene's `preload`, along with any other files you wish to load:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.multiatlas('level1', 'images/Level1.json');
     * }
     * ```
     *
     * The file is **not** loaded right away. It is added to a queue ready to be loaded either when the loader starts,
     * or if it's already running, when the next free load slot becomes available. This happens automatically if you
     * are calling this from within the Scene's `preload` method, or a related callback. Because the file is queued
     * it means you cannot use the file immediately after calling this method, but must wait for the file to complete.
     * The typical flow for a Phaser Scene is that you load assets in the Scene's `preload` method and then when the
     * Scene's `create` method is called you are guaranteed that all of those assets are ready for use and have been
     * loaded.
     *
     * If you call this from outside of `preload` then you are responsible for starting the Loader afterwards and monitoring
     * its events to know when it's safe to use the asset. Please see the Phaser.Loader.LoaderPlugin class for more details.
     *
     * Phaser expects the atlas data to be provided in a JSON file as exported from the application Texture Packer,
     * version 4.6.3 or above, where you have made sure to use the Phaser 3 Export option.
     *
     * The way it works internally is that you provide a URL to the JSON file. Phaser then loads this JSON, parses it and
     * extracts which texture files it also needs to load to complete the process. If the JSON also defines normal maps,
     * Phaser will load those as well.
     *
     * The key must be a unique String. It is used to add the file to the global Texture Manager upon a successful load.
     * The key should be unique both in terms of files being loaded and files already present in the Texture Manager.
     * Loading a file using a key that is already taken will result in a warning. If you wish to replace an existing file
     * then remove it from the Texture Manager first, before loading a new one.
     *
     * Instead of passing arguments you can pass a configuration object, such as:
     *
     * ```javascript
     * this.load.multiatlas({
     *     key: 'level1',
     *     atlasURL: 'images/Level1.json'
     * });
     * ```
     *
     * See the documentation for `Phaser.Loader.FileTypes.MultiAtlasFileConfig` for more details.
     *
     * Instead of passing a URL for the atlas JSON data you can also pass in a well formed JSON object instead.
     *
     * Once the atlas has finished loading you can use frames from it as textures for a Game Object by referencing its key:
     *
     * ```javascript
     * this.load.multiatlas('level1', 'images/Level1.json');
     * // and later in your game ...
     * this.add.image(x, y, 'level1', 'background');
     * ```
     *
     * To get a list of all available frames within an atlas please consult your Texture Atlas software.
     *
     * If you have specified a prefix in the loader, via `Loader.setPrefix` then this value will be prepended to this files
     * key. For example, if the prefix was `MENU.` and the key was `Background` the final key will be `MENU.Background` and
     * this is what you would use to retrieve the image from the Texture Manager.
     *
     * The URL can be relative or absolute. If the URL is relative the `Loader.baseURL` and `Loader.path` values will be prepended to it.
     *
     * If the URL isn't specified the Loader will take the key and create a filename from that. For example if the key is "alien"
     * and no URL is given then the Loader will set the URL to be "alien.png". It will always add `.png` as the extension, although
     * this can be overridden if using an object instead of method arguments. If you do not desire this action then provide a URL.
     *
     * Note: The ability to load this type of file will only be available if the Multi Atlas File type has been built into Phaser.
     * It is available in the default build but can be excluded from custom builds.
     *
     * @method Phaser.Loader.LoaderPlugin#multiatlas
     * @fires Phaser.Loader.LoaderPlugin#addFileEvent
     * @since 3.7.0
     *
     * @param {(string|Phaser.Loader.FileTypes.MultiAtlasFileConfig|Phaser.Loader.FileTypes.MultiAtlasFileConfig[])} key - The key to use for this file, or a file configuration object, or array of them.
     * @param {string} [atlasURL] - The absolute or relative URL to load the texture atlas json data file from. If undefined or `null` it will be set to `<key>.json`, i.e. if `key` was "alien" then the URL will be "alien.json".
     * @param {string} [path] - Optional path to use when loading the textures defined in the atlas data.
     * @param {string} [baseURL] - Optional Base URL to use when loading the textures defined in the atlas data.
     * @param {XHRSettingsObject} [atlasXhrSettings] - An XHR Settings configuration object for the atlas json file. Used in replacement of the Loaders default XHR Settings.
     *
     * @return {Phaser.Loader.LoaderPlugin} The Loader instance.
     */
    public function multiatlas(key:Dynamic, ?atlasURL:String, ?path:String, ?baseURL:String, ?atlasXhrSettings:XHRSettingsObject):phaser.loader.LoaderPlugin;
    /**
     * Adds a JSON File Pack, or array of packs, to the current load queue.
     *
     * You can call this method from within your Scene's `preload`, along with any other files you wish to load:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.pack('level1', 'data/Level1Files.json');
     * }
     * ```
     *
     * A File Pack is a JSON file (or object) that contains details about other files that should be added into the Loader.
     * Here is a small example:
     *
     * ```json
     * {
     *    "test1": {
     *        "files": [
     *            {
     *                "type": "image",
     *                "key": "taikodrummaster",
     *                "url": "assets/pics/taikodrummaster.jpg"
     *            },
     *            {
     *                "type": "image",
     *                "key": "sukasuka-chtholly",
     *                "url": "assets/pics/sukasuka-chtholly.png"
     *            }
     *        ]
     *    },
     *    "meta": {
     *        "generated": "1401380327373",
     *        "app": "Phaser 3 Asset Packer",
     *        "url": "https://phaser.io",
     *        "version": "1.0",
     *        "copyright": "Photon Storm Ltd. 2018"
     *    }
     * }
     * ```
     *
     * The pack can be split into sections. In the example above you'll see a section called `test1. You can tell
     * the `load.pack` method to parse only a particular section of a pack. The pack is stored in the JSON Cache,
     * so you can pass it to the Loader to process additional sections as needed in your game, or you can just load
     * them all at once without specifying anything.
     *
     * The pack file can contain an entry for any type of file that Phaser can load. The object structures exactly
     * match that of the file type configs, and all properties available within the file type configs can be used
     * in the pack file too.
     *
     * The file is **not** loaded right away. It is added to a queue ready to be loaded either when the loader starts,
     * or if it's already running, when the next free load slot becomes available. This happens automatically if you
     * are calling this from within the Scene's `preload` method, or a related callback. Because the file is queued
     * it means you cannot use the file immediately after calling this method, but must wait for the file to complete.
     * The typical flow for a Phaser Scene is that you load assets in the Scene's `preload` method and then when the
     * Scene's `create` method is called you are guaranteed that all of those assets are ready for use and have been
     * loaded.
     *
     * If you call this from outside of `preload` then you are responsible for starting the Loader afterwards and monitoring
     * its events to know when it's safe to use the asset. Please see the Phaser.Loader.LoaderPlugin class for more details.
     *
     * The key must be a unique String. It is used to add the file to the global JSON Cache upon a successful load.
     * The key should be unique both in terms of files being loaded and files already present in the JSON Cache.
     * Loading a file using a key that is already taken will result in a warning. If you wish to replace an existing file
     * then remove it from the JSON Cache first, before loading a new one.
     *
     * Instead of passing arguments you can pass a configuration object, such as:
     *
     * ```javascript
     * this.load.pack({
     *     key: 'level1',
     *     url: 'data/Level1Files.json'
     * });
     * ```
     *
     * See the documentation for `Phaser.Loader.FileTypes.PackFileConfig` for more details.
     *
     * If you have specified a prefix in the loader, via `Loader.setPrefix` then this value will be prepended to this files
     * key. For example, if the prefix was `LEVEL1.` and the key was `Waves` the final key will be `LEVEL1.Waves` and
     * this is what you would use to retrieve the text from the JSON Cache.
     *
     * The URL can be relative or absolute. If the URL is relative the `Loader.baseURL` and `Loader.path` values will be prepended to it.
     *
     * If the URL isn't specified the Loader will take the key and create a filename from that. For example if the key is "data"
     * and no URL is given then the Loader will set the URL to be "data.json". It will always add `.json` as the extension, although
     * this can be overridden if using an object instead of method arguments. If you do not desire this action then provide a URL.
     *
     * You can also optionally provide a `dataKey` to use. This allows you to extract only a part of the JSON and store it in the Cache,
     * rather than the whole file. For example, if your JSON data had a structure like this:
     *
     * ```json
     * {
     *     "level1": {
     *         "baddies": {
     *             "aliens": {},
     *             "boss": {}
     *         }
     *     },
     *     "level2": {},
     *     "level3": {}
     * }
     * ```
     *
     * And you only wanted to store the `boss` data in the Cache, then you could pass `level1.baddies.boss`as the `dataKey`.
     *
     * Note: The ability to load this type of file will only be available if the Pack File type has been built into Phaser.
     * It is available in the default build but can be excluded from custom builds.
     *
     * @method Phaser.Loader.LoaderPlugin#pack
     * @fires Phaser.Loader.LoaderPlugin#addFileEvent
     * @since 3.7.0
     *
     * @param {(string|Phaser.Loader.FileTypes.PackFileConfig|Phaser.Loader.FileTypes.PackFileConfig[])} key - The key to use for this file, or a file configuration object, or array of them.
     * @param {string} [url] - The absolute or relative URL to load this file from. If undefined or `null` it will be set to `<key>.json`, i.e. if `key` was "alien" then the URL will be "alien.json".
     * @param {string} [dataKey] - When the JSON file loads only this property will be stored in the Cache.
     * @param {XHRSettingsObject} [xhrSettings] - An XHR Settings configuration object. Used in replacement of the Loaders default XHR Settings.
     *
     * @return {Phaser.Loader.LoaderPlugin} The Loader instance.
     */
    public function pack(key:Dynamic, ?url:String, ?dataKey:String, ?xhrSettings:XHRSettingsObject):phaser.loader.LoaderPlugin;
    /**
     * Adds a Plugin Script file, or array of plugin files, to the current load queue.
     *
     * You can call this method from within your Scene's `preload`, along with any other files you wish to load:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.plugin('modplayer', 'plugins/ModPlayer.js');
     * }
     * ```
     *
     * The file is **not** loaded right away. It is added to a queue ready to be loaded either when the loader starts,
     * or if it's already running, when the next free load slot becomes available. This happens automatically if you
     * are calling this from within the Scene's `preload` method, or a related callback. Because the file is queued
     * it means you cannot use the file immediately after calling this method, but must wait for the file to complete.
     * The typical flow for a Phaser Scene is that you load assets in the Scene's `preload` method and then when the
     * Scene's `create` method is called you are guaranteed that all of those assets are ready for use and have been
     * loaded.
     *
     * The key must be a unique String and not already in-use by another file in the Loader.
     *
     * Instead of passing arguments you can pass a configuration object, such as:
     *
     * ```javascript
     * this.load.plugin({
     *     key: 'modplayer',
     *     url: 'plugins/ModPlayer.js'
     * });
     * ```
     *
     * See the documentation for `Phaser.Loader.FileTypes.PluginFileConfig` for more details.
     *
     * Once the file has finished loading it will automatically be converted into a script element
     * via `document.createElement('script')`. It will have its language set to JavaScript, `defer` set to
     * false and then the resulting element will be appended to `document.head`. Any code then in the
     * script will be executed. It will then be passed to the Phaser PluginCache.register method.
     *
     * The URL can be relative or absolute. If the URL is relative the `Loader.baseURL` and `Loader.path` values will be prepended to it.
     *
     * If the URL isn't specified the Loader will take the key and create a filename from that. For example if the key is "alien"
     * and no URL is given then the Loader will set the URL to be "alien.js". It will always add `.js` as the extension, although
     * this can be overridden if using an object instead of method arguments. If you do not desire this action then provide a URL.
     *
     * Note: The ability to load this type of file will only be available if the Plugin File type has been built into Phaser.
     * It is available in the default build but can be excluded from custom builds.
     *
     * @method Phaser.Loader.LoaderPlugin#plugin
     * @fires Phaser.Loader.LoaderPlugin#addFileEvent
     * @since 3.0.0
     *
     * @param {(string|Phaser.Loader.FileTypes.PluginFileConfig|Phaser.Loader.FileTypes.PluginFileConfig[])} key - The key to use for this file, or a file configuration object, or array of them.
     * @param {(string|function)} [url] - The absolute or relative URL to load this file from. If undefined or `null` it will be set to `<key>.js`, i.e. if `key` was "alien" then the URL will be "alien.js". Or, a plugin function.
     * @param {boolean} [start] - The plugin mapping configuration object.
     * @param {string} [mapping] - If this plugin is to be injected into the Scene, this is the property key used.
     * @param {XHRSettingsObject} [xhrSettings] - An XHR Settings configuration object. Used in replacement of the Loaders default XHR Settings.
     *
     * @return {Phaser.Loader.LoaderPlugin} The Loader instance.
     */
    public function plugin(key:Dynamic, ?url:Dynamic, ?start:Bool, ?mapping:String, ?xhrSettings:XHRSettingsObject):phaser.loader.LoaderPlugin;
    /**
     * Adds an SVG File, or array of SVG Files, to the current load queue. When the files are loaded they
     * will be rendered to bitmap textures and stored in the Texture Manager.
     *
     * You can call this method from within your Scene's `preload`, along with any other files you wish to load:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.svg('morty', 'images/Morty.svg');
     * }
     * ```
     *
     * The file is **not** loaded right away. It is added to a queue ready to be loaded either when the loader starts,
     * or if it's already running, when the next free load slot becomes available. This happens automatically if you
     * are calling this from within the Scene's `preload` method, or a related callback. Because the file is queued
     * it means you cannot use the file immediately after calling this method, but must wait for the file to complete.
     * The typical flow for a Phaser Scene is that you load assets in the Scene's `preload` method and then when the
     * Scene's `create` method is called you are guaranteed that all of those assets are ready for use and have been
     * loaded.
     *
     * The key must be a unique String. It is used to add the file to the global Texture Manager upon a successful load.
     * The key should be unique both in terms of files being loaded and files already present in the Texture Manager.
     * Loading a file using a key that is already taken will result in a warning. If you wish to replace an existing file
     * then remove it from the Texture Manager first, before loading a new one.
     *
     * Instead of passing arguments you can pass a configuration object, such as:
     *
     * ```javascript
     * this.load.svg({
     *     key: 'morty',
     *     url: 'images/Morty.svg'
     * });
     * ```
     *
     * See the documentation for `Phaser.Loader.FileTypes.SVGFileConfig` for more details.
     *
     * Once the file has finished loading you can use it as a texture for a Game Object by referencing its key:
     *
     * ```javascript
     * this.load.svg('morty', 'images/Morty.svg');
     * // and later in your game ...
     * this.add.image(x, y, 'morty');
     * ```
     *
     * If you have specified a prefix in the loader, via `Loader.setPrefix` then this value will be prepended to this files
     * key. For example, if the prefix was `MENU.` and the key was `Background` the final key will be `MENU.Background` and
     * this is what you would use to retrieve the image from the Texture Manager.
     *
     * The URL can be relative or absolute. If the URL is relative the `Loader.baseURL` and `Loader.path` values will be prepended to it.
     *
     * If the URL isn't specified the Loader will take the key and create a filename from that. For example if the key is "alien"
     * and no URL is given then the Loader will set the URL to be "alien.html". It will always add `.html` as the extension, although
     * this can be overridden if using an object instead of method arguments. If you do not desire this action then provide a URL.
     *
     * You can optionally pass an SVG Resize Configuration object when you load an SVG file. By default the SVG will be rendered to a texture
     * at the same size defined in the SVG file attributes. However, this isn't always desirable. You may wish to resize the SVG (either down
     * or up) to improve texture clarity, or reduce texture memory consumption. You can either specify an exact width and height to resize
     * the SVG to:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.svg('morty', 'images/Morty.svg', { width: 300, height: 600 });
     * }
     * ```
     *
     * Or when using a configuration object:
     *
     * ```javascript
     * this.load.svg({
     *     key: 'morty',
     *     url: 'images/Morty.svg',
     *     svgConfig: {
     *         width: 300,
     *         height: 600
     *     }
     * });
     * ```
     *
     * Alternatively, you can just provide a scale factor instead:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.svg('morty', 'images/Morty.svg', { scale: 2.5 });
     * }
     * ```
     *
     * Or when using a configuration object:
     *
     * ```javascript
     * this.load.svg({
     *     key: 'morty',
     *     url: 'images/Morty.svg',
     *     svgConfig: {
     *         scale: 2.5
     *     }
     * });
     * ```
     *
     * If scale, width and height values are all given, the scale has priority and the width and height values are ignored.
     *
     * Note: The ability to load this type of file will only be available if the SVG File type has been built into Phaser.
     * It is available in the default build but can be excluded from custom builds.
     *
     * @method Phaser.Loader.LoaderPlugin#svg
     * @fires Phaser.Loader.LoaderPlugin#addFileEvent
     * @since 3.0.0
     *
     * @param {(string|Phaser.Loader.FileTypes.SVGFileConfig|Phaser.Loader.FileTypes.SVGFileConfig[])} key - The key to use for this file, or a file configuration object, or array of them.
     * @param {string} [url] - The absolute or relative URL to load this file from. If undefined or `null` it will be set to `<key>.svg`, i.e. if `key` was "alien" then the URL will be "alien.svg".
     * @param {Phaser.Loader.FileTypes.SVGSizeConfig} [svgConfig] - The svg size configuration object.
     * @param {XHRSettingsObject} [xhrSettings] - An XHR Settings configuration object. Used in replacement of the Loaders default XHR Settings.
     *
     * @return {Phaser.Loader.LoaderPlugin} The Loader instance.
     */
    public function svg(key:Dynamic, ?url:String, ?svgConfig:phaser.loader.filetypes.SVGSizeConfig, ?xhrSettings:XHRSettingsObject):phaser.loader.LoaderPlugin;
    /**
     * Adds a Scene Plugin Script file, or array of plugin files, to the current load queue.
     *
     * You can call this method from within your Scene's `preload`, along with any other files you wish to load:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.scenePlugin('ModPlayer', 'plugins/ModPlayer.js', 'modPlayer', 'mods');
     * }
     * ```
     *
     * The file is **not** loaded right away. It is added to a queue ready to be loaded either when the loader starts,
     * or if it's already running, when the next free load slot becomes available. This happens automatically if you
     * are calling this from within the Scene's `preload` method, or a related callback. Because the file is queued
     * it means you cannot use the file immediately after calling this method, but must wait for the file to complete.
     * The typical flow for a Phaser Scene is that you load assets in the Scene's `preload` method and then when the
     * Scene's `create` method is called you are guaranteed that all of those assets are ready for use and have been
     * loaded.
     *
     * The key must be a unique String and not already in-use by another file in the Loader.
     *
     * Instead of passing arguments you can pass a configuration object, such as:
     *
     * ```javascript
     * this.load.scenePlugin({
     *     key: 'modplayer',
     *     url: 'plugins/ModPlayer.js'
     * });
     * ```
     *
     * See the documentation for `Phaser.Loader.FileTypes.ScenePluginFileConfig` for more details.
     *
     * Once the file has finished loading it will automatically be converted into a script element
     * via `document.createElement('script')`. It will have its language set to JavaScript, `defer` set to
     * false and then the resulting element will be appended to `document.head`. Any code then in the
     * script will be executed. It will then be passed to the Phaser PluginCache.register method.
     *
     * The URL can be relative or absolute. If the URL is relative the `Loader.baseURL` and `Loader.path` values will be prepended to it.
     *
     * If the URL isn't specified the Loader will take the key and create a filename from that. For example if the key is "alien"
     * and no URL is given then the Loader will set the URL to be "alien.js". It will always add `.js` as the extension, although
     * this can be overridden if using an object instead of method arguments. If you do not desire this action then provide a URL.
     *
     * Note: The ability to load this type of file will only be available if the Script File type has been built into Phaser.
     * It is available in the default build but can be excluded from custom builds.
     *
     * @method Phaser.Loader.LoaderPlugin#scenePlugin
     * @fires Phaser.Loader.LoaderPlugin#addFileEvent
     * @since 3.8.0
     *
     * @param {(string|Phaser.Loader.FileTypes.ScenePluginFileConfig|Phaser.Loader.FileTypes.ScenePluginFileConfig[])} key - The key to use for this file, or a file configuration object, or array of them.
     * @param {(string|function)} [url] - The absolute or relative URL to load this file from. If undefined or `null` it will be set to `<key>.js`, i.e. if `key` was "alien" then the URL will be "alien.js". Or, set to a plugin function.
     * @param {string} [systemKey] - If this plugin is to be added to Scene.Systems, this is the property key for it.
     * @param {string} [sceneKey] - If this plugin is to be added to the Scene, this is the property key for it.
     * @param {XHRSettingsObject} [xhrSettings] - An XHR Settings configuration object. Used in replacement of the Loaders default XHR Settings.
     *
     * @return {Phaser.Loader.LoaderPlugin} The Loader instance.
     */
    public function scenePlugin(key:Dynamic, ?url:Dynamic, ?systemKey:String, ?sceneKey:String, ?xhrSettings:XHRSettingsObject):phaser.loader.LoaderPlugin;
    /**
     * Adds a Script file, or array of Script files, to the current load queue.
     *
     * You can call this method from within your Scene's `preload`, along with any other files you wish to load:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.script('aliens', 'lib/aliens.js');
     * }
     * ```
     *
     * The file is **not** loaded right away. It is added to a queue ready to be loaded either when the loader starts,
     * or if it's already running, when the next free load slot becomes available. This happens automatically if you
     * are calling this from within the Scene's `preload` method, or a related callback. Because the file is queued
     * it means you cannot use the file immediately after calling this method, but must wait for the file to complete.
     * The typical flow for a Phaser Scene is that you load assets in the Scene's `preload` method and then when the
     * Scene's `create` method is called you are guaranteed that all of those assets are ready for use and have been
     * loaded.
     *
     * The key must be a unique String and not already in-use by another file in the Loader.
     *
     * Instead of passing arguments you can pass a configuration object, such as:
     *
     * ```javascript
     * this.load.script({
     *     key: 'aliens',
     *     url: 'lib/aliens.js'
     * });
     * ```
     *
     * See the documentation for `Phaser.Loader.FileTypes.ScriptFileConfig` for more details.
     *
     * Once the file has finished loading it will automatically be converted into a script element
     * via `document.createElement('script')`. It will have its language set to JavaScript, `defer` set to
     * false and then the resulting element will be appended to `document.head`. Any code then in the
     * script will be executed.
     *
     * The URL can be relative or absolute. If the URL is relative the `Loader.baseURL` and `Loader.path` values will be prepended to it.
     *
     * If the URL isn't specified the Loader will take the key and create a filename from that. For example if the key is "alien"
     * and no URL is given then the Loader will set the URL to be "alien.js". It will always add `.js` as the extension, although
     * this can be overridden if using an object instead of method arguments. If you do not desire this action then provide a URL.
     *
     * Note: The ability to load this type of file will only be available if the Script File type has been built into Phaser.
     * It is available in the default build but can be excluded from custom builds.
     *
     * @method Phaser.Loader.LoaderPlugin#script
     * @fires Phaser.Loader.LoaderPlugin#addFileEvent
     * @since 3.0.0
     *
     * @param {(string|Phaser.Loader.FileTypes.ScriptFileConfig|Phaser.Loader.FileTypes.ScriptFileConfig[])} key - The key to use for this file, or a file configuration object, or array of them.
     * @param {string} [url] - The absolute or relative URL to load this file from. If undefined or `null` it will be set to `<key>.js`, i.e. if `key` was "alien" then the URL will be "alien.js".
     * @param {XHRSettingsObject} [xhrSettings] - An XHR Settings configuration object. Used in replacement of the Loaders default XHR Settings.
     *
     * @return {Phaser.Loader.LoaderPlugin} The Loader instance.
     */
    public function script(key:Dynamic, ?url:String, ?xhrSettings:XHRSettingsObject):phaser.loader.LoaderPlugin;
    /**
     * Adds a Sprite Sheet Image, or array of Sprite Sheet Images, to the current load queue.
     *
     * The term 'Sprite Sheet' in Phaser means a fixed-size sheet. Where every frame in the sheet is the exact same size,
     * and you reference those frames using numbers, not frame names. This is not the same thing as a Texture Atlas, where
     * the frames are packed in a way where they take up the least amount of space, and are referenced by their names,
     * not numbers. Some articles and software use the term 'Sprite Sheet' to mean Texture Atlas, so please be aware of
     * what sort of file you're actually trying to load.
     *
     * You can call this method from within your Scene's `preload`, along with any other files you wish to load:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.spritesheet('bot', 'images/robot.png', { frameWidth: 32, frameHeight: 38 });
     * }
     * ```
     *
     * The file is **not** loaded right away. It is added to a queue ready to be loaded either when the loader starts,
     * or if it's already running, when the next free load slot becomes available. This happens automatically if you
     * are calling this from within the Scene's `preload` method, or a related callback. Because the file is queued
     * it means you cannot use the file immediately after calling this method, but must wait for the file to complete.
     * The typical flow for a Phaser Scene is that you load assets in the Scene's `preload` method and then when the
     * Scene's `create` method is called you are guaranteed that all of those assets are ready for use and have been
     * loaded.
     *
     * Phaser can load all common image types: png, jpg, gif and any other format the browser can natively handle.
     * If you try to load an animated gif only the first frame will be rendered. Browsers do not natively support playback
     * of animated gifs to Canvas elements.
     *
     * The key must be a unique String. It is used to add the file to the global Texture Manager upon a successful load.
     * The key should be unique both in terms of files being loaded and files already present in the Texture Manager.
     * Loading a file using a key that is already taken will result in a warning. If you wish to replace an existing file
     * then remove it from the Texture Manager first, before loading a new one.
     *
     * Instead of passing arguments you can pass a configuration object, such as:
     *
     * ```javascript
     * this.load.spritesheet({
     *     key: 'bot',
     *     url: 'images/robot.png',
     *     frameConfig: {
     *         frameWidth: 32,
     *         frameHeight: 38,
     *         startFrame: 0,
     *         endFrame: 8
     *     }
     * });
     * ```
     *
     * See the documentation for `Phaser.Loader.FileTypes.SpriteSheetFileConfig` for more details.
     *
     * Once the file has finished loading you can use it as a texture for a Game Object by referencing its key:
     *
     * ```javascript
     * this.load.spritesheet('bot', 'images/robot.png', { frameWidth: 32, frameHeight: 38 });
     * // and later in your game ...
     * this.add.image(x, y, 'bot', 0);
     * ```
     *
     * If you have specified a prefix in the loader, via `Loader.setPrefix` then this value will be prepended to this files
     * key. For example, if the prefix was `PLAYER.` and the key was `Running` the final key will be `PLAYER.Running` and
     * this is what you would use to retrieve the image from the Texture Manager.
     *
     * The URL can be relative or absolute. If the URL is relative the `Loader.baseURL` and `Loader.path` values will be prepended to it.
     *
     * If the URL isn't specified the Loader will take the key and create a filename from that. For example if the key is "alien"
     * and no URL is given then the Loader will set the URL to be "alien.png". It will always add `.png` as the extension, although
     * this can be overridden if using an object instead of method arguments. If you do not desire this action then provide a URL.
     *
     * Phaser also supports the automatic loading of associated normal maps. If you have a normal map to go with this image,
     * then you can specify it by providing an array as the `url` where the second element is the normal map:
     *
     * ```javascript
     * this.load.spritesheet('logo', [ 'images/AtariLogo.png', 'images/AtariLogo-n.png' ], { frameWidth: 256, frameHeight: 80 });
     * ```
     *
     * Or, if you are using a config object use the `normalMap` property:
     *
     * ```javascript
     * this.load.spritesheet({
     *     key: 'logo',
     *     url: 'images/AtariLogo.png',
     *     normalMap: 'images/AtariLogo-n.png',
     *     frameConfig: {
     *         frameWidth: 256,
     *         frameHeight: 80
     *     }
     * });
     * ```
     *
     * The normal map file is subject to the same conditions as the image file with regard to the path, baseURL, CORs and XHR Settings.
     * Normal maps are a WebGL only feature.
     *
     * Note: The ability to load this type of file will only be available if the Sprite Sheet File type has been built into Phaser.
     * It is available in the default build but can be excluded from custom builds.
     *
     * @method Phaser.Loader.LoaderPlugin#spritesheet
     * @fires Phaser.Loader.LoaderPlugin#addFileEvent
     * @since 3.0.0
     *
     * @param {(string|Phaser.Loader.FileTypes.SpriteSheetFileConfig|Phaser.Loader.FileTypes.SpriteSheetFileConfig[])} key - The key to use for this file, or a file configuration object, or array of them.
     * @param {string} [url] - The absolute or relative URL to load this file from. If undefined or `null` it will be set to `<key>.png`, i.e. if `key` was "alien" then the URL will be "alien.png".
     * @param {Phaser.Loader.FileTypes.ImageFrameConfig} [frameConfig] - The frame configuration object. At a minimum it should have a `frameWidth` property.
     * @param {XHRSettingsObject} [xhrSettings] - An XHR Settings configuration object. Used in replacement of the Loaders default XHR Settings.
     *
     * @return {Phaser.Loader.LoaderPlugin} The Loader instance.
     */
    public function spritesheet(key:Dynamic, ?url:String, ?frameConfig:phaser.loader.filetypes.ImageFrameConfig, ?xhrSettings:XHRSettingsObject):phaser.loader.LoaderPlugin;
    /**
     * Adds a Text file, or array of Text files, to the current load queue.
     *
     * You can call this method from within your Scene's `preload`, along with any other files you wish to load:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.text('story', 'files/IntroStory.txt');
     * }
     * ```
     *
     * The file is **not** loaded right away. It is added to a queue ready to be loaded either when the loader starts,
     * or if it's already running, when the next free load slot becomes available. This happens automatically if you
     * are calling this from within the Scene's `preload` method, or a related callback. Because the file is queued
     * it means you cannot use the file immediately after calling this method, but must wait for the file to complete.
     * The typical flow for a Phaser Scene is that you load assets in the Scene's `preload` method and then when the
     * Scene's `create` method is called you are guaranteed that all of those assets are ready for use and have been
     * loaded.
     *
     * The key must be a unique String. It is used to add the file to the global Text Cache upon a successful load.
     * The key should be unique both in terms of files being loaded and files already present in the Text Cache.
     * Loading a file using a key that is already taken will result in a warning. If you wish to replace an existing file
     * then remove it from the Text Cache first, before loading a new one.
     *
     * Instead of passing arguments you can pass a configuration object, such as:
     *
     * ```javascript
     * this.load.text({
     *     key: 'story',
     *     url: 'files/IntroStory.txt'
     * });
     * ```
     *
     * See the documentation for `Phaser.Loader.FileTypes.TextFileConfig` for more details.
     *
     * Once the file has finished loading you can access it from its Cache using its key:
     *
     * ```javascript
     * this.load.text('story', 'files/IntroStory.txt');
     * // and later in your game ...
     * var data = this.cache.text.get('story');
     * ```
     *
     * If you have specified a prefix in the loader, via `Loader.setPrefix` then this value will be prepended to this files
     * key. For example, if the prefix was `LEVEL1.` and the key was `Story` the final key will be `LEVEL1.Story` and
     * this is what you would use to retrieve the text from the Text Cache.
     *
     * The URL can be relative or absolute. If the URL is relative the `Loader.baseURL` and `Loader.path` values will be prepended to it.
     *
     * If the URL isn't specified the Loader will take the key and create a filename from that. For example if the key is "story"
     * and no URL is given then the Loader will set the URL to be "story.txt". It will always add `.txt` as the extension, although
     * this can be overridden if using an object instead of method arguments. If you do not desire this action then provide a URL.
     *
     * Note: The ability to load this type of file will only be available if the Text File type has been built into Phaser.
     * It is available in the default build but can be excluded from custom builds.
     *
     * @method Phaser.Loader.LoaderPlugin#text
     * @fires Phaser.Loader.LoaderPlugin#addFileEvent
     * @since 3.0.0
     *
     * @param {(string|Phaser.Loader.FileTypes.TextFileConfig|Phaser.Loader.FileTypes.TextFileConfig[])} key - The key to use for this file, or a file configuration object, or array of them.
     * @param {string} [url] - The absolute or relative URL to load this file from. If undefined or `null` it will be set to `<key>.txt`, i.e. if `key` was "alien" then the URL will be "alien.txt".
     * @param {XHRSettingsObject} [xhrSettings] - An XHR Settings configuration object. Used in replacement of the Loaders default XHR Settings.
     *
     * @return {Phaser.Loader.LoaderPlugin} The Loader instance.
     */
    public function text(key:Dynamic, ?url:String, ?xhrSettings:XHRSettingsObject):phaser.loader.LoaderPlugin;
    /**
     * Adds a CSV Tilemap file, or array of CSV files, to the current load queue.
     *
     * You can call this method from within your Scene's `preload`, along with any other files you wish to load:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.tilemapCSV('level1', 'maps/Level1.csv');
     * }
     * ```
     *
     * Tilemap CSV data can be created in a text editor, or a 3rd party app that exports as CSV.
     *
     * The file is **not** loaded right away. It is added to a queue ready to be loaded either when the loader starts,
     * or if it's already running, when the next free load slot becomes available. This happens automatically if you
     * are calling this from within the Scene's `preload` method, or a related callback. Because the file is queued
     * it means you cannot use the file immediately after calling this method, but must wait for the file to complete.
     * The typical flow for a Phaser Scene is that you load assets in the Scene's `preload` method and then when the
     * Scene's `create` method is called you are guaranteed that all of those assets are ready for use and have been
     * loaded.
     *
     * The key must be a unique String. It is used to add the file to the global Tilemap Cache upon a successful load.
     * The key should be unique both in terms of files being loaded and files already present in the Tilemap Cache.
     * Loading a file using a key that is already taken will result in a warning. If you wish to replace an existing file
     * then remove it from the Text Cache first, before loading a new one.
     *
     * Instead of passing arguments you can pass a configuration object, such as:
     *
     * ```javascript
     * this.load.tilemapCSV({
     *     key: 'level1',
     *     url: 'maps/Level1.csv'
     * });
     * ```
     *
     * See the documentation for `Phaser.Loader.FileTypes.TilemapCSVFileConfig` for more details.
     *
     * Once the file has finished loading you can access it from its Cache using its key:
     *
     * ```javascript
     * this.load.tilemapCSV('level1', 'maps/Level1.csv');
     * // and later in your game ...
     * var map = this.make.tilemap({ key: 'level1' });
     * ```
     *
     * If you have specified a prefix in the loader, via `Loader.setPrefix` then this value will be prepended to this files
     * key. For example, if the prefix was `LEVEL1.` and the key was `Story` the final key will be `LEVEL1.Story` and
     * this is what you would use to retrieve the text from the Tilemap Cache.
     *
     * The URL can be relative or absolute. If the URL is relative the `Loader.baseURL` and `Loader.path` values will be prepended to it.
     *
     * If the URL isn't specified the Loader will take the key and create a filename from that. For example if the key is "level"
     * and no URL is given then the Loader will set the URL to be "level.csv". It will always add `.csv` as the extension, although
     * this can be overridden if using an object instead of method arguments. If you do not desire this action then provide a URL.
     *
     * Note: The ability to load this type of file will only be available if the Tilemap CSV File type has been built into Phaser.
     * It is available in the default build but can be excluded from custom builds.
     *
     * @method Phaser.Loader.LoaderPlugin#tilemapCSV
     * @fires Phaser.Loader.LoaderPlugin#addFileEvent
     * @since 3.0.0
     *
     * @param {(string|Phaser.Loader.FileTypes.TilemapCSVFileConfig|Phaser.Loader.FileTypes.TilemapCSVFileConfig[])} key - The key to use for this file, or a file configuration object, or array of them.
     * @param {string} [url] - The absolute or relative URL to load this file from. If undefined or `null` it will be set to `<key>.csv`, i.e. if `key` was "alien" then the URL will be "alien.csv".
     * @param {XHRSettingsObject} [xhrSettings] - An XHR Settings configuration object. Used in replacement of the Loaders default XHR Settings.
     *
     * @return {Phaser.Loader.LoaderPlugin} The Loader instance.
     */
    public function tilemapCSV(key:Dynamic, ?url:String, ?xhrSettings:XHRSettingsObject):phaser.loader.LoaderPlugin;
    /**
     * Adds an Impact.js Tilemap file, or array of map files, to the current load queue.
     *
     * You can call this method from within your Scene's `preload`, along with any other files you wish to load:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.tilemapImpact('level1', 'maps/Level1.json');
     * }
     * ```
     *
     * Impact Tilemap data is created the Impact.js Map Editor called Weltmeister.
     *
     * The file is **not** loaded right away. It is added to a queue ready to be loaded either when the loader starts,
     * or if it's already running, when the next free load slot becomes available. This happens automatically if you
     * are calling this from within the Scene's `preload` method, or a related callback. Because the file is queued
     * it means you cannot use the file immediately after calling this method, but must wait for the file to complete.
     * The typical flow for a Phaser Scene is that you load assets in the Scene's `preload` method and then when the
     * Scene's `create` method is called you are guaranteed that all of those assets are ready for use and have been
     * loaded.
     *
     * The key must be a unique String. It is used to add the file to the global Tilemap Cache upon a successful load.
     * The key should be unique both in terms of files being loaded and files already present in the Tilemap Cache.
     * Loading a file using a key that is already taken will result in a warning. If you wish to replace an existing file
     * then remove it from the Text Cache first, before loading a new one.
     *
     * Instead of passing arguments you can pass a configuration object, such as:
     *
     * ```javascript
     * this.load.tilemapImpact({
     *     key: 'level1',
     *     url: 'maps/Level1.json'
     * });
     * ```
     *
     * See the documentation for `Phaser.Loader.FileTypes.TilemapImpactFileConfig` for more details.
     *
     * Once the file has finished loading you can access it from its Cache using its key:
     *
     * ```javascript
     * this.load.tilemapImpact('level1', 'maps/Level1.json');
     * // and later in your game ...
     * var map = this.make.tilemap({ key: 'level1' });
     * ```
     *
     * If you have specified a prefix in the loader, via `Loader.setPrefix` then this value will be prepended to this files
     * key. For example, if the prefix was `LEVEL1.` and the key was `Story` the final key will be `LEVEL1.Story` and
     * this is what you would use to retrieve the text from the Tilemap Cache.
     *
     * The URL can be relative or absolute. If the URL is relative the `Loader.baseURL` and `Loader.path` values will be prepended to it.
     *
     * If the URL isn't specified the Loader will take the key and create a filename from that. For example if the key is "level"
     * and no URL is given then the Loader will set the URL to be "level.json". It will always add `.json` as the extension, although
     * this can be overridden if using an object instead of method arguments. If you do not desire this action then provide a URL.
     *
     * Note: The ability to load this type of file will only be available if the Tilemap Impact File type has been built into Phaser.
     * It is available in the default build but can be excluded from custom builds.
     *
     * @method Phaser.Loader.LoaderPlugin#tilemapImpact
     * @fires Phaser.Loader.LoaderPlugin#addFileEvent
     * @since 3.7.0
     *
     * @param {(string|Phaser.Loader.FileTypes.TilemapImpactFileConfig|Phaser.Loader.FileTypes.TilemapImpactFileConfig[])} key - The key to use for this file, or a file configuration object, or array of them.
     * @param {string} [url] - The absolute or relative URL to load this file from. If undefined or `null` it will be set to `<key>.json`, i.e. if `key` was "alien" then the URL will be "alien.json".
     * @param {XHRSettingsObject} [xhrSettings] - An XHR Settings configuration object. Used in replacement of the Loaders default XHR Settings.
     *
     * @return {Phaser.Loader.LoaderPlugin} The Loader instance.
     */
    public function tilemapImpact(key:Dynamic, ?url:String, ?xhrSettings:XHRSettingsObject):phaser.loader.LoaderPlugin;
    /**
     * Adds a Tiled JSON Tilemap file, or array of map files, to the current load queue.
     *
     * You can call this method from within your Scene's `preload`, along with any other files you wish to load:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.tilemapTiledJSON('level1', 'maps/Level1.json');
     * }
     * ```
     *
     * The Tilemap data is created using the Tiled Map Editor and selecting JSON as the export format.
     *
     * The file is **not** loaded right away. It is added to a queue ready to be loaded either when the loader starts,
     * or if it's already running, when the next free load slot becomes available. This happens automatically if you
     * are calling this from within the Scene's `preload` method, or a related callback. Because the file is queued
     * it means you cannot use the file immediately after calling this method, but must wait for the file to complete.
     * The typical flow for a Phaser Scene is that you load assets in the Scene's `preload` method and then when the
     * Scene's `create` method is called you are guaranteed that all of those assets are ready for use and have been
     * loaded.
     *
     * The key must be a unique String. It is used to add the file to the global Tilemap Cache upon a successful load.
     * The key should be unique both in terms of files being loaded and files already present in the Tilemap Cache.
     * Loading a file using a key that is already taken will result in a warning. If you wish to replace an existing file
     * then remove it from the Text Cache first, before loading a new one.
     *
     * Instead of passing arguments you can pass a configuration object, such as:
     *
     * ```javascript
     * this.load.tilemapTiledJSON({
     *     key: 'level1',
     *     url: 'maps/Level1.json'
     * });
     * ```
     *
     * See the documentation for `Phaser.Loader.FileTypes.TilemapJSONFileConfig` for more details.
     *
     * Once the file has finished loading you can access it from its Cache using its key:
     *
     * ```javascript
     * this.load.tilemapTiledJSON('level1', 'maps/Level1.json');
     * // and later in your game ...
     * var map = this.make.tilemap({ key: 'level1' });
     * ```
     *
     * If you have specified a prefix in the loader, via `Loader.setPrefix` then this value will be prepended to this files
     * key. For example, if the prefix was `LEVEL1.` and the key was `Story` the final key will be `LEVEL1.Story` and
     * this is what you would use to retrieve the text from the Tilemap Cache.
     *
     * The URL can be relative or absolute. If the URL is relative the `Loader.baseURL` and `Loader.path` values will be prepended to it.
     *
     * If the URL isn't specified the Loader will take the key and create a filename from that. For example if the key is "level"
     * and no URL is given then the Loader will set the URL to be "level.json". It will always add `.json` as the extension, although
     * this can be overridden if using an object instead of method arguments. If you do not desire this action then provide a URL.
     *
     * Note: The ability to load this type of file will only be available if the Tilemap JSON File type has been built into Phaser.
     * It is available in the default build but can be excluded from custom builds.
     *
     * @method Phaser.Loader.LoaderPlugin#tilemapTiledJSON
     * @fires Phaser.Loader.LoaderPlugin#addFileEvent
     * @since 3.0.0
     *
     * @param {(string|Phaser.Loader.FileTypes.TilemapJSONFileConfig|Phaser.Loader.FileTypes.TilemapJSONFileConfig[])} key - The key to use for this file, or a file configuration object, or array of them.
     * @param {string} [url] - The absolute or relative URL to load this file from. If undefined or `null` it will be set to `<key>.json`, i.e. if `key` was "alien" then the URL will be "alien.json".
     * @param {XHRSettingsObject} [xhrSettings] - An XHR Settings configuration object. Used in replacement of the Loaders default XHR Settings.
     *
     * @return {Phaser.Loader.LoaderPlugin} The Loader instance.
     */
    public function tilemapTiledJSON(key:Dynamic, ?url:String, ?xhrSettings:XHRSettingsObject):phaser.loader.LoaderPlugin;
    /**
     * Adds a Unity YAML based Texture Atlas, or array of atlases, to the current load queue.
     *
     * You can call this method from within your Scene's `preload`, along with any other files you wish to load:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.unityAtlas('mainmenu', 'images/MainMenu.png', 'images/MainMenu.txt');
     * }
     * ```
     *
     * The file is **not** loaded right away. It is added to a queue ready to be loaded either when the loader starts,
     * or if it's already running, when the next free load slot becomes available. This happens automatically if you
     * are calling this from within the Scene's `preload` method, or a related callback. Because the file is queued
     * it means you cannot use the file immediately after calling this method, but must wait for the file to complete.
     * The typical flow for a Phaser Scene is that you load assets in the Scene's `preload` method and then when the
     * Scene's `create` method is called you are guaranteed that all of those assets are ready for use and have been
     * loaded.
     *
     * If you call this from outside of `preload` then you are responsible for starting the Loader afterwards and monitoring
     * its events to know when it's safe to use the asset. Please see the Phaser.Loader.LoaderPlugin class for more details.
     *
     * Phaser expects the atlas data to be provided in a YAML formatted text file as exported from Unity.
     *
     * Phaser can load all common image types: png, jpg, gif and any other format the browser can natively handle.
     *
     * The key must be a unique String. It is used to add the file to the global Texture Manager upon a successful load.
     * The key should be unique both in terms of files being loaded and files already present in the Texture Manager.
     * Loading a file using a key that is already taken will result in a warning. If you wish to replace an existing file
     * then remove it from the Texture Manager first, before loading a new one.
     *
     * Instead of passing arguments you can pass a configuration object, such as:
     *
     * ```javascript
     * this.load.unityAtlas({
     *     key: 'mainmenu',
     *     textureURL: 'images/MainMenu.png',
     *     atlasURL: 'images/MainMenu.txt'
     * });
     * ```
     *
     * See the documentation for `Phaser.Loader.FileTypes.UnityAtlasFileConfig` for more details.
     *
     * Once the atlas has finished loading you can use frames from it as textures for a Game Object by referencing its key:
     *
     * ```javascript
     * this.load.unityAtlas('mainmenu', 'images/MainMenu.png', 'images/MainMenu.json');
     * // and later in your game ...
     * this.add.image(x, y, 'mainmenu', 'background');
     * ```
     *
     * To get a list of all available frames within an atlas please consult your Texture Atlas software.
     *
     * If you have specified a prefix in the loader, via `Loader.setPrefix` then this value will be prepended to this files
     * key. For example, if the prefix was `MENU.` and the key was `Background` the final key will be `MENU.Background` and
     * this is what you would use to retrieve the image from the Texture Manager.
     *
     * The URL can be relative or absolute. If the URL is relative the `Loader.baseURL` and `Loader.path` values will be prepended to it.
     *
     * If the URL isn't specified the Loader will take the key and create a filename from that. For example if the key is "alien"
     * and no URL is given then the Loader will set the URL to be "alien.png". It will always add `.png` as the extension, although
     * this can be overridden if using an object instead of method arguments. If you do not desire this action then provide a URL.
     *
     * Phaser also supports the automatic loading of associated normal maps. If you have a normal map to go with this image,
     * then you can specify it by providing an array as the `url` where the second element is the normal map:
     *
     * ```javascript
     * this.load.unityAtlas('mainmenu', [ 'images/MainMenu.png', 'images/MainMenu-n.png' ], 'images/MainMenu.txt');
     * ```
     *
     * Or, if you are using a config object use the `normalMap` property:
     *
     * ```javascript
     * this.load.unityAtlas({
     *     key: 'mainmenu',
     *     textureURL: 'images/MainMenu.png',
     *     normalMap: 'images/MainMenu-n.png',
     *     atlasURL: 'images/MainMenu.txt'
     * });
     * ```
     *
     * The normal map file is subject to the same conditions as the image file with regard to the path, baseURL, CORs and XHR Settings.
     * Normal maps are a WebGL only feature.
     *
     * Note: The ability to load this type of file will only be available if the Unity Atlas File type has been built into Phaser.
     * It is available in the default build but can be excluded from custom builds.
     *
     * @method Phaser.Loader.LoaderPlugin#unityAtlas
     * @fires Phaser.Loader.LoaderPlugin#addFileEvent
     * @since 3.0.0
     *
     * @param {(string|Phaser.Loader.FileTypes.UnityAtlasFileConfig|Phaser.Loader.FileTypes.UnityAtlasFileConfig[])} key - The key to use for this file, or a file configuration object, or array of them.
     * @param {string|string[]} [textureURL] - The absolute or relative URL to load the texture image file from. If undefined or `null` it will be set to `<key>.png`, i.e. if `key` was "alien" then the URL will be "alien.png".
     * @param {string} [atlasURL] - The absolute or relative URL to load the texture atlas data file from. If undefined or `null` it will be set to `<key>.txt`, i.e. if `key` was "alien" then the URL will be "alien.txt".
     * @param {XHRSettingsObject} [textureXhrSettings] - An XHR Settings configuration object for the atlas image file. Used in replacement of the Loaders default XHR Settings.
     * @param {XHRSettingsObject} [atlasXhrSettings] - An XHR Settings configuration object for the atlas data file. Used in replacement of the Loaders default XHR Settings.
     *
     * @return {Phaser.Loader.LoaderPlugin} The Loader instance.
     */
    public function unityAtlas(key:Dynamic, ?textureURL:Dynamic, ?atlasURL:String, ?textureXhrSettings:XHRSettingsObject, ?atlasXhrSettings:XHRSettingsObject):phaser.loader.LoaderPlugin;
    /**
     * Adds an XML file, or array of XML files, to the current load queue.
     *
     * You can call this method from within your Scene's `preload`, along with any other files you wish to load:
     *
     * ```javascript
     * function preload ()
     * {
     *     this.load.xml('wavedata', 'files/AlienWaveData.xml');
     * }
     * ```
     *
     * The file is **not** loaded right away. It is added to a queue ready to be loaded either when the loader starts,
     * or if it's already running, when the next free load slot becomes available. This happens automatically if you
     * are calling this from within the Scene's `preload` method, or a related callback. Because the file is queued
     * it means you cannot use the file immediately after calling this method, but must wait for the file to complete.
     * The typical flow for a Phaser Scene is that you load assets in the Scene's `preload` method and then when the
     * Scene's `create` method is called you are guaranteed that all of those assets are ready for use and have been
     * loaded.
     *
     * The key must be a unique String. It is used to add the file to the global XML Cache upon a successful load.
     * The key should be unique both in terms of files being loaded and files already present in the XML Cache.
     * Loading a file using a key that is already taken will result in a warning. If you wish to replace an existing file
     * then remove it from the XML Cache first, before loading a new one.
     *
     * Instead of passing arguments you can pass a configuration object, such as:
     *
     * ```javascript
     * this.load.xml({
     *     key: 'wavedata',
     *     url: 'files/AlienWaveData.xml'
     * });
     * ```
     *
     * See the documentation for `Phaser.Loader.FileTypes.XMLFileConfig` for more details.
     *
     * Once the file has finished loading you can access it from its Cache using its key:
     *
     * ```javascript
     * this.load.xml('wavedata', 'files/AlienWaveData.xml');
     * // and later in your game ...
     * var data = this.cache.xml.get('wavedata');
     * ```
     *
     * If you have specified a prefix in the loader, via `Loader.setPrefix` then this value will be prepended to this files
     * key. For example, if the prefix was `LEVEL1.` and the key was `Waves` the final key will be `LEVEL1.Waves` and
     * this is what you would use to retrieve the text from the XML Cache.
     *
     * The URL can be relative or absolute. If the URL is relative the `Loader.baseURL` and `Loader.path` values will be prepended to it.
     *
     * If the URL isn't specified the Loader will take the key and create a filename from that. For example if the key is "data"
     * and no URL is given then the Loader will set the URL to be "data.xml". It will always add `.xml` as the extension, although
     * this can be overridden if using an object instead of method arguments. If you do not desire this action then provide a URL.
     *
     * Note: The ability to load this type of file will only be available if the XML File type has been built into Phaser.
     * It is available in the default build but can be excluded from custom builds.
     *
     * @method Phaser.Loader.LoaderPlugin#xml
     * @fires Phaser.Loader.LoaderPlugin#addFileEvent
     * @since 3.0.0
     *
     * @param {(string|Phaser.Loader.FileTypes.XMLFileConfig|Phaser.Loader.FileTypes.XMLFileConfig[])} key - The key to use for this file, or a file configuration object, or array of them.
     * @param {string} [url] - The absolute or relative URL to load this file from. If undefined or `null` it will be set to `<key>.xml`, i.e. if `key` was "alien" then the URL will be "alien.xml".
     * @param {XHRSettingsObject} [xhrSettings] - An XHR Settings configuration object. Used in replacement of the Loaders default XHR Settings.
     *
     * @return {Phaser.Loader.LoaderPlugin} The Loader instance.
     */
    public function xml(key:Dynamic, ?url:String, ?xhrSettings:XHRSettingsObject):phaser.loader.LoaderPlugin;
}
