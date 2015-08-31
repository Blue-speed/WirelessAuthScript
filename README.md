# WirelessAuthScript
Work or school wifi require login through a web page. This script handles all that for you.

##Setup
The script is simple, the hard bit finding the login format. Using your browsers dev mode examin the login form or capture the network traffic to figure that out.

###Config

**Router**
The IP address of the Gateway. THis is used to only send login info to proper router

**USER**
**PASS**
Your login username and password

**POSTDATA**
As each wifi network will be differnt this will need to be changed to match the post data sent.

*POSTURL**
URL to send login information too.

###Installation

make the script executable and place into
`/etc/network/if-up.d/`
