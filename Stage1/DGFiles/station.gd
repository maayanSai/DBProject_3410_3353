
[General]
Version=1

[Preferences]
Username=
Password=2259
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=MAAYAN1
Name=STATION
Count=400

[Record]
Name=NAME
Type=VARCHAR2
Size=15
Data=Address1
Master=

[Record]
Name=IDSTATION
Type=NUMBER
Size=
Data=Random(10000, 99999)
Master=

[Record]
Name=ADRRESS
Type=VARCHAR2
Size=15
Data=Address1 + City
Master=

