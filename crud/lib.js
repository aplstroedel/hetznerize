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
              process.env.SSH_KEY
            ],
            "start_after_create": true,      
        })
    })
    let result = await request.json()
    return result
}

export const readServer = async (name=null) => {
    let suffix = name ? "?name="+name : ''
    let request = await fetch("https://api.hetzner.cloud/v1/servers"+suffix, {
        method: 'GET',
        headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer "+process.env.TOKEN,
        }
    })
    let result = await request.json()
    if (result.servers.length == 1 ) {
        let serverID = result.servers[0].id
        return serverID
    } else if (result.servers.length > 1) {
        let servers = []
        result.servers.forEach(s => {
            servers.push({id: s.id, name: s.name, ip: s.public_net.ipv4.ip})
        });
        return {
            action: {
                status: 'running',
                servers: servers
            }
        }
    } else {
        return 'no servers to show'
    }
}

export const updateServer = async (id,name) => {
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