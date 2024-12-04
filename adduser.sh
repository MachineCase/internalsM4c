/bin/bash
# Get username, ID and full name field as arguments from command line.
#Run as root.
USER=$1
ID=$2
FULLNAME=$3

dscl . -create /Users/$USER

dscl . -create /Users/$USER UserShell /bin/zsh

dscl . -create /Users/$USER RealName "$FULLNAME"
dscl . -create /Users/$USER UniqueID $ID

dscl . -create /Users/$USER PrimaryGroupID 61

dscl . -create /Users/$USER NFSHomeDirectory /Users/$USER
OUTPUT 3-4 (continued)

mkdir /Users/$USER
chown $USER /Users/$USER

dscl . -passwd /Users/$USER "changeme"
dscl . -append /Groups/admin GroupMembership $USER
