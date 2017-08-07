+++
aliases = ["2012/12/10/First-thing-to-do-after-ubuntu-fresh-install.html"]
date = "2012-12-10T00:00:00Z"
title = "First thing to do after Ubuntu fresh install"

+++
It's time to return to sources, Linux, good buy Apple.
But this is the first thing to do on every new Ubuntu installation.

{{< highlight bash >}}
sudo apt-get remove unity-lens-shopping
sudo apt-get remove unity-scope-video-remote
sudo apt-get remove unity-scope-musicstores

sudo su -
echo 'OFFERS_URI="https://localhost:0/"' >> /etc/environment
{{< /highlight >}}

'Cause of [__spyware__][1], you know...

[1]: http://www.fsf.org/blogs/rms/ubuntu-spyware-what-to-do
