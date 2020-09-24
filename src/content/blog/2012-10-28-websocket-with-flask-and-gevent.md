+++
aliases = ["2012/10/28/Websocket_with_flask_and_gevent.html"]
date = "2012-10-28T00:00:00Z"
title = "Websocket with Flask and Gevent"
slug = "websocket-with-flask-and-gevent"
+++
## Ubik, package manager for Unix

If you follow me on [Github][7] you have maybe already seen that I currently develop a package manager for Unix, [Ubik][1].

In order to test my API, I create a _WebUI_ for _Ubik_ and the websockets comes to me.
My two prefered web framework are __Django__ and __Flask__, but I need a _lightweight_ web app, so welcome to Flask.

## Node.js, blah, blah

Ok, I have many many times hear good things about __Node.js__ and __[Socket.io][4]__, no doubt.
But my focus is to do a lightweight and __full Python__ implemented application.

So, tools are:

* [flask][2]
* [gevent][3]
* [gevent-websocket][4]

By the way, [gevent-socketio][6] seems to be a solid __socket.io__ Python implementation.

## App presentation

This is my Flask app structure:

<script src="https://gist.github.com/toxinu/8be85a458570fbbc16b1a7ac5d673e38.js"></script>

### requirements.txt

<script src="https://gist.github.com/toxinu/d724c7ae35f050ff6646f4b884021627.js"></script>

### \_\_init\_\_.py

This is the _app core_, create your app, import every shared object you want to use into your app, like databases, etc.

And don't forget to import views at the end to avoid circular imports.

<script src="https://gist.github.com/toxinu/0ce950084c8eff3498c8183e22903166.js"></script>

### websocket.py

All your websocket stuff could be here, this is the _websocket handler_.
Messages from browser arrived here, and you can easily send message throught websocket with ``send`` method from ``ws`` object.

Use ``json``, please.

<script src="https://gist.github.com/toxinu/0f564024eb4bca43172ff2636d37094b.js"></script>

### views.py

Simple ``flask`` view to ``index.html`` template.

<script src="https://gist.github.com/toxinu/36512a82d1f5cc4c65bc9f1c656a4cec.js"></script>

### runserver.py

Run your app with this script. It import your app and feed ``WSGIServer`` with it.

<script src="https://gist.github.com/toxinu/cc3282171485950cf87d9e0e5e2bc338.js"></script>

### index.html

And a quick _Javascript_ websocket example.

<script src="https://gist.github.com/toxinu/48203b61ca9772e53a445aa272604457.js"></script>

All can find all this stuff in this [repository][8].
Thanks to [tzangms][9].

## What now?

Play websockets with Flask and Python is fun !

I will continue to improve [__Ubik__][1] _webui_ with _websocket_ and you have to take a look at the _0.2_ branch.
Bunch of new features is coming !

[1]: https://gitlab.com/toxinu/ubik
[2]: http://flask.pocoo.org/
[3]: http://www.gevent.org/
[4]: http://www.gelens.org/code/gevent-websocket/
[5]: http://socket.io/
[6]: https://github.com/abourget/gevent-socketio
[7]: https://github.com/Socketubs
[8]: https://github.com/tzangms/python-websocket-example
[9]: https://github.com/tzangms
