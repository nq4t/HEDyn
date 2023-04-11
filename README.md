# HE Dynamic DNS Updater

This script will update A and AAAA records on Hurricane Electric's DNS
for hosts with DDNS enabled. It will pull your IPv4 from a source and
your IPv6 from the local machine.

It also includes two files, getv4.php and getv4.sh; which will allow
you to run your own IP check service for IPv4 on a pfSense box if it
also has the public v4 you want to use. If it's behind a bridge or
DMZ, you'll have to use an external service.

## Installation & Usage

If you are using the pfSense IP Check Service, copy both the .sh and
.php file in to /usr/local/www on pfSense. It will be available at:

- https://[LAN.IP]/getv4.php
- http://[LAN.IP]/getv4.php

depending on if you use https or not. Accessing this file does not
require logging in to the admin panel.

Copy hedyn.sh to your server using the hostname; make copies for
each hostname you want to update with your hostname, APIKey, the
device you want to use for IPv6, and which IPv4 check service you
want to use. Add it to cron. If using multiple, it's easiest to
add commands to all scripts in to another script called by cron.

The script will only update either v4 or v6 if the records don't
match the machine's IP addresses.

To use with just v4 or just v6; comment out the appropiate parts.

## Caution

This comes with no warranty. Any usage or modification to pfSense
is done at your own risk. 

## Changelog

```
10-APR-2023: Initial Version
11-APR-2023: Mirror to Github. Add 'ifconfig' command
```

## License

BSD 3-Clause License

Copyright (c) 2023, Jay Moore

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. 
