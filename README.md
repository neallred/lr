# lr

Available at [lr.allthings.red](http://lr.allthings.red), a simple left/right timer serving as a tracker free alternative to the feeding feature of the [Glow baby app](https://play.google.com/store/apps/details?id=com.glow.android.baby).

The only server communication is to download the page and icon.

Data is stored in your browser of choice.

`localStorage` stores which side was timed last, and how long ago the last interaction was.

`sessionStorage` stores the last time the timer ran (needed for when the web page gets "backgrounded" so that an accurate count can be kept when opening the page again).

## setup

Run `./x dep`.

## dev

Make changes to assets, then run `./x dev`

## prod

Run `./x prod`. Copy `target/x86_64-unknown-linux-musl/release/lr-allthings-rd` to your server and run it on the port of your choosing.
