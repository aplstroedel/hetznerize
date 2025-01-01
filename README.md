### Instructions:
```shell
git clone https://github.com/aplstroedel/hetznerize.git
cd hetznerize
mv .example.env .env \# Make sure to modify the variables for having the correct values
sudo mv control.sh /usr/local/bin/hetz-control \# unified cli and prompt
sudo mv cli.sh /usr/local/bin/hetz-cli \# if you prefer oneliners
sudo mv prompt.sh /usr/local/bin/hetz-prompt \# if you prefer interactivity
npm install
node index.js OR docker-compose up -d \# Running on port 7000 by default 
```

### Usage:
1. Interactive prompt:
```shell
 hetz-prompt \# This is an interactive prompt that asks what crud action you want to perform like in the examples below
```

2. CLI / One-liners:
```shell
hetz-cli create NAME
hetz-cli read NAME
hetz-cli update NAME,NEW_NAME
hetz-cli delete NAME
```
