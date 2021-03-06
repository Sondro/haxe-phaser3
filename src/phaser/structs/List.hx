package phaser.structs;

/**
 * @classdesc
 * List is a generic implementation of an ordered list which contains utility methods for retrieving, manipulating, and iterating items.
 *
 * @class List
 * @memberof Phaser.Structs
 * @constructor
 * @since 3.0.0
 *
 * @generic T
 *
 * @param {*} parent - The parent of this list.
 */
@:native("Phaser.Structs.List")
extern class List {
    public function new(parent:Dynamic);
    /**
     * The parent of this list.
     *
     * @name Phaser.Structs.List#parent
     * @type {*}
     * @since 3.0.0
     */
    public var parent:Dynamic;
    /**
     * The objects that belong to this collection.
     *
     * @genericUse {T[]} - [$type]
     *
     * @name Phaser.Structs.List#list
     * @type {Array.<*>}
     * @default []
     * @since 3.0.0
     */
    public var list:Array<Dynamic>;
    /**
     * The index of the current element.
     *
     * This is used internally when iterating through the list with the {@link #first}, {@link #last}, {@link #get}, and {@link #previous} properties.
     *
     * @name Phaser.Structs.List#position
     * @type {integer}
     * @default 0
     * @since 3.0.0
     */
    public var position:Int;
    /**
     * A callback that is invoked every time a child is added to this list.
     *
     * @name Phaser.Structs.List#addCallback
     * @type {function}
     * @since 3.4.0
     */
    public var addCallback:Dynamic;
    /**
     * A callback that is invoked every time a child is removed from this list.
     *
     * @name Phaser.Structs.List#removeCallback
     * @type {function}
     * @since 3.4.0
     */
    public var removeCallback:Dynamic;
    /**
     * The property key to sort by.
     *
     * @name Phaser.Structs.List#_sortKey
     * @type {string}
     * @since 3.4.0
     */
    public var _sortKey:String;
    /**
     * The number of items inside the List.
     *
     * @name Phaser.Structs.List#length
     * @type {integer}
     * @readonly
     * @since 3.0.0
     */
    public var length:Int;
    /**
     * The first item in the List or `null` for an empty List.
     *
     * @name Phaser.Structs.List#first
     * @type {integer}
     * @readonly
     * @since 3.0.0
     */
    public var first:Int;
    /**
     * The last item in the List, or `null` for an empty List.
     *
     * @name Phaser.Structs.List#last
     * @type {integer}
     * @readonly
     * @since 3.0.0
     */
    public var last:Int;
    /**
     * The next item in the List, or `null` if the entire List has been traversed.
     *
     * This property can be read successively after reading {@link #first} or manually setting the {@link #position} to iterate the List.
     *
     * @name Phaser.Structs.List#next
     * @type {integer}
     * @readonly
     * @since 3.0.0
     */
    public var next:Int;
    /**
     * The previous item in the List, or `null` if the entire List has been traversed.
     *
     * This property can be read successively after reading {@link #last} or manually setting the {@link #position} to iterate the List backwards.
     *
     * @name Phaser.Structs.List#previous
     * @type {integer}
     * @readonly
     * @since 3.0.0
     */
    public var previous:Int;
    /**
     * Adds the given item to the end of the list. Each item must be unique.
     *
     * @method Phaser.Structs.List#add
     * @since 3.0.0
     *
     * @genericUse {T} - [child,$return]
     *
     * @param {*|Array.<*>} child - The item, or array of items, to add to the list.
     * @param {boolean} [skipCallback=false] - Skip calling the List.addCallback if this child is added successfully.
     *
     * @return {*} The list's underlying array.
     */
    public function add(child:Dynamic, ?skipCallback:Bool):Dynamic;
    /**
     * Adds an item to list, starting at a specified index. Each item must be unique within the list.
     *
     * @method Phaser.Structs.List#addAt
     * @since 3.0.0
     *
     * @genericUse {T} - [child,$return]
     *
     * @param {*} child - The item, or array of items, to add to the list.
     * @param {integer} [index=0] - The index in the list at which the element(s) will be inserted.
     * @param {boolean} [skipCallback=false] - Skip calling the List.addCallback if this child is added successfully.
     *
     * @return {*} The List's underlying array.
     */
    public function addAt(child:Dynamic, ?index:Int, ?skipCallback:Bool):Dynamic;
    /**
     * Retrieves the item at a given position inside the List.
     *
     * @method Phaser.Structs.List#getAt
     * @since 3.0.0
     *
     * @genericUse {T} - [$return]
     *
     * @param {integer} index - The index of the item.
     *
     * @return {*} The retrieved item, or `undefined` if it's outside the List's bounds.
     */
    public function getAt(index:Int):Dynamic;
    /**
     * Locates an item within the List and returns its index.
     *
     * @method Phaser.Structs.List#getIndex
     * @since 3.0.0
     *
     * @genericUse {T} - [child]
     *
     * @param {*} child - The item to locate.
     *
     * @return {integer} The index of the item within the List, or -1 if it's not in the List.
     */
    public function getIndex(child:Dynamic):Int;
    /**
     * Sort the contents of this List so the items are in order based
     * on the given property. For example, `sort('alpha')` would sort the List
     * contents based on the value of their `alpha` property.
     *
     * @method Phaser.Structs.List#sort
     * @since 3.0.0
     *
     * @genericUse {T[]} - [children,$return]
     *
     * @param {string} property - The property to lexically sort by.
     *
     * @return {Phaser.Structs.List} This List object.
     */
    public function sort(property:String):phaser.structs.List;
    /**
     * Searches for the first instance of a child with its `name`
     * property matching the given argument. Should more than one child have
     * the same name only the first is returned.
     *
     * @method Phaser.Structs.List#getByName
     * @since 3.0.0
     *
     * @genericUse {T | null} - [$return]
     *
     * @param {string} name - The name to search for.
     *
     * @return {?*} The first child with a matching name, or null if none were found.
     */
    public function getByName(name:String):Dynamic;
    /**
     * Returns a random child from the group.
     *
     * @method Phaser.Structs.List#getRandom
     * @since 3.0.0
     *
     * @genericUse {T | null} - [$return]
     *
     * @param {integer} [startIndex=0] - Offset from the front of the group (lowest child).
     * @param {integer} [length=(to top)] - Restriction on the number of values you want to randomly select from.
     *
     * @return {?*} A random child of this Group.
     */
    public function getRandom(?startIndex:Int, ?length:Int):Dynamic;
    /**
     * Returns the first element in a given part of the List which matches a specific criterion.
     *
     * @method Phaser.Structs.List#getFirst
     * @since 3.0.0
     *
     * @genericUse {T} - [value]
     * @genericUse {T | null} - [$return]
     *
     * @param {string} property - The name of the property to test or a falsey value to have no criterion.
     * @param {*} value - The value to test the `property` against, or `undefined` to allow any value and only check for existence.
     * @param {number} [startIndex=0] - The position in the List to start the search at.
     * @param {number} [endIndex] - The position in the List to optionally stop the search at. It won't be checked.
     *
     * @return {?*} The first item which matches the given criterion, or `null` if no such item exists.
     */
    public function getFirst(property:String, value:Dynamic, ?startIndex:Float, ?endIndex:Float):Dynamic;
    /**
     * Returns all children in this List.
     *
     * You can optionally specify a matching criteria using the `property` and `value` arguments.
     *
     * For example: `getAll('parent')` would return only children that have a property called `parent`.
     *
     * You can also specify a value to compare the property to:
     *
     * `getAll('visible', true)` would return only children that have their visible property set to `true`.
     *
     * Optionally you can specify a start and end index. For example if this List had 100 children,
     * and you set `startIndex` to 0 and `endIndex` to 50, it would return matches from only
     * the first 50 children in the List.
     *
     * @method Phaser.Structs.List#getAll
     * @since 3.0.0
     *
     * @genericUse {T} - [value]
     * @genericUse {T[]} - [$return]
     *
     * @param {string} [property] - An optional property to test against the value argument.
     * @param {*} [value] - If property is set then Child.property must strictly equal this value to be included in the results.
     * @param {integer} [startIndex] - The first child index to start the search from.
     * @param {integer} [endIndex] - The last child index to search up until.
     *
     * @return {Array.<*>} All items of the List which match the given criterion, if any.
     */
    public function getAll(?property:String, ?value:Dynamic, ?startIndex:Int, ?endIndex:Int):Array<Dynamic>;
    /**
     * Returns the total number of items in the List which have a property matching the given value.
     *
     * @method Phaser.Structs.List#count
     * @since 3.0.0
     *
     * @genericUse {T} - [value]
     *
     * @param {string} property - The property to test on each item.
     * @param {*} value - The value to test the property against.
     *
     * @return {integer} The total number of matching elements.
     */
    public function count(property:String, value:Dynamic):Int;
    /**
     * Swaps the positions of two items in the list.
     *
     * @method Phaser.Structs.List#swap
     * @since 3.0.0
     *
     * @genericUse {T} - [child1,child2]
     *
     * @param {*} child1 - The first item to swap.
     * @param {*} child2 - The second item to swap.
     */
    public function swap(child1:Dynamic, child2:Dynamic):Void;
    /**
     * Moves an item in the List to a new position.
     *
     * @method Phaser.Structs.List#moveTo
     * @since 3.0.0
     *
     * @genericUse {T} - [child,$return]
     *
     * @param {*} child - The item to move.
     * @param {integer} index - Moves an item in the List to a new position.
     *
     * @return {*} The item that was moved.
     */
    public function moveTo(child:Dynamic, index:Int):Dynamic;
    /**
     * Removes one or many items from the List.
     *
     * @method Phaser.Structs.List#remove
     * @since 3.0.0
     *
     * @genericUse {T} - [child,$return]
     *
     * @param {*} child - The item, or array of items, to remove.
     * @param {boolean} [skipCallback=false] - Skip calling the List.removeCallback.
     *
     * @return {*} The item, or array of items, which were successfully removed from the List.
     */
    public function remove(child:Dynamic, ?skipCallback:Bool):Dynamic;
    /**
     * Removes the item at the given position in the List.
     *
     * @method Phaser.Structs.List#removeAt
     * @since 3.0.0
     *
     * @genericUse {T} - [$return]
     *
     * @param {integer} index - The position to remove the item from.
     * @param {boolean} [skipCallback=false] - Skip calling the List.removeCallback.
     *
     * @return {*} The item that was removed.
     */
    public function removeAt(index:Int, ?skipCallback:Bool):Dynamic;
    /**
     * Removes the items within the given range in the List.
     *
     * @method Phaser.Structs.List#removeBetween
     * @since 3.0.0
     *
     * @genericUse {T[]} - [$return]
     *
     * @param {integer} [startIndex=0] - The index to start removing from.
     * @param {integer} [endIndex] - The position to stop removing at. The item at this position won't be removed.
     * @param {boolean} [skipCallback=false] - Skip calling the List.removeCallback.
     *
     * @return {Array.<*>} An array of the items which were removed.[description]
     */
    public function removeBetween(?startIndex:Int, ?endIndex:Int, ?skipCallback:Bool):Array<Dynamic>;
    /**
     * Removes all the items.
     *
     * @method Phaser.Structs.List#removeAll
     * @since 3.0.0
     *
     * @genericUse {Phaser.Structs.List.<T>} - [$return]
     *
     * @param {boolean} [skipCallback=false] - Skip calling the List.removeCallback.
     *
     * @return {Phaser.Structs.List} This List object.
     */
    public function removeAll(?skipCallback:Bool):phaser.structs.List;
    /**
     * Brings the given child to the top of this List.
     *
     * @method Phaser.Structs.List#bringToTop
     * @since 3.0.0
     *
     * @genericUse {T} - [child,$return]
     *
     * @param {*} child - The item to bring to the top of the List.
     *
     * @return {*} The item which was moved.
     */
    public function bringToTop(child:Dynamic):Dynamic;
    /**
     * Sends the given child to the bottom of this List.
     *
     * @method Phaser.Structs.List#sendToBack
     * @since 3.0.0
     *
     * @genericUse {T} - [child,$return]
     *
     * @param {*} child - The item to send to the back of the list.
     *
     * @return {*} The item which was moved.
     */
    public function sendToBack(child:Dynamic):Dynamic;
    /**
     * Moves the given child up one place in this group unless it's already at the top.
     *
     * @method Phaser.Structs.List#moveUp
     * @since 3.0.0
     *
     * @genericUse {T} - [child,$return]
     *
     * @param {*} child - The item to move up.
     *
     * @return {*} The item which was moved.
     */
    public function moveUp(child:Dynamic):Dynamic;
    /**
     * Moves the given child down one place in this group unless it's already at the bottom.
     *
     * @method Phaser.Structs.List#moveDown
     * @since 3.0.0
     *
     * @genericUse {T} - [child,$return]
     *
     * @param {*} child - The item to move down.
     *
     * @return {*} The item which was moved.
     */
    public function moveDown(child:Dynamic):Dynamic;
    /**
     * Reverses the order of all children in this List.
     *
     * @method Phaser.Structs.List#reverse
     * @since 3.0.0
     *
     * @genericUse {Phaser.Structs.List.<T>} - [$return]
     *
     * @return {Phaser.Structs.List} This List object.
     */
    public function reverse():phaser.structs.List;
    /**
     * Shuffles the items in the list.
     *
     * @method Phaser.Structs.List#shuffle
     * @since 3.0.0
     *
     * @genericUse {Phaser.Structs.List.<T>} - [$return]
     *
     * @return {Phaser.Structs.List} This List object.
     */
    public function shuffle():phaser.structs.List;
    /**
     * Replaces a child of this List with the given newChild. The newChild cannot be a member of this List.
     *
     * @method Phaser.Structs.List#replace
     * @since 3.0.0
     *
     * @genericUse {T} - [oldChild,newChild,$return]
     *
     * @param {*} oldChild - The child in this List that will be replaced.
     * @param {*} newChild - The child to be inserted into this List.
     *
     * @return {*} Returns the oldChild that was replaced within this group.
     */
    public function replace(oldChild:Dynamic, newChild:Dynamic):Dynamic;
    /**
     * Checks if an item exists within the List.
     *
     * @method Phaser.Structs.List#exists
     * @since 3.0.0
     *
     * @genericUse {T} - [child]
     *
     * @param {*} child - The item to check for the existence of.
     *
     * @return {boolean} `true` if the item is found in the list, otherwise `false`.
     */
    public function exists(child:Dynamic):Bool;
    /**
     * Sets the property `key` to the given value on all members of this List.
     *
     * @method Phaser.Structs.List#setAll
     * @since 3.0.0
     *
     * @genericUse {T} - [value]
     *
     * @param {string} property - The name of the property to set.
     * @param {*} value - The value to set the property to.
     * @param {integer} [startIndex] - The first child index to start the search from.
     * @param {integer} [endIndex] - The last child index to search up until.
     */
    public function setAll(property:String, value:Dynamic, ?startIndex:Int, ?endIndex:Int):Void;
    /**
     * Passes all children to the given callback.
     *
     * @method Phaser.Structs.List#each
     * @since 3.0.0
     *
     * @genericUse {EachListCallback.<T>} - [callback]
     *
     * @param {EachListCallback} callback - The function to call.
     * @param {*} [context] - Value to use as `this` when executing callback.
     * @param {...*} [args] - Additional arguments that will be passed to the callback, after the child.
     */
    public function each(callback:EachListCallback, ?context:Dynamic, ?args:Dynamic):Void;
    /**
     * Clears the List and recreates its internal array.
     *
     * @method Phaser.Structs.List#shutdown
     * @since 3.0.0
     */
    public function shutdown():Void;
    /**
     * Destroys this List.
     *
     * @method Phaser.Structs.List#destroy
     * @since 3.0.0
     */
    public function destroy():Void;
}
