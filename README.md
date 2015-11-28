# My Personal Scripts

### Overview
This is just a collection of random scripts that I happen to write.  I am
mostly uploading them here so I can access them on all my systems.  Though, if
people actually find them useful that would be great to hear!  The scripts are
not very dynamic, as they are really designed to meet a particular need, but
most are simple enough that they shouldn't be hard to customize.

### Current Scripts

* **randword** - Generate a random set of words using the built in unix/linux
  dict file

* **macspoof** - Generate a random MAC address for a system running El Capitan
  (Probably more OSX versions as well)

* **hashgenerator** - This will do two things basic things:
  1. First it can act as a very simple implementation of a time based (short)
    hash generator.  Two people using a predetermined password should both be
    able to generate the same hash based on the date (UTC).
  2. Second it has a verification feature. Two people can use this two verify
    their identities. It requires both individuals two have PGP keys and two
    preshared (secure) passwords.  The hashgenerator will read an encrypted
    file with two passwords (each on its own line) and use keys stored in
    gpg to decrypt the file and generate a secure hash that will update every
    minute.
  You can output the options by running "hashgenerator -h"
