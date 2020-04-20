#!/usr/bin/env bash
echo "### Please enter the table to work into ####"
read table


attr () {
  aws dynamodb describe-table --table-name $table | grep AttributeName | sort -u | awk 'BEGIN { FS = "\"" }{print $4}'
  }
attrlist=$(attr | wc -l)

#Here start the options of the script
echo "### Add item or scan something? (A/S) ###"
read to_do
clear
for (( i = 1; i <= $attrlist; i++ )); do
  Attr[$i]=$(attr | awk -v n="$i" 'BEGIN{RS = "" ; FS = "\n"}{print $n}')
done


#Add item starts here
if [[ $to_do == "A" ]] || [[ $to_do == "a" ]]; then
  coma=","
  echo -e "{ \n\n }" > file.json
  echo "### The attributes of the table $table are : ###"
  echo $(attr)
  for (( i = 1; i <= $attrlist; i++)); do
    echo "### Please enter the item for the attribute ${Attr[$i]} ###"
    read item[$i]
    num=$(($i + 1))
    if [[ $i -eq $attrlist ]]; then
      coma=""
    fi
    sed -i "${num}i\  "'"'${Attr[$i]}'"'": {"'"'S'"'": "'"'${item[$i]}'"'"}$coma" file.json
    #
  done
aws dynamodb put-item --table-name $table --item file://file.json
echo "#### Done ####"

#Query starts here
elif [[ $to_do == "S" ]] || [[ $to_do == "s" ]]; then
  echo "### The attributes of the table $table are : ###"
  echo $(attr)
  echo "### Which one do you wanna query for? (Enter full Attribute) ###"
  read query
  for (( i = 1; i <= $attrlist; i++ )); do
    #echo ${Attr[$i]}
    if [[ $query == ${Attr[$i]} ]]; then
      echo "### Enter the item to search in $query ###"
      read item
      clear
      aws dynamodb scan --table-name $table --filter-expression "$query = :a"  --expression-attribute-values '{":a": {"S": "'"$item"'"}}'
    fi
  done
fi
