<!DOCTYPE html>
<head>
<title>Speedometer</title>
<link rel='stylesheet' href="d3css/googleAPI.css" type='text/css'>
<link rel='stylesheet' href="d3css/mycss.css" type='text/css'>



</head>
<body style="background-color: white;">
	<script type="text/javascript" src="scripts/d3/d3.v3.min.js"></script>
	<script type="text/javascript" src="scripts/d3/iopctrl.js"></script>
	<div>
		<span id="speedometer"></span> <span id="alarm"></span>
	</div>
	<script>
	
		var value1
        var svg = d3.select("#speedometer")
                .append("svg:svg")
                .attr("width", 500)
                .attr("height", 500);

        var gauge = iopctrl.arcslider()
                .radius(170)
                .events(false)
                .indicator(iopctrl.defaultGaugeIndicator);
        gauge.axis().orient("in")
                .normalize(true)						
                .ticks(15)
                .tickSubdivide(4)
                .tickSize(35, 20, 10)
                .tickPadding(5)
                .scale(d3.scale.linear()
                .domain([0, 10000])
                .range([-3.3*Math.PI/4, 3.3*Math.PI/4])
        
                );

        var segDisplay = iopctrl.segdisplay()
                .width(80)
                .digitCount(5)
                .negative(false)
                .decimals(0);

        svg.append("g")
                .attr("class", "segdisplay")
                .attr("transform", "translate(170, 260)")
               	.call(segDisplay);

        svg.append("g")
                .attr("class", "gauge")
                .call(gauge);

        setInterval(randomValue, 800);
        
        function randomValue() {
            value1 = Math.round(Math.random() * 10000);
    		segDisplay.value(value1);
            gauge.value(value1);   
          }
     </script>
</body>