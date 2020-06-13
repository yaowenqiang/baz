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



