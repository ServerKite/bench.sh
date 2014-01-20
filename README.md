bench.sh
========

![ServerKite](http://i.imgur.com/HSMqAKD.png "ServerKite")

A stupidly-simple, aeronautic benchmarking script that handles speed test from 30+ datacenters or 20+ vps providers across the World. — No, it does not halt there. This script will be able to do more then that! — I/O (Input / Output), ping, traceroute tests.


### Structure Requirements
You should run this script as "root" access user and should install the mentioned applications below, before executing the bash file. 

The applications are as follows:

- Git (git/git-core)
- ~~IOPing~~
- ~~GNU wget tool~~
- ~~Python~~


### Pimp-my-Kite

The main script (bench.sh) by default, comes with 100MB speed test files/links. — We have gathered a list of [10MB](https://github.com/ServerKite/bench.sh/wiki/10MB-Speed-Tests) and [1GB](https://github.com/ServerKite/bench.sh/wiki/1GB-Speed-Tests) speed test files/links where you can add on to the script. Where to add it? We assume you're clever enough to figure that one out ;)

Hint: after line 40, before line 204.


### Theory & Practice

Before pushing a new version or fixing some bits of codes, we usually take the script for a test drive. We utilized various virtualizations and linux distributions.

Here are some of the VPS providers along with the virtualization and OS flavor that we run our tests with:

- RamNode (Atlanta, Georgia) OpenVZ SSD VPS with Debian 32-bit
- prgmr (San Jose, California) Xen VPS with CentOS 32-bit
- TortoiseLabs (Atlanta, Georgia) Xen VPS with CentOS 64-bit

### Colourful Suggestions & Ideas
Would love to hear possible ways of improving the codes, structure and aerodynamics. 

### Paper Transparency
ServerKite's bench.sh is a simple script based on Argiris Kamaras's linux server info script. 
