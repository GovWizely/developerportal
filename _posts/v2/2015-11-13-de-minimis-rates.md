---
permalink: "/de-minimis.html"
layout: body
title: De Minimis API
published: true
---

#De Minimis API

{% include de-minimis-rates/tabs %}

##Resource URL

{% include de-minimis-rates/query.html %}

##Search Parameters

###keyword

Returns de minimis rates for a match in the **country** or **notes** fields.

    {{ site.webservices_baseurl }}/de_minimis/search?api_key={your key}&q={keyword}

**_Example_**

{% include de-minimis-rates/query-keyword.html %}

###countries

Returns de minimis rates for a specific country based on [ISO alpha-2 country codes](http://www.iso.org/iso/country_codes). Enter multiple terms by seperating with a comma.

    {{ site.webservices_baseurl }}/de_minimis/search?api_key={your key}&countries={country code}

**_Example_**

{% include de-minimis-rates/query-country.html %}

###size + offset

The **size** parameter allows you to configure the number of results to be returned up to a maximum of 100. The **offset** parameter defines the offset from the first result you want to fetch. Unless specified the API returns 10 results at a time.

**_Example_**

{% include de-minimis-rates/query-size.html %}

###Return Values

| Field               | Description                                                     |
| ---------------     | --------------------------------------------------------------- |
| country             | Name of the country |
| countries           | [ISO-2 country code](http://www.iso.org/iso/country_codes)  |
| de_minimis_value    | De Minimis value for that country |
| de_minimis_currency | [ISO-3 currency code](http://www.iso.org/iso/home/standards/currency_codes.htm) for the country's De Minimis |
| vat_amount          | Value Added Tax amount |
| vat_currency        | [ISO-3 currency code](http://www.iso.org/iso/home/standards/currency_codes.htm) for the country's VAT |
| notes               | Notes for each De Minimis and VAT amount |