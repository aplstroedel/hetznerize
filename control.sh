#!/usr/bin/bash

command=("$@")
arr=("${command[@]}")

[[ $(echo "${arr[@]:0}" | grep -o '\-\-prompt') ]] && interactive=true || interactive=false

args=( "${arr[@]/\-\-prompt/}" )

cli() {
    arg="$1"
    arg=$(echo "$arg" | xargs)
    echo -e "\e[31m__Initializing__\e[0m"
    case "$1" in
        'create')
            [[ -z $2 ]] && return
            command='curl -s -X POST -H "Content-Type: application/json" -d "{\"name\":\"'$2'\"}" "'$url'/create"; echo '''
            ;;
        'read')
            [[ -z $2 ]] && return
            command='curl -s -X POST -H "Content-Type: application/json" -d "{\"name\":\"'$2'\"}" "'$url'/read"; echo '''
            ;;
        'readall')
            command='curl -s -X POST -H "Content-Type: application/json" -d "{\"name\":\"'$2'\"}" "'$url'/read"; echo '''
            ;;
        'update')
            IFS=','
            arr=($2)
            [[ -z $arr[0] || -z $arr[1] ]] && return
            old_name=${arr[0]}
            new_name=${arr[1]}
            command='curl -s -X POST -H "Content-Type: application/json" -d "{\"old_name\":\""'$old_name'"\",\"new_name\":\""'$new_name'"\"}" "'$url'/update"; echo '''
            ;;
        'delete')
            [[ -z $2 ]] && return
            command='curl -s -X POST -H "Content-Type: application/json" -d "{\"name\":\"'$2'\"}" "'$url'/delete"; echo '''
            ;;
        *)
            echo 'invalid option'
            ;;
    esac
    executed=$(eval "$command")
    echo "$executed"
    [[ $(echo "$executed" | jq -r .action.status) == "running" ]] && echo -e "\e[31mSUCCESS!!\e[0m" || echo -e '\e[31mFAILED!!\e[0m'
}

main() {
    url='http://0.0.0.0:7000'

    if [[ "$interactive" == true ]]
    then
        while true
        do
            echo ''
            echo 'What do you want to do:'
            echo 'create, read, update, delete - a server'
            read action
            echo ''
            echo 'What is the name of the server you want to manage'
            echo 'Note: updating takes 2 names comma separated, also do not use spaces, example: old_server_name,new_server_name'
            read 'server'
            echo ''
            cli "$action" "$server"
        done
    else
        action=${args[0]}
        server=${args[1]}
        cli "$action" "$server"
    fi
}

main
