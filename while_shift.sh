while (( "$#"))
do
  echo "$1"
  printf " \$# is : %s\n" "$#"
  shift
done
