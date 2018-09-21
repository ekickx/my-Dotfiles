#!/bin/bash/
wal -e -t -i $1

FILE=~/.cache/wal/colors.sh
source $FILE

music(){
if [[ -e ~/.quodlibet/art/.wal/ ]]; then
	rm -r ~/.quodlibet/art/.wal/
fi
mkdir -p ~/.quodlibet/art/.wal

cat <<EOF
#!/bin/bash

if [[ -e ~/.quodlibet/current ]]; then

	dunstify "$(echo "$")(echo -e "$(echo "$")(quodlibet --print-playing "<title>")\n$(echo "$")(quodlibet --print-playing "<artist|<artist>|Unknown Artist>")")" "$(echo "$")(quodlibet --print-playing "<~rating>")"
	
	if [[ -e ~/.quodlibet/art/.wal/"$(echo "$")(echo "$(echo "$")(quodlibet --print-playing "<title>").png")" ]]; then	
		n30f -x 149 -y 50 ~/.quodlibet/art/.wal/"$(echo "$")(echo "$(echo "$")(quodlibet --print-playing "<title>").png")"&
		sleep 7 
		pkill n30f																									
		exit;																										
				
	else

		if [[ -e ~/.quodlibet/current.cover ]]; then
			convert -resize 140x140 -border 5x5 -bordercolor "$color0" ~/.quodlibet/current.cover "$(echo "$")(echo "pre-$(echo "$")(quodlibet --print-playing "<title>").png")"
			convert -border 3x3 -bordercolor "$color6" "$(echo "$")(echo "pre-$(echo "$")(quodlibet --print-playing "<title>").png")" "$(echo "$")(echo "$(echo "$")(quodlibet --print-playing "<title>").png")"
			mv "$(echo "$")(echo "$(echo "$")(quodlibet --print-playing "<title>").png")" ~/.quodlibet/art/.wal/
			rm "$(echo "$")(echo "pre-$(echo "$")(quodlibet --print-playing "<title>").png")" 
			n30f -x 149 -y 50 ~/.quodlibet/art/.wal/"$(echo "$")(echo "$(echo "$")(quodlibet --print-playing "<title>").png")"&
			sleep 6.3
			pkill n30f	
			exit;
		fi
	fi
fi

EOF

} > ~/.config/thegen/music.sh

notify(){
	cat << EOF
[global]
	font = Hack Nerd Font 10

	# Allow a small subset of html markup:
	#   <b>bold</b>
	#   <i>italic</i>
	#   <s>strikethrough</s>
	#   <u>underline</u>
	#
	# For a complete reference see
	# <http://developer.gnome.org/pango/stable/PangoMarkupFormat.html>.
	# If markup is not allowed, those tags will be stripped out of the
	# message.
	markup = yes
	plain_text = no

	# The format of the message.  Possible variables are:
	#   %a  appname
	#   %s  summary
	#   %b  body
	#   %i  iconname (including its path)
	#   %I  iconname (without its path)
	#   %p  progress value if set ([  0%] to [100%]) or nothing
	# Markup is allowed
	format = "<b>%s</b>\n%b"

	# Sort messages by urgency.
	sort = no

	# Show how many messages are currently hidden (because of geometry).
	indicate_hidden = yes

	# Alignment of message text.
	# Possible values are "left", "center" and "right".
	alignment = left

	# The frequency with wich text that is longer than the notification
	# window allows bounces back and forth.
	# This option conflicts with "word_wrap".
	# Set to 0 to disable.
	bounce_freq = 0

	# Show age of message if message is older than show_age_threshold
	# seconds.
	# Set to -1 to disable.
	show_age_threshold = -1

	# Split notifications into multiple lines if they don't fit into
	# geometry.
	word_wrap = yes

	# Ignore newlines '\n' in notifications.
	ignore_newline = no

	# Hide duplicate's count and stack them
	stack_duplicates = yes
	hide_duplicates_count = yes


	# The geometry of the window:
	#   [{width}]x{height}[+/-{x}+/-{y}]
	# The geometry of the message window.
	# The height is measured in number of notifications everything else
	# in pixels.  If the width is omitted but the height is given
	# ("-geometry x2"), the message window expands over the whole screen
	# (dmenu-like).  If width is 0, the window expands to the longest
	# message displayed.  A positive x is measured from the left, a
	# negative from the right side of the screen.  Y is measured from
	# the top and down respectevly.
	# The width can be negative.  In this case the actual width is the
	# screen width minus the width defined in within the geometry option.
	#geometry = "250x50-40+40"
	geometry = "300x50-15+50"

	# Shrink window if it's smaller than the width.  Will be ignored if
	# width is 0.
	shrink = no

	# The transparency of the window.  Range: [0; 100].
	# This option will only work if a compositing windowmanager is
	# present (e.g. xcompmgr, compiz, etc.).
	transparency = 0

	# Don't remove messages, if the user is idle (no mouse or keyboard input)
	# for longer than idle_threshold seconds.
	# Set to 0 to disable.
	idle_threshold = 0

	# Which monitor should the notifications be displayed on.
	monitor = 0

	# Display notification on focused monitor.  Possible modes are:
	#   mouse: follow mouse pointer
	#   keyboard: follow window with keyboard focus
	#   none: don't follow anything
	#
	# "keyboard" needs a windowmanager that exports the
	# _NET_ACTIVE_WINDOW property.
	# This should be the case for almost all modern windowmanagers.
	#
	# If this option is set to mouse or keyboard, the monitor option
	# will be ignored.
	follow = none

	# Should a notification popped up from history be sticky or timeout
	# as if it would normally do.
	sticky_history = yes

	# Maximum amount of notifications kept in history
	history_length = 15

	# Display indicators for URLs (U) and actions (A).
	show_indicators = no

	# The height of a single line.  If the height is smaller than the
	# font height, it will get raised to the font height.
	# This adds empty space above and under the text.
	line_height = 3

	# Draw a line of "separatpr_height" pixel height between two
	# notifications.
	# Set to 0 to disable.
	separator_height = 2

	# Padding between text and separator.
	padding = 10

	# Horizontal padding.
	horizontal_padding = 13


	# Define a color for the separator.
	# possible values are:
	#  * auto: dunst tries to find a color fitting to the background;
	#  * foreground: use the same color as the foreground;
	#  * frame: use the same color as the frame;
	#  * anything else will be interpreted as a X color.
	separator_color = frame


	# Print a notification on startup.
	# This is mainly for error detection, since dbus (re-)starts dunst
	# automatically after a crash.
	startup_notification = false

	# dmenu path.
	dmenu = /usr/bin/dmenu -p dunst:

	# Browser for opening urls in context menu.
	browser = /usr/bin/firefox -new-tab

	# Align icons left/right/off
	icon_position = off
	max_icon_size = 80

	# Paths to default icons.
	icon_folders = /usr/share/icons/Paper/16x16/mimetypes/:/usr/share/icons/Paper/48x48/status/:/usr/share/icons/Paper/16x16/devices/:/usr/share/icons/Paper/48x48/notifications/:/usr/share/icons/Paper/48x48/emblems/:/usr/share/icons/Papirus-Dark-Breeze-actions/48x48/status/

[frame]
	width = 3
	color = "$color6"


[shortcuts]

	# Shortcuts are specified as [modifier+][modifier+]...key
	# Available modifiers are "ctrl", "mod1" (the alt-key), "mod2",
	# "mod3" and "mod4" (windows-key).
	# Xev might be helpful to find names for keys.

	# Close notification.
	close = ctrl+space

	# Close all notifications.
	close_all = ctrl+shift+space

	# Redisplay last message(s).
	# On the US keyboard layout "grave" is normally above TAB and left
	# of "1".
	history = ctrl+grave

	# Context menu.
	context = ctrl+shift+period

[urgency_low]
	# IMPORTANT: colors have to be defined in quotation marks.
	# Otherwise the "#" and following would be interpreted as a comment.
	foreground = "$color15"
	background = "$color0"
	frame_color = "$color6"
	timeout = 6

[urgency_normal]
	frame_color = "$color6"
	foreground = "$color15"
	background = "$color0"
	timeout = 6

[urgency_critical]
	frame_color = "$color6"
	foreground = "$color15"
	background = "$color0"
	timeout = 8

EOF

pkill dunst  > /dev/null 2>&1

} > ~/.config/thegen/dunstrc


notify
music






