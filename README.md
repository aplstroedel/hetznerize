### Instructions:
```bash
# Note: install jq as a dependcy with the packagemanager of your distribution
sudo apt install jq -y # Debian based only
git clone https://github.com/aplstroedel/hetznerize.git
cd hetznerize
mv .example.env .env # Make sure to modify the variables for having the correct values
sudo mv control.sh /usr/local/bin/hetz-control # unified old cli and prompt
npm install
node index.js OR docker-compose up -d # Running on port 7000 by default 
```

### Usage:
1. Interactive prompt:
```bash
hetz-control --prompt # An interactive for crud actions you want to perform like in the examples below
```

2. CLI / One-liners:
```bash
hetz-control create NAME # create a server
hetz-control read NAME # list return a server id
hetz-control readall # list all servers id,name,ip
hetz-control update NAME,NEW_NAME # update a server its name
hetz-control delete NAME # delete a server by name
```
