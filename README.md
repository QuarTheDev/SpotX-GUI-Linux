
  <p align="center">
  <a href="https://github.com/DabiaTheNord/SpotX-GUI-Linux"><img src="https://github.com/DabiaTheNord/SpotX-GUI-Linux/raw/main/.github/Pic/spotlogo.png" />
</p>

***

<center>
    <h4 align="center">A beautiful GUI fork for SpotX-Linux built using just bash and yad.</h4>
</center>
  <p align="center">
  <a href="https://github.com/DabiaTheNord/SpotX-GUI-Linux"><img src="https://github.com/DabiaTheNord/SpotX-GUI-Linux/raw/main/.github/Pic/preview1.png"/>
</p>

---

### Disclaimer:

This is an **unofficial** fork of SpotX-Linux. While in the future there may be an official SpotX-GUI line in the future, for now this one is maintained by me.

It is not completed yet and likely won't be for a few hours. This repo will update when it is.

With that being said, this is a **side project** that I made in just 2 days. There's bound to be errors and issues in every corner. This is a learning experience for me and end users should treat it as such.

If you encounter any issues on the **GUI** side of things, feel free to [create an issue on this page](https://github.com/DabiaTheNord/SpotX-GUI-Linux/issues/new). If it's a problem related to the core functionality of SpotX, [create an issue on the official page](https://github.com/SpotX-CLI/SpotX-Linux/issues/new).

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
placeholder install
```
You will likely be asked for sudo privileges to write to the `/tmp/` folder. This downloads the files needed for installation (images, license, and the script itself). 

If you do not have a `/tmp/` folder, it is advised you create one before running the script.

### Options

The installer comes preset with 4 togglable options - which will be expanded in the future.
- Clear app cache -- use if UI-related patches aren't working.
- Experimental features -- enables experimental features.
- Force patch -- forces re-patching if a backup is detected.
- Premium subscription setup -- use if you have Spotify Premium.

### Uninstall:

- Close Spotify completely, then run the following command in your terminal:
```
placeholder-uninstall
```
You will once again be asked for temporary writing to the `/tmp/` folder.

If you do not wish for another graphical installer, you can run the following in your terminal:
```
sudo apt remove spotify-client && sudo apt install spotify-client
```

### DISCLAIMER

- Ad blocking is the main concern of this repo. Any other feature provided by SpotX-Linux, SpotX-GUI-Linux, or consequence of using those features will be the sole responsibility of the end user, not BlockTheSpot, SpotX, SpotX-CLI, SpotX-Linux, or SpotX-GUI-Linux.

### Credits

- Thanks to [amd64fox](https://github.com/amd64fox/spotx) for work on SpotX.
- Thanks to [jetfire](https://github.com/jetfir3) for work on SpotX.
- Thanks to [placeholder](https://github.com/amd64fox/spotx) for work on SpotX.
