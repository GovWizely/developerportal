--- 
permalink: "search-widgets.html" 
layout: body 
title: App Gallery 
published: true 
---

#ITA Search Widgets

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.

<link rel="stylesheet" type="text/css" href="widget.css">
<script type="text/javascript" src="widget.js"></script>

<script>
      $(document).ready(function ($) {
        $("#example-widget-container").searchWidget({
          apiKey:   'BieztMWzm1EGY71oPH1KFpwm',
          host:     'https://api.trade.gov',
          endpoint: 'consolidated_screening_list'
        });

        $("#example-trade-leads-widget-container").searchWidget({
          apiKey:   'BieztMWzm1EGY71oPH1KFpwm',
          host:     'https://api.trade.gov',
          endpoint: 'trade_leads'
        });

        $("#example-trade-events-widget-container").searchWidget({
          apiKey:   'BieztMWzm1EGY71oPH1KFpwm',
          host:     'https://api.trade.gov',
          endpoint: 'trade_events'
        });
      });
</script>

<div class="jumbotron transparent">
  <div class="container">
<h3>CSL Widget</h3>

<div id="example-widget-container"></div>

</div>
</div>

<div class="jumbotron transparent">
  <div class="container">
<h3>Trade Leads Widget</h3>

<div id="example-trade-leads-widget-container"></div>

</div>
</div>

<div class="jumbotron transparent">
  <div class="container">
<h3>Trade Events Widget</h3>

<div id="example-trade-events-widget-container"></div>

</div>
</div>

##Add a widget to your web page:

1.  Download the [JavaScript](widget.js) and [CSS](widget.css) source files and host them on your site.
2.  Make sure you load jQuery:

        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

3.  Add the following to your page’s `<head>` after jQuery’s `<script>` tag:

        <link rel="stylesheet" type="text/css" href="widget.css">
        <script type="text/javascript" src="widget.js"></script>
        <script>
            $(document).ready(function ($) {
                 $("#example-widget-container").searchWidget({
                       apiKey: "Your API key", // get it from http://api.trade.gov/
                       endpoint: "consolidated_screening_list"
                       // Possible endpoints: "consolidated_screening_list"|"trade_leads"
                 });
            });
        </script>

4.  Endpoint should be set to `"consolidated_screening_list"` for CSL, or `"trade_leads"` for Trade Leads Widget.
5.  Add `<div id="example-widget-container"></div>` to wherever you wish the widget to appear.