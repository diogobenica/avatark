# Avatark

Automatic avatar search in social networks and web.
Avatark is a public API for open use. It searchs for an especific avatar in most famous social networks and returns the image link for you.

You give us a nickname, and Avatark returns to you an avatar!

## Usage

### Content-Type
For now, the only `content-type` accepted is `application/json`, so make sure that your request have this header.

### Auto"magic"
By default, Avatark search an avatar for your user in many social networks (ok, it's just Facebook and Twitter for now). The fallback works this way:

```
    Exists in Facebook? --(no)--> Exists in Twitter? --(no)--> Returns an default avatar
```

Just make a request in this URL:
`GET http://avatark.me/:username` where `:username` is what you're searching for.

### Facebook
If you want only Facebook avatars, just add `/facebook` before the `:username`:
`GET http://avatark.me/facebook/:username`

### Twitter
If you want only Twitter avatars, just add `/twitter` before the `:username`:
`GET http://avatark.me/twitter/:username`