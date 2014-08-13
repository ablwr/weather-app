# Weather App

## Description

Weather app that texts users if it will rain at a specified time.

## Screenshots

Coming soon!

## Background

This application seeks to fulfill a specific need: remind people if they need to bring their umbrella with them to work in the morning based on the weather forecast.

## Features

+ Harnessed the Forecast.io API for gathering real-time user-specific weather data
+ Used the Twilio API to send text messages to users
+ Built Sidkiq workers to handle text message on sign up and Heroku scheduler for texting users according to their time preference 
+ Implemented OAuth 1.1 to allow users to login through their Twitter account

## Usage

Users sign up and receive a text message only if the weather forecast calls for rain.

## Development/Contribution

Tests will be written.

## Future

- Full test coverage
- Better server integration
- Allow users to text a number to receive current weather updates
- More accurate weather tracking

## Authors

Ashley Blewer(https://github.com/ablwr)
Kyle Doherty(https://github.com/kylefdoherty)
Luke Demarest(https://github.com/ldemarest)

## License

Weather App is MIT Licensed. See LICENSE for details.