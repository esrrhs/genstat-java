copy GameStatMgr.xml stat.xml /Y
genstat.exe
move StatMgr.java GameStatMgr.java
copy GameStatMgr.java D:\idea\zhajinhua_server\game_data\src\main\java\com\netease\game\stat\GameStatMgr.java /Y


copy BigRoomStatMgr.xml stat.xml /Y
genstat.exe
move StatMgr.java BigRoomStatMgr.java
copy BigRoomStatMgr.java D:\idea\zhajinhua_server\game_data\src\main\java\com\netease\game\stat\BigRoomStatMgr.java /Y

copy DdzStatMgr.xml stat.xml /Y
genstat.exe
move StatMgr.java DdzStatMgr.java
copy DdzStatMgr.java D:\idea\zhajinhua_server\game_data\src\main\java\com\netease\game\stat\DdzStatMgr.java /Y

copy BlackJackStatMgr.xml stat.xml /Y
genstat.exe
move StatMgr.java BlackJackStatMgr.java
copy BlackJackStatMgr.java D:\idea\zhajinhua_server\game_data\src\main\java\com\netease\game\stat\BlackJackStatMgr.java /Y
