# WireGuard server with Pihole DNS on Docker 
<img src="https://github.com/coc0nut/WireGuard-and-Pihole-on-Docker/assets/9300178/2aa47e18-eb79-450f-9f3e-5b57572bf911" alt="PiHole" width="700" height="150"/>

<img src="https://github.com/coc0nut/WireGuard-and-Pihole-on-Docker/assets/9300178/69e83f44-d7be-4feb-b88c-5b9237126d2c" alt="WireGuard" width="300" height="300"/>



using macvlan to appear on the physical network.
---

Just execute the command `chmod +x *.sh && ./install.sh`

It will spin it up automatically in reagards to your network environment.
It will find your ip for the dockerhost, see what subnet it resides in.
The WireGuard container will have an ip of x.x.x.230 and can be adminsitered at http://x.x.x.230:51821
The Pihole container will have the ip x.x.x.231 and can be administered at http://x.x.x.231/admin

It will automatically set upu the routing.

Be sure to know your public hostname or ip, a password you would like to use for WG admin and Pihole admin.
