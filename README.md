# deshc
Shell Script to decrypt SHC
```sh
Usage : ./deshc.sh <shc binary>
```
Example : `./deshc.sh ./shcfiles.sh`

Output : `shc_binary.dec.sh`

Multiple files are supported

# SECURITY 
This shell script still execute in the machine. I still configuring it by using `prlimit --pid <pid> --nofile=X` so it can only open the shared library.
Give time with `sleep 0.01` and the send `SIGSTOP` signal after that so atleast the shell script isn't running while being decrypted.

# How does it work?
SHC works internally called `execve` to shell, it decrypted at runtimes and visible via command line args process

eg: `/bin/sh -c "decrypted shell"`

Read my Indonesian writeup here https://medium.com/@kaw411gh0st/membongkar-program-shc-encrypted-shell-script-1d945b76080b
