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

The texture path field is to target the PNG file from the generated CSS file. **WITH** trailing slash.

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

The script will create a less file, with some mixins.


###### Sprite vars mixin

```
.sprite-%SPRITE-NAME%-vars();
```

Use it to add following vars to your current scope :

- `@spriteHeight` in px
- `@spriteWidth` in px
- `@spriteScale`
- `@spriteDPI`
- `@spriteSubPath` (texture path from IDE)
- `@spriteFullName` name of the PNG file
- `@spriteURL` concatenated subPath and fullName
- `@spriteSeed` see [sprite seed doc](https://github.com/la-haute-societe/texture-packer-solid-exporter#sprite-seed)


###### Sprite target with seed mixin

```
.sprite-%SPRITE-NAME%-seed();
```

Use it to target your sprite image as a background-image.

Will declare :
```
background-repeat: no-repeat;
background-image: url(%SPRITE-URL%);
```


###### Texture vars mixin

```
.sprite-%SPRITE-NAME%-%TEXTURE-NAME%-vars();
```

Use it to add following vars to your current scope :

- `@textureWidth` in px
- `@textureHeight` in px
- `@textureX` in px
- `@textureY` in px
- `@textureCenterX` in px
- `@textureCenterY` in px




###### LESS Example usage

```
.MySpriteClass1
{
    // Target sprite image with anti-cache seed
    .sprite-my-application-seed();

    // Target texture inside sprite with background-position
    // Will use default background size
    .sprite-my-application-big-logo-white();
}

.MySpriteClass2
{
    // Target sprite image without anti-cache seed
    .sprite-my-application-noSeed();

    // Target texture inside sprite with background-position
    // Will scale image with by dividing original size by 2 (.5 ratio = 1/2)
    .sprite-my-application-big-logo-white-retina(.5);
}

.MySpriteClass3
{
    // Inject sprite vars into this scope
    .sprite-my-application-vars();

    // Now we can use sprite vars
    width: @spriteHeight / 2;

    // Inject texture vats into this scope
    .sprite-my-application-big-logo-white-vars();

    // Now we can use texture vars
    height: @textureHeight;
}
```



### SASS Usage


### Sprite seed

The sprite seed is a time and random based key to avoid cache stickiness.