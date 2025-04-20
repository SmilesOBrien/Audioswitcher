# AudioSwitcher for Bash

This is a script that allows you to swap between audio devices by invoking pactl

This script was written with the help of Google's Gemini AI, along with my own sleuthing on pactl commands and syntax. I am not much of a coder / scripter myself. This was purpose-made for my personal use but I have somewhat genericised the script should anyone else find it useful.

I have this script set to a keyboard shortcut within KDE so I can switch between headphones and speakers with one button press.

# Quick-and-Dirty Method to Identify Profiles to Switch Between

In order to find the profiles you wish to switch between, do the following:

Retrieve the list of cards and their properties by running:
```
pactl list cards
```
I was able to determine the specific card by comparing the names of the Profiles in the KDE gui to the Profiles Output list. If you JUST need the Card Identifier for the variable in the script, without the extra faff, do:
```
pactl list cards short
```
Copy the approprite ID into the "card_identifier" variable
Retrieve the list of profiles on the above-specified card by running:
```
pactl list cards | grep -A 1000 "CARD IDENTIFIER IN QUOTES" | grep "Profiles:" -A 10
```
Find the profiles in the list that match what your GUI says, and put them into "Profile1" and "Profile2" as appropriate.
