# WireGuard server with Pihole DNS on Docker 
![WireGuard](https://www.google.com/url?sa=i&url=https%3A%2F%2Fgithub.com%2FWireGuard&psig=AOvVaw3zs0cCTBmVE9Bo3Q2LNv2v&ust=1720669791197000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCJiB18_Im4cDFQAAAAAdAAAAABAE)
using macvlan to appear on the physical network.
---

Just execute the command `chmod +x *.sh && ./install.sh`

It will spin it up automatically in reagards to your network environment.
It will find your ip for the dockerhost, see what subnet it resides in.
The WireGuard container will have an ip of x.x.x.230 and can be adminsitered at http://x.x.x.230:51821
The Pihole container will have the ip x.x.x.231 and can be administered at http://x.x.x.231/admin

It will automatically set upu the routing.

Be sure to know your public hostname or ip, a password you would like to use for WG admin and Pihole admin.
