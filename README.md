# Change Blindness Server

A simple example of zero-downtime deployments with Nginx and Docker.

## What's with the name?

The name comes from the psychological phenomenon of the same name. A great
demonstration by Darren Brown can be found [here][video].

## Pre-requisites

At the moment, provisioning is done with [Puppet][puppet] and tested with
[Vagrant][vagrant]. Once both of those are installed, you'll need to install
the [core `nginx` module][[puppet-nginx] with
`puppet module install jfryman-nginx`.

## Usage

To set-up the demonstration:

1. `vagrant up` - Start the VM.
1. `vagrant ssh` - Connect to the VM.
1. `sudo -i /bin/bash` - Switch to the `root` user.
1. `/vagrant/scripts/start.sh` - Run the included `start` script.

At this point, Docker should build the image (a "Hello, World" Node server) and
start a new instance. You can test this from the host machine with
`curl localhost:8080`, as this port has been forwarded from Vagrant.
Assuming all is well, you're ready to swap containers with no downtime.
Back in the Vagrant SSH terminal:

1. `/vagrant/scripts/swap.sh` - Run the included `swap` script.

For bonus points, run [`wrk`][wrk] with and without swapping containers. No
additional errors should result from the swap.

[video]: https://www.youtube.com/watch?v=vBPG_OBgTWg
[puppet]: https://forge.puppetlabs.com/
[vagrant]: http://www.vagrantup.com/
[puppet-nginx]: https://forge.puppetlabs.com/jfryman/nginx
[wrk]: https://github.com/wg/wrk

## What Now?

Take this example _and run with it._ This is intended as a demonstration of
the concepts, while in practice your set-up will differ wildly. For example,
the included scripts pay no mind to swapping multiple containers - only one
container is running at any given time. Another option not taken is running
Nginx inside of a container itself. That is left as an exercise for the reader.

```
The MIT License (MIT)

Copyright (c) 2014 Michael Schoonmaker

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
