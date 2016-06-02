# Advanced exporters for Texture Packer

Usefull advanced exports for [Texture Packer](https://www.codeandweb.com/texturepacker) spriting software. You will be able to create sprites files for [LESS](http://lesscss.org/) and [SASS](http://sass-lang.com/) pre-precessors. Also a **JSON** exporter is included to be able to access sprite positions in your **javascript** application.

The **key feature** of the exporter is the automatic ratio generator. You can mix **retina** and non-retina (or any density in fact) images in your sprite. The texture mixin have a **ratio** parameter to be able to compile your css with the right texture size.


### How to install

- Git clone this repo or download as zip.
- The recommanded destination folder is `~/Documents/texture-packer/`
- Be sure to have `less-exporter` / `sass-exporter` folders at first level here : `~/Documents/texture-packer/`
- Open Texture Packer
- Go to Preferences / Settings tab
- In the **Custom data exporter field** select the folder `~/Documents/texture-packer/`
- That's it !

More info on installation [here](https://www.codeandweb.com/texturepacker/documentation)


### Start a new project

- In the right bar / Settings / Framework
- Select **Solid Less Exporter** or **Solid Sass Exporter**
- Clic **convert**
- And last, clic on **Advanced settings** on the bottom right.
- Expand Data tab to see **Texture Path** field.

The data file is where the **SASS** or **LESS** file will be located.
A JSON file will always be also created to be able to target from your javascript application. If not needed, just ignore it.


### Texture path

The texture path field is to target the PNG file from the generated CSS file. No trailing slash.

For example if the structure is like this :
- assets
    - styles
        - my-app.css
    - img
        - my-app.png

The texture path parameter have to be `../img`


### Sprite configuration

In the right sidebar, expand the **Sprites** tab.

The prefered configuration is :
- trim mode to **none** to avoid bad trimming (do it in photoshop)
- extrude to **0**
- border padding to **2**
- shape padding to **2**
- common divisor to **8**

We add **padding** to **avoid bleeding** between textures when **resizing**. If 2 isn't enough, you can increment like 4 / 8 / 16 and so on.

The **common divisor** is to **avoid blurriness** when using **ratio**. The recommanded value is 8 so any texture will not be blured when rescaled. 8 is good to allow retina + centering. If you need to go more dense that retina (x2), you can increment like 16 / 32 / 64 and so on.



### LESS Usage


### SASS Usage