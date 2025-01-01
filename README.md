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
 hetz-prompt # An interactive for crud actions you want to perform like in the examples below
```

2. CLI / One-liners:
```bash
hetz-cli create NAME
hetz-cli read NAME
hetz-cli update NAME,NEW_NAME
hetz-cli delete NAME
```
