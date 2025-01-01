#!/usr/bin/bash

# Put this script somewhere between your binaries, e.g. /usr/local/bin/hetz-cli

url='http://0.0.0.0:7000'

action="$1"
input="$2"

case "$1" in
    'create')
        [[ -z $input ]] && break
        echo -e "\e[31m__Initializing...\e[0m"
        curl -X POST -H "Content-Type: application/json" -d "{\"name\":\"$input\"}" "$url/create"; echo ''
        echo -e "\e[31mDONE!!\e[0m"
        ;;
    'read')
        [[ -z $input ]] && break
        echo -e "\e[31m__Initializing...\e[0m"
        curl -X POST -H "Content-Type: application/json" -d "{\"name\":\"$input\"}" "$url/read"; echo ''
        echo -e "\e[31mDONE!!\e[0m"
        ;;
    'update')
        IFS=','
        arr=($input)
        [[ -z $arr[0] || -z $arr[1] ]] && break
        old_name=${arr[0]}
        new_name=${arr[1]}
        echo -e "\e[31m__Initializing...\e[0m"
        curl -X POST -H "Content-Type: application/json" -d "{\"old_name\":\""$old_name"\",\"new_name\":\""$new_name"\"}" "$url/update"; echo ''
        echo -e "\e[31mDONE!!\e[0m"
        ;;
    'delete')
        [[ -z "$input" ]] && break
        echo -e "\e[31m__Initializing...\e[0m"
        curl -X POST -H "Content-Type: application/json" -d "{\"name\":\"$input\"}" "$url/delete"; echo ''
        echo -e "\e[31mDONE!!\e[0m"
        ;;
    *)
        echo 'invalid option'
        ;;
esac