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

## Arithmetic Evaluation


The shell allows for simple, integer, arithmetic calculations using different commands or features


### Let 

The builtin command line can be used to populate variables with te result

> type let
> let a=3*5
> echo $a

### Using Expr

the Command expr can display the result directly at the shell, or using command substitution. populate a variable, Ensure that spaces are used between the values and operator

> expr 3 * 5
> if got f ,run set -f
> b = $(expr 3 * 5)


### Using Double Parenthesis

the advanced arithmetic parenthesis can run calculations that may make condition evaluations easier. In the example, we check that the current rate is below the daily rate

> echo $(( 3 * *5 ))


> daily_rate=3; rate=2
> (( rate < daily_rate )) && echo OK

## Arrays


Arrays are multivaluted variables and can be indexed (zero-based) or associative arrays. Associative arrays are not available in earlier versions of BASH


> declare -a user_name

> user_name[0]=bob;
> user_name[1]=smith;
> echo ${user_name[0]}

> unset user_name;
> declare -A user_name

> declare -A user_name  -- define a associative array
> user_name=([first]=bob [last]=smith)
> echo ${user_name[first]}

> declare -a user_name([0]=fred [1]=jack)
> declare -p user_name -- display the attributes and value of each NAME

## Redirection

Output fro mcommands are usually divided into STDOUT and STDERR .We can redirect each of these channels individually or both to the same file as in the example

> ls /etc/hosts > output.txt
> /etc/hosts (STDOUT)

> ls /etc/host  2> output.txt
> ls: cannot access '/etc/host': No such file or directory
> (STDERR)

> ls /etc/host  /etc/host &> output.txt

### Redirection Blocks and Subshells


Commands can be blocked together with single parenthesis.The combined output from the command block can be redirected as required. Equally, redirecting the output of BASH itself  will redirect everything from the shell


(ls /etc/hosts; ls /etc/hot) > file1

> bash > output


### Controlling Redirection Using Exec

Perhaps, more flexible is the exec command that can be used to create new file descriptors that connect to the builtin file descriptors. We use new file descriptors as they are easier to reset than the standard descriptors when redirection is no longer required.

> LOG=log.file
> exec 4>&1
> exec > "$LOG"
> ls
> exec 1>&4 4>&~
> ls /proc/$$/fd  -- $$ means current process id
> LOG=log.file
> exec 4>&1
> ls /proc/$$/fd  -- $$ means current process id

