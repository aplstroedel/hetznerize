### Instructions:
- git clone https://github.com/aplstroedel/hetznerize.git
- cd hetznerize
- mv .example.env .env <span style="color:grey;">Make sure to modify the variables for having the correct values</span>
- sudo mv cli.sh /usr/local/bin/hetz-cli
- sudo mv prompt.sh /usr/local/bin/hetz-prompt
- npm install
- node index.js <span style="color:grey;">As downloaded, this will run on port 7000</span>

### Usage:
1. Interactive prompt:
- hetz-prompt <span style="color:grey;">This is an interactive prompt that asks what crud action you want to perform like in the examples below</span>

2. CLI / One-liners:
- hetz-cli create NAME
- hetz-cli read NAME
- hetz-cli update NAME,NEW_NAME
- hetz-cli delete NAME
