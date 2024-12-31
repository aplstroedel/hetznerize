#!/usr/bin/bash

# Put this script somewhere between your binaries, e.g. /usr/local/bin/hetz-prompt

url='http://localhost:7000'

while true
do
    echo ''
    echo 'What do you want to do:'
    echo 'create, read, update, delete - a server'
    read action
    echo ''
    
    case "$action" in
        'create')
            echo 'What is the name you want to give the server?'
            read create_server
            echo ''
            [[ -z $create_server ]] && break
            echo -e "\e[31m__Initializing...\e[0m"
            curl -X POST -H "Content-Type: application/json" -d "{\"name\":\"$create_server\"}" "$url/create"; echo ''
            echo -e "\e[31mDONE!!\e[0m"
            ;;
        'read')
            echo 'What is the name of the server you are looking for?'
            read find_server
            echo ''
            [[ -z $find_server ]] && break
            echo -e "\e[31m__Initializing...\e[0m"
            curl -X POST -H "Content-Type: application/json" -d "{\"name\":\"$find_server\"}" "$url/read"; echo ''
            echo -e "\e[31mDONE!!\e[0m"
            ;;
        'update')
            echo 'What is the old name of the server you want to update?'
            read update_server_old_name
            echo ''
            echo 'What is the new name you want to give to the server?'
            read update_server_new_name
            echo ''
            [[ -z $update_server_old_name || -z $update_server_new_name ]] && break
            echo -e "\e[31m__Initializing...\e[0m"
            curl -X POST -H "Content-Type: application/json" -d "{\"old_name\":\"$update_server_old_name\",\"new_name\":\"$update_server_new_name\"}" "$url/update"; echo ''
            echo -e "\e[31mDONE!!\e[0m"
            ;;
        'delete')
            echo 'What is the old name of the server you want to delete?'
            read delete_server
            echo ''
            [[ -z "$delete_server" ]] && break
            echo -e "\e[31m__Initializing...\e[0m"
            curl -X POST -H "Content-Type: application/json" -d "{\"name\":\"$delete_server\"}" "$url/delete"; echo ''
            echo -e "\e[31mDONE!!\e[0m"
            ;;
        *)
            echo 'invalid option'
            ;;
    esac
done