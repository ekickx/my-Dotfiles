# About

This is collection of my commands

# Explaination

## Battery Monitor

This is a script to turn off desktop at certain battery level

### How to Use

First you must install `acpi`

```shell
sudo apt install acpi
```

## Center

Because I can't find default center tiling in xfwm so I create this script

### How to use

Just make a hot key to trigger this command

## Music Notifier

This is a notifier to show music information and cover art from `quodlibet`.

### How to Use

Install `quodlibet` and `n30f`

```shell
sudo apt install quodlibet
```

And for  `n30f` installition you can see [this repository](https://github.com/sdhand/n30f)

Not least, you must activate plugin in quodlibet

Then make folder art inside folder `.quodlibet`

```sh
mkdir -p ~/.quodlibet/art/
```

After that make hotkey to trigger this script

## Screenshot

Script to take a screenshot with notification

### How to use

Install `scrot` and `fontawesome`

```sh
sudo apt install scrot
```

To install fontawesome go to this [website](https://fontawesome.com/).

The last make hotkey to take screenshot

## Tmux-Session
This script is for save and restore tmux sessions. This script isn't my own. I get it from [here](https://github.com/mislav/dotfiles/blob/d2af5900fce38238d1202aa43e7332b20add6205/bin/tmux-session)
