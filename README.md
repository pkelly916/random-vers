# Random Version for Irssi

Very basic script to intercept CTCP version requests and respond with a random version from versions.txt. 

## Installation
Copy "randomversion.pl" to $irssidir/scripts, making the directory if it does not exist.
Copy "versions.txt" to the root $irssidir. This is the same directory where the config file is usually found. 

To run on startup, copy the file to $irssidir/scripts/autorun, again making the directory if it does not exist.

Version strings can be anything and you can add as many as you want to the versions.txt.

## Test
To see the versions change, you can CTCP yourself:

```
/ctcp <nick> version
```

Most effective when done multiple times.
