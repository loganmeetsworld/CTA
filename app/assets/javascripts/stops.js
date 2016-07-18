// Search functions
app.Stops = function() {
  this._input = $('#stops-search-txt');
  this._initAutocomplete();
};

app.Stops.prototype = {
  _initAutocomplete: function() {
    this._input
      .autocomplete({
        source: '/stops',
        appendTo: '#stops-search-results',
        select: $.proxy(this._select, this)
      })
      .autocomplete('instance')._renderItem = $.proxy(this._render, this);
  },

  _render: function(ul, item) {
    var markup = [
      ['<a href="/stops/', item.id].join("") + '><span class="on_street">' + item.on_street + ' and </span> ',
      '<span class="cross_street">' + item.cross_street + '</span>',
      '<br><span class="stop_id">' + 'Stop ' + item.stop_id + '</span></a>'
    ];
    return $('<li>')
      .append(markup.join(''))
      .appendTo(ul);
  },

  _select: function(e, ui) {
    this._input.val(ui.item.on_street + ' and ' + ui.item.cross_street);
    return false;
  }
};
