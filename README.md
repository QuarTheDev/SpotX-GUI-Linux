<p align="center">
	<a href="https://github.com/QuarTheDev/SpotX-GUI-Linux">
	<img src="https://github.com/QuarTheDev/SpotX-GUI-Linux/raw/main/.github/Pic/spotlogo.png">
</p>

***

<center>
    <h4 align="center">A beautiful GUI installer for SpotX-Bash, inspired by Windows.</h4>
</center>
  <p align="center">
  <a href="https://github.com/QuarTheDev/SpotX-GUI-Linux"><img src="https://github.com/QuarTheDev/SpotX-GUI-Linux/raw/main/.github/Pic/preview1.png"/>
</p>

---
### ⚠️ WARNING ⚠️

SpotX-GUI is undergoing a major rewrite. Please support the official development of SpotX-Bash at [`jetfir3`](https://github.com/jetfir3/SpotX-Bash)'s page.


### Disclaimer:

This is an **unofficial** fork of SpotX-Bash. Any issue on the graphical side of things should be submitted here, while any core functionality issues should be submitted on the [official page](https://github.com/jetfir3/SpotX-Bash).

### Dependencies

- <a href="https://howtoinstall.co/en/yad" title="Tip: run 'sudo apt install yad' to install.">`yad`</a> (for GTK+ dialogs)
- <a href="https://howtoinstall.co/en/zip" title="Tip: run 'sudo apt install zip' to install.">`zip`</a> and <a href="https://howtoinstall.co/en/unzip" title="Tip: run 'sudo apt install unzip' to install.">`unzip`</a> (for extracting and packing XPUI)
- <a href="https://howtoinstall.co/en/perl" title="Tip: run 'sudo apt install perl' to install.">`perl`</a> for replacing patched files

### Options

- Clear cache
- Force SpotX installation
- Assign a manual path
- Multiple togglable options:
  - Experimental left sidebar
  - 'Made for You'
  - Experimental right sidebar
  - Colors in experimental sidebar
  - Lyrics in experimental sidebar
  - Old home screen UI
  - Non-music categories
  - Experimental features

### Preparation
Ensure that your Spotify client is supported. Both SpotX-GUI and SpotX-Bash **do not** support the snap release at this time. Ensure that your Spotify client is fully closed before installation.

### ✨ **Installation** ✨

Open your terminal and enter the following command;
```
bash <(curl -sSL https://raw.githubusercontent.com/QuarTheDev/SpotX-GUI-Linux/main/install/init.sh)
```
A command line will pop up, indicating the preparation of the installer. It will take a moment to initialize and open the GUI.

### Uninstall:

A graphical uninstaller is still in the works. For now, use the suggested action for the standard version:

- Close Spotify completely, then run the following command in your terminal:
```
bash <(curl -sSL https://gist.github.com/jetfir3/e8830cf8deba6a4f15eec094d344f7b1/raw/spotx.sh) -U
```
<!--
Placeholder for future graphical uninstaller:

If you do not wish for another graphical installer, you can alternatively run the following in your terminal to uninstall SpotX:
```
bash <(curl -sSL https://raw.githubusercontent.com/QuarTheDev/SpotX-GUI-Linux/main/uninstall/init.sh)
```
-->

### FAQ

**Will there be a Windows and Mac release?**
> I doubt it. If I were to make a Windows version, I'd want it to be a full UWP program, since I don't believe a couple of Visual Basic popups would suffice. As for Mac, I've never even touched an Apple computer before and that won't ever change. (Thanks Stallman)

**Does this update automatically when [SpotX-Bash](https://github.com/jetfir3/SpotX-Bash) does?**
> For the most part, **yes**. The core functionality remains the same with every update. However, I have to manually add ticker options for each new argument.

**I found a small error that won't affect the overall execution of SpotX-GUI. What do I do?**
> If it involves an issue regarding core functionality (i.e. getting an error popup), make an issue on the [SpotX-Bash](https://github.com/jetfir3/SpotX-Bash/issues/new/choose) page. However, if it's a graphical issue (i.e. icons not properly displaying), make an issue [here](https://github.com/QuarTheDev/SpotX-GUI-Linux/issues/new/choose).

**What happened to SpotX-CLI?**
> SpotX-CLI is **an unofficial, outdated fake** of SpotX and is not owned by amd64fox, jetfir3, or myself.  There is not a Discord community for SpotX or BlockTheSpot at this time. The only official community for SpotX can be found on [Telegram](https://t.me/SpotxCommunity).

### Credits

- Thanks to [amd64fox](https://github.com/amd64fox/spotx) for work on SpotX.
- Thanks to [jetfir3](https://github.com/jetfir3) for work on SpotX-Bash.
- Thanks to [Ciraxy](https://discordapp.com/users/300894605992394755/) for the logo variant.
- Thanks to [the SpotX Community](https://t.me/SpotxCommunity).
