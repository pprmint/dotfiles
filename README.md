# Dotfiles. <img align="right" height="40" src="/.repoassets/file-icon.svg">

> [!WARNING]
> I stopped using Hyprland as my daily driver in favor of KDE Plasma. These dotfiles are no longer maintained.

Configs and scripts for my (former) Hyprland setup, managed with [chezmoi](https://www.chezmoi.io/).

I use [Arch](https://archlinux.org/) btw.

![Screenshot of my desktop.](/.repoassets/Desktop.png)

## Blah.

I'll preface this by saying I (mostly) use GTK apps (like the Nautilus file manager) and GTK portals around here. I won't go over how to set all of that up. Refer to the [Hyprland wiki](https://wiki.hyprland.org/) if you need help.

Further, I suggest taking a look at the configs and scripts I wrote to make sure they'll work for your particular setup. Chances are things won't work for you right away.

## Packages.

`sudo pac -S zsh hyprland hyprpaper hyprlock hypridle waybar dunst eza nautilus`

`yay -S hyprshot hyprpicker tofi wl-gammarelay-rs ponymix`

## System font.

**[Onest](https://onest.md/)**

Not much else to say about this one, really.

### Monospace font.

**[Iosevka](https://github.com/be5invis/Iosevka)**

I was bored, so I used their [customizer](https://typeof.net/Iosevka/customizer) to make my own variant with cherry-picked characters.

![Overview of the Iosevka font with custom glyphs.](/.repoassets/Iosevka.svg)

If that's something that interests you, read more about that [here](https://github.com/be5invis/Iosevka/blob/main/doc/custom-build.md).

If you wish to copy my configuration, follow the instructions from the link above and use the contents of my `iosevka.toml` for the `private-build-plans.toml` file.

To build the regular, terminal and quasi-proportional variants in one go, run this:

`npm run build -- ttf::IosevkaMint && npm run build -- ttf::IosevkaMintTerm && npm run build -- ttf::IosevkaMintSans`

## Icon theme.

**[Colloid icon theme](https://github.com/vinceliuice/Colloid-icon-theme)**

The green dracula variant to be exact.

I also use the [cursors](https://github.com/vinceliuice/Colloid-icon-theme/tree/main/cursors), so you might as well install those while you're in there.

## UI icons.

**[Lucide](https://lucide.dev/)**

Those are the icons I use for my Waybar and Dunst notifications.

![Screenshot of my Waybar and a Dunst notification from changing my volume.](/.repoassets/Waybar+Notification.png)

Because the baseline of the icon font is a bit weird, I suggest using [FontForge](https://fontforge.org/en-US/) to change the position of the glyphs. Select all glyphs, then go to Element > Transformations > Transform..., set Y to -190 and hit OK.

Or use a different icon font altogether, like [Remix Icons](https://remixicon.com/).

## Borders++.

![Screenshot of two windows overlapping, with the top left corner of the top window zoomed into.](/.repoassets/BordersPlusPlus.png)

[How](https://wiki.hyprland.org/Plugins/Using-Plugins/) and [what](https://github.com/hyprwm/hyprland-plugins/tree/main/borders-plus-plus).

## Firefox.

![Screenshot of the Firefox new tab page.](/.repoassets/Firefox.png)

Here's my [Firefox Color "creation"](https://color.firefox.com/?theme=XQAAAALsAgAAAAAAAABBqYhm849SCicxcUMVgXcGHf3p79EhVPXpIZ1ibTLiQvLY1QylemTgx7hM1zvKvEf7PgmwvnHuxDkveHeHkLt3av2iYRA3oxMaYYcUKFAgO85u6uA5DQFwqDQFvI6EZsEKRt4YIIjdG6Asf76rWbrf6jo-3N5B_HslmOQO-cKRVs0OqOQ_tIIkb2EeIzMHImWLd-99TnG6CT72bDVZzUWkxx8253EU0xKh2o154Ih1MBlRZWRAZR16P33G1tRKsrFvo4yr2NLviDIO9Txwd-EpzIlb7avavGcNspQ05RzUzlG10TvK4DI26EXTCqoULZXxu64WNZSPlBrUjCsICaUKRY-6swk9VK2mqXBRtMOJ4lMvzrmMwWfI2m2hW9H8s59VUULxyrHO-HO7V8aLktnwJnkHDx9Fk9Bi0ABKPthvY2kjzHcQyuDs05iaC3e__KjJxw) and [where I got vertical tabs from](https://codeberg.org/ranmaru22/firefox-vertical-tabs).

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

**[mkinitcpio-colors-git](https://github.com/evanpurkhiser/mkinitcpio-colors) (AUR)**

I'm well aware this could be done without installing something and adding another hook, but I'm not smart enough for that. At least this allows me to use HEX codes.

Here's my `/etc/vconsole.conf`:

```
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

## VS Code / VS Codium.

![Screenshot of .](/.repoassets/Spaghetti.png)

I created my theme on [vscode.one](https://themes.vscode.one/) and applied it locally [as explained here](https://themes.vscode.one/faq/local-install).

My colors are defined in the `vscode.json` file.

You could apply the syntax colors as well, but I prefer the default ones.

## GTK.

![GNOME Files screenshot.](/.repoassets/Nautilus.png)

GNOME and some GTK app developers [don't really want you to theme their apps](https://stopthemingmy.app/).

But [Gradience](https://github.com/GradienceTeam/Gradience) exists.

If you're using the AUR, install `gradience-git` or Nautilus might not be themed properly (at least as of writing this).

Import the `gradience.json` and have at it.

## Keyboard layout (if you happen to need it as well).

In KDE Plasma it was easy enough to add a QWERTY layout that allowed me to use AltGR to type some accented letters that are common in Europe.

Didn't find that elsewhere, so I went here: [altgr-weur us](https://altgr-weur.eu/linux.html)
