These scripts extract the revision information for dependent layers (poky
and meta-openembedded) from the README of meta-ivi so that automated builds
are possible.

Normally this project would be cloned into a directory that is in parallel
with meta-ivi but its location doesn't really matter.

Because to run it you should use the meta-ivi directory as working directory
and then run the script from there.  It will search for README.md from
meta-ivi in the current working directory.

For example, if the directories are in parallel:

```
$ cd meta-ivi
$ ../baseline_ci_helper/get_layer_info_from_README.sh poky revision
```

This should return the commit hash specified for poky.

