package phaser.device;

/**
 * Determines the video support of the browser running this Phaser Game instance.
 * These values are read-only and populated during the boot sequence of the game.
 * They are then referenced by internal game systems and are available for you to access
 * via `this.sys.game.device.video` from within any Scene.
 *
 * @typedef {object} Phaser.Device.Video
 * @since 3.0.0
 *
 * @property {boolean} h264Video - Can this device play h264 mp4 video files?
 * @property {boolean} hlsVideo - Can this device play hls video files?
 * @property {boolean} mp4Video - Can this device play h264 mp4 video files?
 * @property {boolean} oggVideo - Can this device play ogg video files?
 * @property {boolean} vp9Video - Can this device play vp9 video files?
 * @property {boolean} webmVideo - Can this device play webm video files?
 */
typedef Video = {
var h264Video:Bool;
var hlsVideo:Bool;
var mp4Video:Bool;
var oggVideo:Bool;
var vp9Video:Bool;
var webmVideo:Bool;
};
