
  <p align="center">
  <a href="https://github.com/QuarTheDev/SpotX-GUI-Linux"><img src="https://github.com/QuarTheDev/SpotX-GUI-Linux/raw/main/.github/Pic/spotlogo.png" />
</p>

***

<center>
    <h4 align="center">A beautiful GUI fork for SpotX-Linux built using just bash and yad.</h4>
</center>
  <p align="center">
  <a href="https://github.com/QuarTheDev/SpotX-GUI-Linux"><img src="https://github.com/QuarTheDev/SpotX-GUI-Linux/raw/main/.github/Pic/preview1.png"/>
</p>

---

### ⚠️ WARNING ⚠️

SpotX-GUI is undergoing a [major rewrite](https://github.com/QuarTheDev/SpotX-GUI-Linux/tree/rewrite). Please support the official development of SpotX-Bash at [`jetfir3`](https://github.com/jetfir3/SpotX-Bash)'s page.
    
### Disclaimer:

This is an **unofficial** fork of SpotX-Linux. While there may be an official SpotX-GUI line in the future, for now this one is maintained by myself.

With that being said, this is just a **side project** that I made in just 2 days. There's bound to be errors and issues in every corner. This is a learning experience for me and end users should treat it as such.

If you encounter any issues on the **GUI** side of things, feel free to [create an issue on this page](https://github.com/QuarTheDev/SpotX-GUI-Linux/issues/new). If it's a problem related to the core functionality of SpotX, [create an issue on the official page](https://github.com/SpotX-CLI/SpotX-Linux/issues/new).

### Dependencies

- <a href="https://howtoinstall.co/en/yad" title="Tip: run 'sudo apt install yad' to install.">`yad`</a> (for GTK+ dialogs)
- <a href="https://howtoinstall.co/en/zip" title="Tip: run 'sudo apt install zip' to install.">`zip`</a> and <a href="https://howtoinstall.co/en/unzip" title="Tip: run 'sudo apt install unzip' to install.">`unzip`</a> (for extracting and packing XPUI)
- <a href="https://howtoinstall.co/en/perl" title="Tip: run 'sudo apt install perl' to install.">`perl`</a> for replacing patched files

### Features:

- Blocks all banner/video/audio ads within the app
- Blocks logging (Sentry, etc)
- Unlocks the skip function for any track
- Enables some experimental features (optional)

### Preparation
Ensure that your Spotify client is supported. Both SpotX and SpotX-GUI **do not** support the snap release at this time. Ensure that your Spotify client is fully closed before installation.

### ✨ **Installation** ✨

Open your terminal and enter the following command;
```
bash <(curl -sSL https://raw.githubusercontent.com/QuarTheDev/SpotX-GUI-Linux/main/install/init.sh)
```
A command line will pop up, indicating the preparation of the installer. In a few seconds, it should run.

### Options

This patcher comes preset with 4 toggle options which may be expanded in the future.
- Clear app cache -- use if UI-related patches aren't working.
- Experimental features -- enables experimental features.
- Force patch -- forces re-patching if a backup is detected.
- Premium subscription setup -- use if you have Spotify Premium.

### Uninstall:

A GUI uninstaller is still in the works. For now, use the suggested action for the CLI version:

- Close Spotify completely, then run the following command in your terminal:
```
bash <(curl -sSL https://raw.githubusercontent.com/SpotX-CLI/SpotX-Linux/main/uninstall.sh)
```

If you do not wish for another graphical installer, you can alternatively run the following in your terminal to uninstall SpotX:
```
sudo apt remove spotify-client && sudo apt install spotify-client
```

### DISCLAIMER

- Ad blocking is the main concern of this repo. Any other feature provided by SpotX-Linux, SpotX-GUI-Linux, or consequence of using those features will be the sole responsibility of the end user, not BlockTheSpot, SpotX, SpotX-CLI, SpotX-Linux, or SpotX-GUI-Linux.

### FAQ

> **Will there be a Windows and Mac release?**

I truly doubt it. If I were to make a Windows version, I'd want it to be UWP (because pretty Mica), but that would mean it's significantly more difficult than just making a couple generic vbs popups. As for Mac, I've never even touched an Apple PC before and that probably won't change.

> **Does this update automatically when [SpotX-Linux](https://github.com/SpotX-CLI/SpotX-Linux) does?**

No. every time there's an update to SpotX, I have to do more or less a full rewrite. Like I said, this is a side project and is only intended for experimentation with bash, GTK+ and `yad`.

> **I found a small error that won't affect the overall execution of SpotX-GUI. What do I do?**

I don't really update this anymore and may soon archive it anyway. I appreciate the efforts though.

> Did anyone really ask these questions?

Nope
### Credits

- Thanks to [amd64fox](https://github.com/amd64fox/spotx) for work on SpotX.
- Thanks to [jetfire](https://github.com/jetfir3) for work on SpotX.
- Thanks to [Ciraxy](https://discordapp.com/users/300894605992394755/) for the new logo.
- Thanks to [the SpotX Discord](https://discord.gg/gqNbVRe3).
