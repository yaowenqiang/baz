while getopts ':c:d:' opt
do
  case "$opt" in
    c) sudo useradd -m "$OPTARG"
      break ;;
    d) sudo userdel -r  "$OPTARG"
      break ;;
    *) echo "Usage: $0[-c|-d] <user>" ;;
  esac
done

