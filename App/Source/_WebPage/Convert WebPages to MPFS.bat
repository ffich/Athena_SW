java -jar "..\..\Utilities\MPFS2.jar" /mpfs2 /C18_C32 "..\_WebPage" "." "MPFSImg2.c"
del "HTTPPrint.idx"
move "HTTPPrint.h" "..\h\Stacks\TcpIp"
move "MPFSImg2.c" "..\c\Stacks\TcpIp"