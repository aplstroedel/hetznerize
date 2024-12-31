// Note: you might want to change the ssh_keys to your key(s)

import 'dotenv/config'

export const createServer = async (name) => {
    if (name === '') {
        return 'no name specified to create'
    }
    let request = await fetch("https://api.hetzner.cloud/v1/servers", {
        method: 'POST',
        headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer "+process.env.TOKEN,
        },
        body: JSON.stringify({
            "automount": false,
            "image": "ubuntu-24.04",
            "location": "fsn1",
            "name": name,
            "public_net": {
              "enable_ipv6": false,
            },
            "server_type": "cx22",
            "ssh_keys": [
              "kevin@ghost"
            ],
            "start_after_create": true,      
        })
    })
    let result = await request.json()
    return result
}

export const readServer = async (name) => {
    if (name === '') {
        return 'no name specified to search'
    }
    let request = await fetch("https://api.hetzner.cloud/v1/servers?name="+name, {
        method: 'GET',
        headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer "+process.env.TOKEN,
        }
    })
    let result = await request.json()
    if (result.servers[0]) {
        let serverID = result.servers[0].id
        return serverID
    } else {
        return 'no such server'
    }
}

export const updateServer = async (id,name) => {
    console.log({id,name})
    if (id === '' || name === '') {
        return 'no id or name specified to update'
    }
    let request = await fetch("https://api.hetzner.cloud/v1/servers/"+id, {
        method: 'PUT',
        headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer "+process.env.TOKEN,
        },
        body: JSON.stringify({
            "name": name,
        })
    })
    let result = await request.json()
    return result
}

export const deleteServer = async (id) => {
    if (id === '') {
        return 'no id specified to delete'
    }
    let request = await fetch("https://api.hetzner.cloud/v1/servers/"+id, {
        method: 'DELETE',
        headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer "+process.env.TOKEN,
        }
    })
    let result = await request.json()
    return result
}