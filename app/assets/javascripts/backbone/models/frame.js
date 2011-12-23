// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
(function($) {
  
  window.SVGBFrame = Backbone.Model.extend({
    defaults: {
      'viewBox': [0,0,200,0],
      'width':500,
      'height':500,
      'masked':true
    },    
    initialize: function(){
      
    }
  });
    
  window.SVGBFrameView = Backbone.View.extend({
    tagName: 'div',
    className: 'svgb',
    
    mousemove: function(evt){
      this.coord = {};
      evt = evt || window.event;
      if(evt.pageX || evt.pageY){
        this.coord =  { x:evt.pageX , y:evt.pageY };
      }
      this.model.coord =  {
        x:evt.clientX + document.body.scrollLeft - document.body.clientLeft,
        y:evt.clientY + document.body.scrollTop  - document.body.clientTop
      };
      
    },  
    initialize: function(){
      _.bindAll(this, 'render');
      this.template = _.template($('#svgb-frame-template').html());
      this.collection.bind('reset', this.render);
    },
    render: function(){
      var $stages,
        collection = this.collection;
      this.template = _.template($('#svgb-frame-template').html());
      
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