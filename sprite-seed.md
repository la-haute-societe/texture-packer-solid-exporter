# Sprite seed

The sprite seed is a time and random based key to avoid cache stickiness.
It will just be added after the PNG path like so :

```
../path-to/my/png-file.png?0625855475153968789257801815002815737641125863795684864818416
```

So when you will update your app, the new CSS (with new textures coordinates) will target virtually another file on the server, which will disable the cache system for the first call. No drawback.

If your server has another type of cache system, you can still use the `-noSeed` version :)