# Overview

This is a very basic attempt to have a cloudformation template that launches workadventure. 
Currently it has a first attempt at a userdata script, and a cloudformation template that launches an EC2 instance running workadventure user docker-compose.
It doesn't yet handle setting up the domain mappings with e.g. Route 53, or any SSL certificates.

# Some tips for getting Work Adventure running

TLDR: use the website-demo branch from my fork: 

    git clone -b website-demo https://github.com/alokito/workadventure.git

## A note on http

if you want to use http, e.g.

    http://play.workadventure.localhost/_/qqo-isz-ksl/npeguin.github.io/skapa-map/map.json

the xhr load for the standard maps will fail because it will try to load http://npeguin.github.io/skapa-map/map.json which will return a 301 redirect. However, XHRs will not automatically follow 301 redirects, and instead the map will fail to load. This is addressed by a hack in my fork:

https://github.com/alokito/workadventure/commit/a42ea40a77d87225b81bb3cd2917f10175dec0ae

## A note on https

If you use https, the certificates will not be properly signed. You can ignore this for the top level domain, however there are many requests to subdomains that will fail. The only solution would be to configure the traefik controller to use a proper certificate. I haven't figured out how to do this yet. For now I will try terminating SSL at a load balancer.