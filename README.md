piratepack-overlay-testing
==========================

The testing version of the piratepack Gentoo overlay

The public key used for signing is available here: https://piratelinux.org/public.key.

You can use this by adding the line
```
	https://piratelinux.org/repo/piratepack-testing.xml
```
(tab at the start) to `/etc/layman/layman.cfg`, after your list of XML files for remote overlays, which is normally
```
overlays  : http://www.gentoo.org/proj/en/overlays/repositories.xml
```
Then fetch the list of overlays with
```
layman -L
```
Add the overlay with
```
layman -a piratepack-testing
```
Sync the overlays with
```
layman -S
```
Then verfify the PGP signatures in the `Manifest` files in `/var/lib/layman/piratepack-testing`.
