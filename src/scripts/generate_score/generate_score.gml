// TODO: Document

// TODO: Currently duplicate terms are scored twice, oh well

var template   = argument0;
var character  = argument1;
var categories = argument2;
var terms      = argument3;

var count = ds_list_size(template);
var tscore = 0;

for (var s = 0; s < count; s++) {
  var segment = template[| s ];
  if (is_real(segment)) {
    var term     = terms[| segment ];
    var category = categories[| segment ];
    
    var _terms = global.terms_database[? category ];
    var _score = _terms[? term ];
    
    var tags      = character[? "tags" ];
    var tag_count = ds_list_size(tags);
    for (var t = 0; t < tag_count; t++) {
      var tag = tags[| t];
      if (ds_map_exists(_score, tag)) {
        tscore += _score[? tag ];
      }
    }
  }
}

return tscore;
