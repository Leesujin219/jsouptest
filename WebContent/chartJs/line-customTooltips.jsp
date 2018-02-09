<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="array.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <title>Line Chart with Custom Tooltips</title>
  <script src="Chart.bundle.js"></script>
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
  <style>
    canvas{
      -moz-user-select: none;
      -webkit-user-select: none;
      -ms-user-select: none;
    }
    #chartjs-tooltip {
      opacity: 1;
      position: absolute;
      background: rgba(0, 0, 0, .7);
      color: white;
      border-radius: 3px;
      -webkit-transition: all .1s ease;
      transition: all .1s ease;
      pointer-events: none;
      -webkit-transform: translate(-50%, 0);
      transform: translate(-50%, 0);
    }

    .chartjs-tooltip-key {
      display: inline-block;
      width: 10px;
      height: 10px;
    }
  </style>
</head>

<body>
  <div id="canvas-holder1" style="width:75%;">
    <canvas id="chart1"/>
  </div>
  <script>
    window.count = 0;
    Chart.defaults.global.pointHitDetectionRadius = 1;
    var customTooltips = function(tooltip) {

      // Tooltip Element
      var tooltipEl = $('#chartjs-tooltip');

      if (!tooltipEl[0]) {
        $('body').append('<div id="chartjs-tooltip"></div>');
        tooltipEl = $('#chartjs-tooltip');
      }

      // Hide if no tooltip
      if (!tooltip.opacity) {
        tooltipEl.css({
          opacity: 0
        });
        $('.chartjs-wrap canvas')
          .each(function(index, el) {
            $(el).css('cursor', 'default');
          });
        return;
      }

      $(this._chart.canvas).css('cursor', 'pointer');

      // Set caret Position
      tooltipEl.removeClass('above below no-transform');
      if (tooltip.yAlign) {
        tooltipEl.addClass(tooltip.yAlign);
      } else {
        tooltipEl.addClass('no-transform');
      }

      // Set Text
      if (tooltip.body) {
        var innerHtml = [
          (tooltip.beforeTitle || []).join('\n'), (tooltip.title || []).join('\n'), (tooltip.afterTitle || []).join('\n'), (tooltip.beforeBody || []).join('\n'), (tooltip.body || []).join('\n'), (tooltip.afterBody || []).join('\n'), (tooltip.beforeFooter || [])
          .join('\n'), (tooltip.footer || []).join('\n'), (tooltip.afterFooter || []).join('\n')
        ];
        tooltipEl.html(innerHtml.join('\n'));
      }

      // Find Y Location on page
      var top = 0;
      if (tooltip.yAlign) {
        if (tooltip.yAlign == 'above') {
          top = tooltip.y - tooltip.caretHeight - tooltip.caretPadding;
        } else {
          top = tooltip.y + tooltip.caretHeight + tooltip.caretPadding;
        }
      }

      var position = $(this._chart.canvas)[0].getBoundingClientRect();

      // Display, position, and set styles for font
      tooltipEl.css({
        opacity: 1,
        width: tooltip.width ? (tooltip.width + 'px') : 'auto',
        left: position.left + tooltip.x + 'px',
        top: position.top + top + 'px',
        fontFamily: tooltip._fontFamily,
        fontSize: tooltip.fontSize,
        fontStyle: tooltip._fontStyle,
        padding: tooltip.yPadding + 'px ' + tooltip.xPadding + 'px',
      });
    };
    var randomScalingFactor = function() {
      return Math.round(Math.random() * 100);
    };
    var lineChartData = {
      labels: ["<%= labels[0]%>","<%= labels[1]%>",
			"<%= labels[2]%>","<%= labels[3]%>",
			"<%= labels[4]%>","<%= labels[5]%>",
			"<%= labels[6]%>"],
      datasets: [{
        label: "My First dataset",
        data: [<%=value1[0]%>,
			<%=value1[1]%>,
			<%=value1[2]%>,
			<%=value1[3]%>,
			<%=value1[4]%>,
			<%=value1[5]%>,
			<%=value1[6]%>]
      }, {
        label: "My Second dataset",
        data: [<%=value2[0]%>,
			<%=value2[1]%>,
			<%=value2[2]%>,
			<%=value2[3]%>,
			<%=value2[4]%>,
			<%=value2[5]%>,
			<%=value2[6]%>]
      }]
    };

    window.onload = function() {
      var chartEl = document.getElementById("chart1");
      window.myLine = new Chart(chartEl, {
        type: 'line',
        data: lineChartData,
        options: {
          title:{
            display:true,
            text:'Chart.js Line Chart - Custom Tooltips'
          },
          tooltips: {
            enabled: false,
            custom: customTooltips
          }
        }
      });
    };
  </script>
</body>

</html>
