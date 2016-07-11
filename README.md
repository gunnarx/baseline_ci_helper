These scripts extract the revision information for dependent layers (poky
and meta-openembedded) from the README of meta-ivi so that automated builds
are possible.

Normally this project would be cloned into a directory that is in parallel
with meta-ivi but its location doesn't really matter.

Because to run it you should use the meta-ivi directory as working directory
and then run the script from there.  It will search for README.md there.

For example, if the directories are in parallel:

```
$ cd meta-ivi
$ ../baseline_ci_helper/get_layer_info_from_README.sh poky revision
```
That should return the commit hash specified for poky.

General usage:
```
$ get_layer_info_from_README.sh <layer> [branch|revision]
or
$ checkout_layer_hash.sh <layer>
```
where \<layer\> is typically poky, meta-openembedded, or similar
