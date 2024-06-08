# decsh
Shell Script to decrypt SHC and SSC

> Due to Android user complaining about shebang because system hiearchy problem, I recommend you to run it via shell instead of treating it as an executable

```sh
Usage : sh ./deshc.sh <shc binary>
```
Example : `./deshc.sh ./shcfiles.sh`

Output : `shc_binary.dec.sh`

Multiple files are supported

# SECURITY 
This shell script still execute in the machine. I still configuring it by using `prlimit --pid <pid> --nofile=X` so it can only open the shared library.
Give time with `sleep 0.01` until it calls `execve` and then send `SIGSTOP` signal after that so atleast the shell script isn't running while being decrypted.

# How does it work?
## SHC
SHC works internally called `execve` to shell, it decrypted at runtimes and visible via command line args process

eg: `/bin/sh -c "decrypted shell"`
## SSC
SSC works almost same with SHC except the shell reads from file descriptor `3`.
It visible via `fd` number 3 on the process

Read my Indonesian writeup here https://medium.com/@kaw411gh0st/membongkar-program-shc-encrypted-shell-script-1d945b76080b
