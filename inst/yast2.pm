#!/usr/bin/perl -w
use strict;
use bmwqemu;

# partition based
waitinststage "disk";
sendkey $cmd{"next"};

# user setup
waitinststage "usersettings";
waitidle 18;
sendautotype("bernhard");
sendkey "tab";
#sleep 1;
sendkey "tab";
for(1..2) {
	sendautotype("nots3cr3t\t");
	#sleep 1;
}
# done user setup
sendkey $cmd{"next"};
# loading cracklib
waitidle 4;
# PW too easy (cracklib)
sendkey "ret";
#sleep 1;
# PW too easy (only chars)
#sendkey "ret";

# overview-generation
waitinststage "installationoverview";
sleep 5;
waitidle 10;
# start install
sendkey $cmd{install};
sleep 2;
waitidle 5;
# confirm
sendkey $cmd{install};
waitinststage "performinstallation";
if(!$ENV{LIVECD}) {
	sleep 5; # view installation details
	sendkey $cmd{instdetails};
}

1;
