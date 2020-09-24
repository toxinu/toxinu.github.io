+++
aliases = ["2012/05/03/Ubuntu-Lts-Upgrades.html"]
date = "2012-05-03T00:00:00Z"
title = "Ubuntu Server LTS upgrades are stress test"
slug = "ubuntu-server-lts-upgrades-are-stress-test"
+++
### Update
* Sept, 24 2012

This article is now deprecated, Ubuntu now have a clean upgrade script.
Just use ``do-release-upgrade``.

<hr>
</br >

This week I had to upgrade some Ubuntu Server 10.04 to the new Canonical present.
And as much to upgrade my Debian scares me, then Ubuntu is a fabulous stress test...

I admit to not being an Ubuntu expert ( Debian too ) but the `do-release-upgrade` is like :

> "Ohhh yeah take this Ultra Decap'Net my son !"
>
> " .... But ..but what's dazzz sh... ?"
>
> "I don't know, shut up, press it and close your eyes"

But this is the recommended solution.

<script src="https://gist.github.com/toxinu/da11ce57a00ee9000d5119909d749c72.js"></script>

Your server is ready to upgrade.

`do-release-upgrade -d`

The **-d** option say that you want to do develpment upgrade, cause this isn't officially supported.

**/!\ Warning /!\\**

You have to re-upgrade grub after the upgrade.
So Say **NO** when upgrade script ask you to reboot.
Press x to destroy session and return into your initial terminal.

<script src="https://gist.github.com/toxinu/ac6cf3ef3667e667350cdbda2dc2bb1f.js"></script>

Where am I wrong with `grub-install` and `update-grub` ?
Ok ok, I haven't search more but packages must do it ? With os-prober, etc...

But, the job is done.

<hr>

If for X reason your __felt__ into a Grub Rescue hole this can help you:

<script src="https://gist.github.com/toxinu/fbf51d15aa335cb781e6d04a8911de85.js"></script>
