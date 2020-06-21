while getopts 'cd' opt
do
  while (( "$#" )) ; do
    if ! [[ $! =~ ^- ]]; then
      username="$1"
    fi
    shift
  done

  case "$opt" in
    c) sudo useradd -m "$username"
      break ;;
    d) sudo userdel -r  "$username"
      break ;;
    *) echo "Usage: $0[-c|-d] <user>" ;;
  esac
done

