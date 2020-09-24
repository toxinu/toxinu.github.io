+++
aliases = ["2011/10/28/Nagios-oracle-health-plugin.html"]
date = "2011-10-28T00:00:00Z"
title = "Nagios Oracle health plugin"
slug = "nagios-oracle-health-plugin"
+++
This is more a memo than an article. A quick and dirty [check_oracle_health][1] plugin installation, with prerequires.

Developped by [Gerhard Lausser][2], an active [Shinken][3] developper with [Jean Gabès][4].

Like most of Nagios plugins, it's in Perl language and it's use DBD::Oracle module, and this module need an Oracle client.

## Oracle Instant Client

You have to create a fucking Oracle account... Yes I know you think :

_"What's this great article ?! Proprietary software are just awesome!"_.

Go to [Oracle Instant Client Downloads Page][5]. Get the __Instant Client Package - Basic__ and __sdk__.
Or use my personnal [links][6] above.

For the story, i have fucked my brain during three hours cause I have download the __Instant Client Package - Basic Lite__ and try to work with a Western American charset database... And of course, Basic Lite does not support it.

Derp.

<script src="https://gist.github.com/toxinu/14cd7deab91986aea354ce327a00f5f2.js"></script>

## DBD::Oracle

Install pre-requires :

<script src="https://gist.github.com/toxinu/8afdb1776a64283a67e721e52b039102.js"></script>

Get module sources.

<script src="https://gist.github.com/toxinu/cc4a4648a7e909770c7cbd1f2b01a59b.js"></script>

DBD::Oracle module need path to Oracle Instant Client.

<script src="https://gist.github.com/toxinu/4a018f3d3a9c2ecb796d3fa71379c6ac.js"></script>

And compile it.

<script src="https://gist.github.com/toxinu/7a3590ad1b65d65fd71d74b832c62f4c.js"></script>

## Tnsnames.ora

This file contain informations about your different databases.

<script src="https://gist.github.com/toxinu/b619ed0c840861ba04c2fa3006701213.js"></script>

This is and example of _tnsnames.ora_ file :

<script src="https://gist.github.com/toxinu/2fa189c67bae5bae1343727b71843833.js"></script>

## check_oracle_health

To finish, we have to install the Nagios plugin.

<script src="https://gist.github.com/toxinu/9bad9f7c4e2baac91d0ab823c324d36f.js"></script>

That's all !

[1]: http://labs.consol.de/nagios/check_oracle_health
[2]: https://github.com/lausser
[3]: http://www.shinken-monitoring.org/
[4]: https://github.com/naparuba
[5]: http://www.oracle.com/technetwork/database/features/instant-client/index-097480.html
[6]: http://dl.socketubs.net/nagios/oracle/
