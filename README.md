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

## Creating Heredocs

### HEREDOC

STDIN can be redirected from a file rather than the keyboard. Often this can be useful within scripts to create files from the scripts. The keyword END, in this case, can be any string that will not appear in the body text.

> cat > myfile <<END
> This is line 1
> this is line 2
> END


## Console Printing


The commands echo and printf can be used to print to the console.When doing so always quote variables to protect spaces and other special characters that may be misinterpreted.

Each command has a builtin and external version portability is increased using external commands at the cost of speed.

### Quote Variables

Quoting variables prevents possible spaces in the variables causing havoc in your data.

> username="jo smith"
> printf "The user is %s\n" $username
> The user is Jo
> The user is smith

> printf "The user is %s\n" "$username"
> The user is Jo smith

> type -a echo printf

### Builtin / External

Commands builtin to the shell use less resource and run more quickly. using the external commands aids portability as we are not dependent on the shell

## Process Substitution

Output from command groups can be redirected in the from of process substitution.Here we compare the sorted output or unique entries from two files . The option -3 excludes printing of the common lines in both files.

> comm -3 <(sort list1 | uniq) <(sort list2 | uniq)

# Debuggin scripts with bash -x

## Why the Shebang


If the default shell is bash and the script is written in bash then we don't have a problem!

Whilst the statement is true having the shebang not only allows us to debug the script, but it identifies the file type.


> cat > my.sh <<END
echo "This is a script"
END
> file my.sh

> sed -i '1 i/#!/bin/bash' my.sh; file my.sh -- and a new line via sed

## Debugging Shells


Adding the xtrace option to the current interactive shell allows you to see how variables are expanded as well as aliases.

> set -x ( or set -o xtrace)


> set -x
> ls $HOME
> + ls --color=auto /home/vagrant

### debug scripts

> bash -x my.sh

### debug shells

> set +x


## Using Type and Which 

Which vs Type


The type commands searches aliases, functions, builtin, and external commands in the PATH statement.

the which command only searches the PATH statement

> type -a pwd

> which -a pwd
> unalias aliasname

> ln -s /usr/share/doc .
> cd doc
> pwd
> /home/vagrant/baz/doc
> /usr/bin/pwd
> /usr/share/doc
> /usr/bin/pwd
> /usr/share/doc
> 

# Processing Command Line Options

## Script Variables

When passing arguments to scripts they populate variables. $0 represents the scriptsd itself. $# is the number of arguments. the complete arguments listed can be shown with $^ as single string for or stored in an array $@


## Working with Shift

### Shift

The builtin shift command is used to mvoe arguments along. Having processed $! we can move $2 to become $1 using the shift command. This is most useful in a loop allowing us to work only with $1 where the arguments list can be or any size

# Understanding Options

## getopts

The builtin command getopts allows for options to be passed to your script. We can create a script to create or delete users. the correct action coming fro te options -c to create and -d to delete.

## Using getopts


while getopts ':c:d:' opt
do
  case "$opt" in
    c) sudo useradd -m "$OPTARG"
      break;;
    d) sudo userdel -r "$OPTARG"
      break;;
    *) echo "Usage: $0 [-c|-d] <user> ";;
  esac
done  
      

> getopts cd -cd
> getopts c:d -c fred -d
> getopts c:d -c fred -d joe
> getopts :cd -h

Require OPtion Arguments

The colon following an option required an argument to be supplied to the option

A colon prepending the list of options allows the default error handling to be overwritten. Custom error handling is managed by the case else action.

End of options

It can be necessary to separate option arguments from script arguments. If we wanted the user to be processed as $1 and drop the requirement for the option argument we could make use of the -- in the script execution.

> getopts.h -c -- fred
> getopts.h -d -- fred
> getopts.sh

# Working with Strings


## Input Using Read

Teh read command can be used in scripts or from the command line to populate a variable. If the variable is not named the REPLY variable is used.

> read
> populate $REPLY
> read myvar
> populate $myvar

> read -s
> populate $REPLY but does not echo to the screen

> read -n1
> populate $REPLY but only accepts 1 character


## The String Length

Caculating the length of a string is possible when stored in a variable.Perhaps we require a minimum length of 8 characters for a username.We can test the length of the variable to see if it meets the requirements Using the -p option allows a prompt for the read input.

> read -p "Enter a user name: " username

> echo ${#username} - string length

> 
> read
> echo $REPLY

> read -p "type in a username: "
> 

> read -p "type in a username: " username
> echo $username

> read -n1 -p "Continue y or n:"
> read -n1 -p "Continue y or n:" -s  #--slient

> read -p "Enter a username or 8 or more characters " username
> echo ${#username}

### Provindg Default Values


Using the :- syntax the default value is displayed when the username value is null or the variable is unset.

Using the - syntax the default value is only displayed when the variable is unset and not when the value is null.

> read username
> echo ${username: -misconfigured}
> echo ${password: -nopassword}

> unset username

> declare -p username

### String Replacement


We can replace strings easily and directly from the she.shell. Here we look at the 0 in the IP address. A single / after the subject replaces only the first instance. using // replaces all instances


> echo $SSH_CLIENT
> echo ${SSH_CLIENT/0/9} -- replace one 
> echo ${SSH_CLIENT//0/9} -- replace all


> !u 

