package phaser.scenes.sceneplugin;

/**
 * @typedef {object} Phaser.Scenes.ScenePlugin.SceneTransitionConfig
 *
 * @property {string} target - The Scene key to transition to.
 * @property {integer} [duration=1000] - The duration, in ms, for the transition to last.
 * @property {boolean} [sleep=false] - Will the Scene responsible for the transition be sent to sleep on completion (`true`), or stopped? (`false`)
 * @property {boolean} [allowInput=false] - Will the Scenes Input system be able to process events while it is transitioning in or out?
 * @property {boolean} [moveAbove] - Move the target Scene to be above this one before the transition starts.
 * @property {boolean} [moveBelow] - Move the target Scene to be below this one before the transition starts.
 * @property {function} [onUpdate] - This callback is invoked every frame for the duration of the transition.
 * @property {any} [onUpdateScope] - The context in which the callback is invoked.
 * @property {any} [data] - An object containing any data you wish to be passed to the target Scenes init / create methods.
 */
typedef SceneTransitionConfig = {
var target:String;
    @:optional var duration:Int;
    @:optional var sleep:Bool;
    @:optional var allowInput:Bool;
    @:optional var moveAbove:Bool;
    @:optional var moveBelow:Bool;
    @:optional var onUpdate:Dynamic;
    @:optional var onUpdateScope:Dynamic;
    @:optional var data:Dynamic;
};
