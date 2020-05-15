HTMLWidgets.widget({

  name: 'myGIO',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        // general chart with layers
		if(x.layers) {
			if(this.map){
				this.map.update(x);
			} else {
				this.map = new myGIOmap({
					element: document.getElementById(el.id),
					mapLayers: x.layers,
					options: x.options
					});
			}
		}

      },

      resize: function(width, height) {

        //chart will use its own resize method
        if(this.map) {
			this.map.resize(width, height);
		}

      }

    };
  }
});