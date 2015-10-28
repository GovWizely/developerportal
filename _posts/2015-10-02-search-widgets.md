--- 
permalink: "search-widgets.html" 
layout: body 
title: App Gallery 
published: true 
---

#ITA Search Widgets

ITA has created these widgets to make it as easy as possible to put a search engine for each of our APIs on your web page.  Simply follow the instructions below to embed the code, and to change the look and feel to match your site.
These search widgets deliver results straight from our APIs so your customers get the same results as anyone using the APIs directly.  Please [contact us](contact.html) if you have any questions on how to install and use the widgets.

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

---

###Consolidated Screening List Widget

The [Consolidated Screening List](consolidated-screening-list.html) widget searches eleven export screening lists from the Departments of Commerce, State and the Treasury.  The widget enables your customers to do a quick screening search for people or companies with whom they are doing business or are party to their overseas transactions.

The widget returns results that are either exact matches and near matches in case your customers don’t have the exact spelling of the name.  The closer the match, the higher the name in the results.

<div class="jumbotron transparent">
  <div class="container">

<div id="example-widget-container"></div>

</div>
</div>

###Trade Leads Widget

The [Trade Leads](trade-leads.html) widget searches contract opportunities for U.S. businesses selling their products and services overseas. These leads come from a variety of sources including FedBizOps, The United Kingdom, Canada, The Millennium Challenge Corporation, and Australia.

The widget enables your customers to do a quick search for trade leads, procurement opportunities, and contract notifications in a particular country or within all countries.  They can also search for all of the leads in a country by leaving the search box blank. 

<div class="jumbotron transparent">
  <div class="container">
  
<div id="example-trade-leads-widget-container"></div>

</div>
</div>

###Trade Events Widget

The [Trade Events](trade-events.html) widget searches for events organized by ITA, the U.S. Trade and Development Agency, the State Department, and the Small Business Administration.

The widget enables your customers to do a quick search for trade events such as industry conferences, webinars, lectures, and trade missions in a particular country or within all countries.  They can also search for all of the events in a country by leaving the search box blank. 

<div class="jumbotron transparent">
  <div class="container">

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

4.  Endpoint should be set to `"consolidated_screening_list"` for CSL, `"trade_leads"` for Trade Leads Widget, or `"trade_events"` for Trade Events widget.
5.  Add `<div id="example-widget-container"></div>` to wherever you wish the widget to appear.
