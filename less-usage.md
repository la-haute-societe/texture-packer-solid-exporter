# LESS Usage

The script will create a less file, with some mixins.


### Sprite vars mixin

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
- `@spriteSeed` see [sprite seed doc](https://github.com/la-haute-societe/texture-packer-solid-exporter/blob/master/sprite-seed.md)



### Sprite target with seed mixin

```
.sprite-%SPRITE-NAME%-seed();
```

Use it to target your sprite image as a background-image with [sprite seed](https://github.com/la-haute-societe/texture-packer-solid-exporter/blob/master/sprite-seed.md)

Will declare :
```
background-repeat: no-repeat;
background-image: url(%SPRITE-URL%?%SPRITE-SEED%);
```



### Sprite target without seed mixin

```
.sprite-%SPRITE-NAME%-noSeed();
```

Use it to target your sprite image as a background-image without [sprite seed](https://github.com/la-haute-societe/texture-packer-solid-exporter/blob/master/sprite-seed.md)

Will declare :
```
background-repeat: no-repeat;
background-image: url(%SPRITE-URL%?%SPRITE-SEED%);
```



### Texture vars mixin

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



### LESS Example usage

From LESS

```
.MySpriteClass1
{
    // Target sprite image with anti-cache seed
    .sprite-my-application-seed();

    // Target texture inside sprite with background-position
    // Will use default background size
    .sprite-my-application-big-logo-white-scale();
}

.MySpriteClass2
{
    // Target sprite image without anti-cache seed
    .sprite-my-application-noSeed();

    // Target texture inside sprite with background-position
    // Will scale image with by dividing original size by 2 (.5 ratio = 1/2)
    .sprite-my-application-big-logo-white-retina-scale(.5);
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

From DOM

```
<div class="sprite-my-application-seed sprite-my-application-big-logo-white-retina"></div>
```