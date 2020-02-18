# An over complicated script that lists
# everyone who is connected to rasAP
# without having to connect.

# use case:
# ping if a chance is connected!
# This will alert you to a new connection.

# NOTE: I do not know if there is something
# different or if there is an API I can use.
# I didn't think to look until I made this
# horrible creature.

LOGIN_INFO="USER:PASS"
RASAP_IP="http://10.3.141.1"

curl -s -u ${LOGIN_INFO} ${RASAP_IP} | tr '\n' ' ' | sed 's/.*.Connected Devices/Connected Devices/' | sed 's/<\/table>.*./<\/table>/' | sed 's/ //g' | sed 's/.*.over">//' | sed 's/.*.thead>//' | sed 's/<\/tr>/<\/tr>\n/' | sed 's/<\/tbody>.*.//' | sed 's/<tbody>//' | sed 's/^/HOSTNAME\tIPADDR\t\t\tMACADDR\n/' | sed 's/<tr>//'| sed 's/<td>//g' | sed 's/<\/tr>//' | sed 's/<\/td>/\t\t/g'

# hostname | IPAddress | MACAddress
