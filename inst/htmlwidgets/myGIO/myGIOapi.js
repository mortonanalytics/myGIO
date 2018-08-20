//myGIO project
//Ryan Morton, dba Morton Analytics

var myGIOmap = function(opts){
	//pass chart elements
	this.element = opts.element;
	this.mapLayers = opts.mapLayers;
	this.options = opts.options;
	
	//create the chart 
	//widget calls the update function if chart already exists
	this.draw(this.element);
}

myGIOmap.prototype.draw = function(chartElement){
	
	//define dimensions
	this.width = chartElement.offsetWidth;
	this.height = Math.max(chartElement.offsetHeight);
	var user_margins = this.options.margins;
	this.margin = { top: user_margins.top, right: user_margins.right, bottom: user_margins.bottom, left: user_margins.left};
	
	//set up parent element and SVG
	chartElement.innerHTML = '';
	
	this.svg = d3.select(chartElement).append('svg')
		.attr('id', chartElement.id + '-svg-chart')
		.attr('width', this.width)
		.attr('height', this.height);
	
	//create g element
	this.plot = this.svg.append('g')
		.attr('transform','translate('+this.margin.left+','+this.margin.top+')');
	
	this.chart = this.plot.append('g');
			
	//initialize chart
	this.setClipPath(chartElement);
	this.processScales(this.mapLayers, this.options);
	this.routeLayers(this.mapLayers, chartElement);
}

myGIOmap.prototype.setClipPath = function(chartElement){
	this.clipPath = this.plot.append('defs').append('svg:clipPath')
		.attr('id', chartElement.id + 'clip')
	  .append('svg:rect')
		.attr('x', 0)
		.attr('y', 0)
		.attr('width', this.width - (this.margin.left + this.margin.right))
		.attr('height', this.height - (this.margin.top + this.margin.bottom));
		
	this.plot.attr('clip-path', 'url(#' + chartElement.id + 'clip'+ ')')
}

myGIOmap.prototype.processScales = function(mapLayers, options){
	
}

myGIOmap.prototype.routeLayers = function(lys, chartElement){
	var that = this;

	this.layerIndex = lys.map(function(d) {return d.label; });
	
	lys.forEach(function(d){

		var layerType = d.type;
		var layerData = d.data;

		if(layerType == "base") {
			that.addBase(d, chartElement);
		} else if(layerType == "point"){
			that.addPoints(d, chartElement)
		} else if(layerType == "polygon"){
			that.addPolygons(d, chartElement)
		} else if(layerType == "line"){
			that.addLines(d, chartElement)
		} else  {
			alert("Wrong Layer Type!")
		}
		
	});
}