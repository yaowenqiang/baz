> bash --version
> apt search ^bash$

> bash --version
> echo $BASH_VERSION

> ctrl + x ctrl + v

> shopt
> shopt autocd
> shopt -s autocd; /etc -- configure
> shopt -s cdspell; cd /ect (misspelled directory)
> shopt restricted_shell
	restricted_shell off

> rbash

> shopt restricted_shell
	restricted_shell on

# Restricted Shell

A restricted shell prevents changing of the environment or event the current directory. The restricted_shell option is read-only and cannot be changed with the command shopt

## demo

> shopt autocd
> shopt -s autocd
> /etc
> ~

> shopt -s cdspell

> cd /ect 
> /etc

> shopt -u cdspell --unset

> shopt restricted_shell
> restricted_shell        off

> bash -r -- enter a restricted shell
> rbash

## using set

When configuration shell options using set we can use -o to enable the option and +x to disable the option.Some shell options can be set directly or with an explicit short option

> set -o noclobber

> set -C

REVERSE

> set +o noclobber( set +C)

## Disable File Globbing


If it is necessary, noe of the option allows for file name globbing or wildcards to be disabled. This could be possible required if it were common to have wildcard characters in the file names

> ls /etc/*.conf
> set -f
> ls /etc/*.conf
> set +f
> set -o

> ls /etc > file1
> set -o noclobber

> ls /etc > file1
> ls /etc > file1
> ls /etc > file1

> ls /etc > file1
 > cannot overwrite existing file

> ls /etc >| file1

> ls /etc/*.conf

> set -o | grep glob


