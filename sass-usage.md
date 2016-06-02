
# SASS Usage

The script will create a scss file, with some vars and mixins.


### Sprite vars

This will be added to the global scope :

- `$sprite-%SPRITE-NAME%-width` in px
- `$sprite-%SPRITE-NAME%-height` in px
- `$sprite-%SPRITE-NAME%-scale`
- `$sprite-%SPRITE-NAME%-DPI`
- `$sprite-%SPRITE-NAME%-sub-path` (texture path from IDE)
- `$sprite-%SPRITE-NAME%-full-name` name of the PNG file
- `$sprite-%SPRITE-NAME%-URL` concatenated sub-path and full-name
- `$sprite-%SPRITE-NAME%-seed` see [sprite seed doc](https://github.com/la-haute-societe/texture-packer-solid-exporter/blob/master/sprite-seed.md)



### Sprite target with seed mixin

```
@include sprite-%SPRITE-NAME%-seed();
```

Use it to target your sprite image as a background-image with [sprite seed](https://github.com/la-haute-societe/texture-packer-solid-exporter/blob/master/sprite-seed.md)

Will declare :
```
background-repeat: no-repeat;
background-image: url(%SPRITE-URL%?%SPRITE-SEED%);
```



### Sprite target without seed mixin

```
@include sprite-%SPRITE-NAME%-noSeed();
```

Use it to target your sprite image as a background-image without [sprite seed](https://github.com/la-haute-societe/texture-packer-solid-exporter/blob/master/sprite-seed.md)

Will declare :
```
background-repeat: no-repeat;
background-image: url(%SPRITE-URL%);
```



### Texture vars

This will be added to the global scope :

- `$sprite-%SPRITE-NAME%-%TEXTURE-NAME%-width` in px
- `$sprite-%SPRITE-NAME%-%TEXTURE-NAME%-height` in px
- `$sprite-%SPRITE-NAME%-%TEXTURE-NAME%-x` in px
- `$sprite-%SPRITE-NAME%-%TEXTURE-NAME%-y` in px
- `$sprite-%SPRITE-NAME%-%TEXTURE-NAME%-center-x` in px
- `$sprite-%SPRITE-NAME%-%TEXTURE-NAME%-center-y` in px



### SASS Example usage

```
.MySpriteClass1
{
    // Target sprite image with anti-cache seed
    @include sprite-my-application-seed();

    // Target texture inside sprite with background-position
    // Will use default background size
    @include sprite-my-application-big-logo-white();
}

.MySpriteClass2
{
    // Target sprite image without anti-cache seed
    @include sprite-my-application-noSeed();

    // Target texture inside sprite with background-position
    // Will scale image with by dividing original size by 2 (.5 ratio = 1/2)
    @include sprite-my-application-big-logo-white-retina(.5);
}

.MySpriteClass3
{
    // Get sprite with
    width: $sprite-my-application-width / 2;

    // Get texture height
    height: $sprite-my-application-big-logo-white-textureHeight;
}
```


