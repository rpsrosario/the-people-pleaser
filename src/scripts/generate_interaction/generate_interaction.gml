/// @function generate_interaction
/// @param index
///   Index of the interaction template.
/// @returns
///   A DS Map with the generated interaction.
/// @description
///   Generates a concrete interaction from the interaction template.
///

// TODO: Cleanup code. It's all jumbled since it was coded in the final 3h of the jam

var index       = argument0;
var template    = global.interactions[| index ];
var interaction = ds_map_create();
ds_map_copy(interaction, template);

var categories = interaction[? "categories" ];
ds_map_delete(interaction, "categories");

var category_count = ds_list_size(categories);
for (var c = 0; c < category_count; c++) {
  var category   = categories[| c];
  var terms      = global.terms_database[? category];
  var term_index = terms[? ".index" ];
  ds_list_shuffle(term_index); // TODO: This might repeat stuff since it is always shuffled
  
  categories[| c] = term_index[| 0];
}
ds_map_add_list(interaction, "terms", categories); // They have been converted to the actual terms

var sequence = interaction[? "sequence" ];
var steps    = ds_list_size(sequence);
for (var s = 0; s < steps; s++) {
  var step = sequence[| s];
  
  var text = step[? "text"]; // TODO: Logic could be incorporated into generate_text
  ds_map_delete(step, "text");
  step[? "text" ] = generate_text(text, categories);
  ds_list_destroy(text);
  
  var answers = step[? "answers" ];
  if (ds_map_exists(answers, "0")) {
    // Only a neutral answer exists
    var neutral = answers[? "0" ];
    ds_map_delete(answers, "0");
    answers[? "0" ] = generate_text(neutral, categories);
    ds_list_destroy(neutral);
  } else {
    // Both positive and negative answers exist
    
    { // TODO: Could be heavily deduplicated
      var template = answers[? "+" ];
      
      var text = template[? "text" ];
      ds_map_delete(template, "text");
      template[? "text" ] = generate_text(text, categories);
      ds_list_destroy(text);
      
      var reaction = template[? "reaction" ];
      {
        var text = reaction[? "+" ];
        ds_map_delete(reaction, "+");
        reaction[? "+" ] = generate_text(text, categories);
        ds_list_destroy(text);
      }
      {
        var text = reaction[? "0" ];
        ds_map_delete(reaction, "0");
        reaction[? "0" ] = generate_text(text, categories);
        ds_list_destroy(text);
      }
      {
        var text = reaction[? "-" ];
        ds_map_delete(reaction, "-");
        reaction[? "-" ] = generate_text(text, categories);
        ds_list_destroy(text);
      }
    }
    
    { // TODO: Could be heavily deduplicated
      var template = answers[? "-" ];
      
      var text = template[? "text" ];
      ds_map_delete(template, "text");
      template[? "text" ] = generate_text(text, categories);
      ds_list_destroy(text);
      
      var reaction = template[? "reaction" ];
      {
        var text = reaction[? "+" ];
        ds_map_delete(reaction, "+");
        reaction[? "+" ] = generate_text(text, categories);
        ds_list_destroy(text);
      }
      {
        var text = reaction[? "0" ];
        ds_map_delete(reaction, "0");
        reaction[? "0" ] = generate_text(text, categories);
        ds_list_destroy(text);
      }
      {
        var text = reaction[? "-" ];
        ds_map_delete(reaction, "-");
        reaction[? "-" ] = generate_text(text, categories);
        ds_list_destroy(text);
      }
    }
  }
}

return interaction;
