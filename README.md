# CTA
CTA ridership, stops, and routes data visualizations.

## Data
[CTA - Ridership - Avg. Weekday Bus Stop Boardings in October 2012](https://data.cityofchicago.org/Transportation/CTA-Ridership-Avg-Weekday-Bus-Stop-Boardings-in-Oc/mq3i-nnqe)
Source: Socrata API
Columns/Attributes: stop id, street, cross street, routes, average daily on-boarding, average daily de-boarding, location (lat/long)

## To Install
`git clone https://github.com/loganmeetsworld/CTA.git`
`bundle install`
`rake db:create db:migrate db:seed`