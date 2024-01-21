<p align="center">
    <img height="150" alt="A dark file icon. Inside it is a green circle, which is surrounded by two curly brackets." src="/.repoassets/file-icon.svg">
</p>

# Dotfiles.

Configs and scripts for my Hyprland setup, managed with [chezmoi](https://www.chezmoi.io/).

I use [Arch](https://archlinux.org/) btw.

![Desktop screenshot.](/.repoassets/screenshot_desktop.png)

![Power menu screenshot.](/.repoassets/screenshot_tofi_powermenu.png)
![Screen brightness and color temperature screenshot.](/.repoassets/screenshot_temperature_brightness.png)

# Setup.

I'll preface this by saying I'm using GTK apps (like the Nautilus file manager) and GTK portals here. I won't go over how to set all of that up. Refer to the [Hyprland wiki](https://wiki.hyprland.org/) if you need help with that.

Further, I suggest taking a look at the configs and some of the scripts I wrote and making sure they'll work for your particular setup. Chances are your monitor config in Hyprland won't exactly match mine, nor will your output devices in toggle-output.sh.

![Output change screenshot.](/.repoassets/screenshot_speaker.png)

## Packages.

`sudo pac -S zsh hyprland hyprpaper waybar dunst eza nautilus`

`yay -S hyprshot hyprpicker tofi-git wl-gammarelay-rs swaylock-effects-git ponymix`

## Fonts and icons.

My system font is the default One UI 6 font, which I ripped from my mom's Galaxy.

As for file icons, I'm using the [Colloid icon theme](https://github.com/vinceliuice/Colloid-icon-theme) and also its [cursors](https://github.com/vinceliuice/Colloid-icon-theme/tree/main/cursors).

I also use a lot of [Lucide](https://lucide.dev/) icons for this. The icon font appears a bit misaligned in Waybar for instance though.

If you're using [FontForge](https://fontforge.org/en-US/) like yours truly, you can fix that by selecting all the glyphs, going to Element > Transformations > Transform..., setting Y to -190 and hitting OK.

Or use a different icon set for that altogether, like [Remix Icons](https://remixicon.com/).

# Rounding things off.

10px.

## Firefox.

![Firefox screenshot.](/.repoassets/screenshot_firefox.png)

Here's my [Firefox Color "creation"](https://color.firefox.com/?theme=XQAAAALsAgAAAAAAAABBqYhm849SCicxcUMVgXcGHf3p79EhVPXpIZ1ibTLiQvLY1QylemTgx7hM1zvKvEf7PgmwvnHuxDkveHeHkLt3av2iYRA3oxMaYYcUKFAgO85u6uA5DQFwqDQFvI6EZsEKRt4YIIjdG6Asf76rWbrf6jo-3N5B_HslmOQO-cKRVs0OqOQ_tIIkb2EeIzMHImWLd-99TnG6CT72bDVZzUWkxx8253EU0xKh2o154Ih1MBlRZWRAZR16P33G1tRKsrFvo4yr2NLviDIO9Txwd-EpzIlb7avavGcNspQ05RzUzlG10TvK4DI26EXTCqoULZXxu64WNZSPlBrUjCsICaUKRY-6swk9VK2mqXBRtMOJ4lMvzrmMwWfI2m2hW9H8s59VUULxyrHO-HO7V8aLktnwJnkHDx9Fk9Bi0ABKPthvY2kjzHcQyuDs05iaC3e__KjJxw) and [where I got vertical tabs from](https://github.com/ranmaru22/firefox-vertical-tabs).

And here's something for a `chrome/userContent.css` in your profile folder if you wanna change the background color of shortcuts and search bar on the new tab screen:

```css
:root {
	--newtab-background-color: #111 !important;
	--newtab-background-color-secondary: #222 !important;
	--toggle-background-color-pressed: #0c6 !important;
	--newtab-primary-action-background: #0c6 !important;
}

@-moz-document url("about:newtab") {
	.top-site-outer:hover,
	.context-menu {
		background-color: #222 !important;
	}
	.toggle-button[aria-pressed="true"],
	.home-section .section .sponsored-checkbox:checked {
		background-color: #0c6 !important;
	}
	.top-site-outer .context-menu-button:is(:active, :focus) {
		fill: #0c6 !important;
	}
}
```

Very !important.

## tty.

[mkinitcpio-colors-git](https://github.com/evanpurkhiser/mkinitcpio-colors) (AUR)

I'm well aware this could be done without installing something and adding another hook, but I'm not smart enough for that. At least this allows me to use HEX codes.

Here's my `/etc/vconsole.conf`:

```
KEYMAP=us
XKBLAYOUT=us
COLOR_0=111111
COLOR_1=FF4444
COLOR_2=00CC66
COLOR_3=FFAA00
COLOR_4=4499EE
COLOR_5=8866DD
COLOR_6=44CCDD
COLOR_7=EEEEEE
COLOR_8=222222
COLOR_9=FF4444
COLOR_10=00CC66
COLOR_11=FFAA00
COLOR_12=4499EE
COLOR_13=8866DD
COLOR_14=44CCDD
COLOR_15=AAAAAA
```

## VS Code.

![VS Code screenshot.](/.repoassets/screenshot_code.png)

I created my theme on [vscode.one](https://themes.vscode.one/) and applied it locally [as explained here](https://themes.vscode.one/faq/local-install).

You could apply the syntax colors as well, but I prefer VS Code's default ones.

## GTK.

![GNOME Files screenshot.](/.repoassets/screenshot_nautilus.png)

GNOME and some GTK app developers [don't really want you to theme their apps](https://stopthemingmy.app/).

But [Gradience](https://github.com/GradienceTeam/Gradience) exists.

If you're using the AUR, install `gradience-git` or Nautilus might not be themed properly (at least as of writing this).

Import the `gradience.json` and have at it.

## Keyboard layout (if you happen to need it as well).

In KDE Plasma it was easy enough to add a QWERTY layout that allowed me to use AltGR to type some accented letters that are common in Europe.

Didn't find that elsewhere, so I went here: [altgr-weur us](https://altgr-weur.eu/linux.html)
