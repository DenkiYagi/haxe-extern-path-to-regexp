package js.pathtoregexp;

import externtype.Mixed2;
import externtype.ValueOrArray;

@:jsRequire("path-to-regexp")
extern class PathToRegexp extends js.RegExp {
    @:selfCall
    @:overload(function (path: PathPattern, ?keys: Array<Key>, ?options: {>RegExpOptions, >ParseOptions,}): Void {})
    function new(path: PathPattern, ?options: {>RegExpOptions, >ParseOptions,}): Void;

    /**
     * Parse an Express-style path into an array of tokens.
     */
    static function parse(path: String, ?options: ParseOptions): Array<Mixed2<String, Key>>;

    /**
     * Transforming an Express-style path into a valid path.
     */
    static function compile(path: String, ?options: ParseOptions): PathFunction;
}

typedef PathPattern = Mixed2<ValueOrArray<String>, ValueOrArray<RegExp>>;

typedef Key = {
    var name(default, never): Mixed2<String, Int>;
    var prefix(default, never): String;
    var delimiter(default, never): String;
    var optional(default, never): Bool;
    var repeat(default, never): Bool;
    var pattern(default, never): String;
    var partial(default, never): Bool;
}

typedef RegExpOptions = {
    /**
     * When `true` the route will be case sensitive. (default: `false`)
     */
    @:optional var sensitive(default, default): Bool;
    /**
     * When `false` the trailing slash is optional. (default: `false`)
     */
    @:optional var strict(default, default): Bool;
    /**
     * When `false` the path will match at the beginning. (default: `true`)
     */
    @:optional var end(default, default): Bool;
    /**
     * Sets the final character for non-ending optimistic matches. (default: `/`)
     */
    @:optional var delimiter(default, default): String;
    /**
     * List of characters that can also be "end" characters.
     */
    @:optional var endsWith(default, default): ValueOrArray<String>;
}

typedef ParseOptions = {
    /**
     * Set the default delimiter for repeat parameters. (default: `'/'`)
     */
    @:optional var delimiter(default, default): String;
    /**
     * List of valid delimiter characters. (default: `'./'`)
     */
    @:optional var delimiters(default, default): ValueOrArray<String>;
}

typedef PathFunction = ?Dynamic<Dynamic> -> ?PathFunctionOptions -> String;

typedef PathFunctionOptions = {
    /**
     * Function for encoding input strings for output.
     */
    @:optional var encode(default, default): String -> String -> String;
}