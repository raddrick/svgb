// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
(function($) {
  
  window.SVGBStage = Backbone.Model.extend({
    
  });
  
  window.SVGBStageView = Backbone.View.extend({
    tagName: 'g',
    className: 'svgb-view',
    initialize: function(){
      this.template = _.template($('#svgb-stage-template').html());
    },
    render: function(){
      var renderedContent = this.template(this.model.toJSON());
      $(this.el).html(renderedContent);
      return this;
    }
  });
  
  window.SVGBStages = Backbone.Collection.extend({
    model: SVGBStage,
    url: '/'
  });
})(jQuery);
