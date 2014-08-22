StatusCake report
=================

This is a widget for [Übersicht](http://tracesof.net/uebersicht/) that displays the status of your sites being monitored by the [StatusCake](http://statuscake.com/) service.

## Details

If a site is **up**, it will be preceded by a *green* dot, if **down** it will be preceded by a blinking *red* dot.

![image](https://raw.githubusercontent.com/things/uebersicht-statuscake/master/screenshot.png)

## Configuration

Open index.coffee and:

* Insert your **API key** and **Username** from StatusCake.
* Optionally edit the **refreshFrequency** value to change how often the API gets hit. Please note that free accounts are limited to 250 calls a day so don't refresh too often.
* Adjust **left** and **bottom** values in the CSS to position the widget to your liking (it's positioned from the bottom to account for a variable number of sites)