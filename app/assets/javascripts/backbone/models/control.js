// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
(function($) {
  
  window.SVGBControl = Backbone.Model.extend({
    defaults: {
      'viewBox': [0,0,200,0],
      'width':500,
      'height':500,
      'masked':true
    },    
    initialize: function(){
      
    }
  });
  
  window.SVGControls = Backbone.Collection.extend({
    model: SVGBControl,
    url: '/'
  });

  window.SVGBControlView = Backbone.View.extend({
    tagName: 'g',
    className: 'svgb ctrl-view',
    
    initialize: function(){
      _.bindAll(this, 'render');
      this.collection.bind('reset', this.render);
    },
    render: function( template_css_selector ){
      var $stages,
        collection = this.collection;

      this.template = _.template($(tempate_css_selector).html());

      $(this.el).html(this.template(this.model.toJSON()));
      $stages = this.$('.stages');
      collection.each(function(stage){
        var view = new SVGBStageView({
          model: stage,
          collection: collection
        });
        var view = view.render().el;
        $stages.append(view);
      });
      
      $(this.el).mousemove(_.bind(this.mousemove,this));
      
      return this;
    }
  });
})(jQuery);