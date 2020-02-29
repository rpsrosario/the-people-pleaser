/// @function assert
/// @param [condition]
///   The condition that must be true. False by default since it should be provided.
/// @param [message]
///   Optional message to display if the assertion fails.
/// @description
///   Asserts that a given condition is true, aborting the game if it isn't.
///

// TODO: Remove usages of assert by proper error handling.

var condition = false;
var message   = "Assertion failed";

switch (argument_count) {
  case 2: message   = argument[1];
  case 1: condition = argument[0];
}

if (!condition) {
  show_error(message, true);
}
