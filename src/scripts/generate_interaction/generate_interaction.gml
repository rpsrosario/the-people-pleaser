/// @function generate_interaction
/// @param index
///   Index of the interaction template.
/// @param character
///   Character involved in the interaction
/// @returns
///   A DS list with the generated interaction steps.
/// @description
///   Generates a concrete interaction from the interaction template.
///

// TODO: Cleanup code. It's all jumbled since it was coded in the final 3h of the jam

// TODO: Cleanup variable names... temp because of ds_map_copy making a shallow copy, so patching code
//       a la hammer

// TODO: Double check allocations, there are probably memory leaks somewhere due to monkey patching code

var index       = argument0;
var character   = argument1;
var template    = global.interactions[| index ];

var categories = template[? "categories" ];
var _categories = ds_list_create();

var category_count = ds_list_size(categories);
for (var c = 0; c < category_count; c++) {
  var category   = categories[| c];
  var terms      = global.terms_database[? category];
  var term_index = terms[? ".index" ];
  ds_list_shuffle(term_index); // TODO: This might repeat stuff since it is always shuffled
  
  _categories[| c] = term_index[| 0];
}

var sequence  = template[? "sequence" ];
var _sequence = ds_list_create();
var steps     = ds_list_size(sequence);
for (var s = 0; s < steps; s++) {
  var step  = sequence[| s];
  var _step = ds_map_create();
  _sequence[| s] = _step;
  ds_list_mark_as_map(_sequence, s);
  
  var text = step[? "text"];
  
  _step[? "text"  ]     = character[? "name" ] + ":\n\n" + generate_text(text, _categories);
  _step[? "score" ]     = generate_score(text, character, categories, _categories);
  _step[? "character" ] = character;
  
  var answers  = step[? "answers" ];
  var _answers = ds_map_create();
  ds_map_add_map(_step, "answers", _answers);
  
  if (ds_map_exists(answers, "0")) {
    // Only a neutral answer exists
    var neutral = answers[? "0" ];
    _answers[? "0" ] = generate_text(neutral, _categories);
  } else {
    // Both positive and negative answers exist
    
    { // TODO: Could be heavily deduplicated
      var template  = answers[? "+" ];
      var _template = ds_map_create();
      ds_map_add_map(_answers, "+", _template);
      
      var text = template[? "text" ];
      _template[? "text" ] = generate_text(text, _categories);
      
      var reaction  = template[? "reaction" ];
      var _reaction = ds_map_create();
      ds_map_add_map(_template, "reaction", _reaction);
      
      {
        var text = reaction[? "+" ];
        _reaction[? "+" ] = generate_text(text, _categories);
      }
      {
        var text = reaction[? "0" ];
        _reaction[? "0" ] = generate_text(text, _categories);
      }
      {
        var text = reaction[? "-" ];
        _reaction[? "-" ] = generate_text(text, _categories);
      }
    }
    
    { // TODO: Could be heavily deduplicated
      var template  = answers[? "-" ];
      var _template = ds_map_create();
      ds_map_add_map(_answers, "-", _template);
      
      var text = template[? "text" ];
      _template[? "text" ] = generate_text(text, _categories);
      
      var reaction  = template[? "reaction" ];
      var _reaction = ds_map_create();
      ds_map_add_map(_template, "reaction", _reaction);
      
      {
        var text = reaction[? "+" ];
        _reaction[? "+" ] = generate_text(text, _categories);
      }
      {
        var text = reaction[? "0" ];
        _reaction[? "0" ] = generate_text(text, _categories);
      }
      {
        var text = reaction[? "-" ];
        _reaction[? "-" ] = generate_text(text, _categories);
      }
    }
  }
}

ds_list_destroy(_categories);
return _sequence;
