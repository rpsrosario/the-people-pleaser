/// @function generate_text
/// @param template
///   DS List with the text template.
/// @param terms
///   DS List with the concrete terms.
/// @returns
///   A string with the concrete text from the supplied template.
/// @description
///   Generates a concrete text from the template of the text and the selected terms.
///

var template = argument0;
var terms    = argument1;

var count = ds_list_size(template);
var text  = "";
for (var s = 0; s < count; s++) {
  var segment = template[| s ];
  text += is_string(segment) ? segment : terms[| segment ];
}

return text;
