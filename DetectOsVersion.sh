#Detect the version of OS X running 
OSversion=`sw_vers | grep ProductVersion`

case $OSversion in
*10.6*)
        echo "You are running OS X Snow Leopard (10.6)"
	;;
*10.7*)
        echo "You are running OS X Lion (10.7)"
	;;
*10.8*)
        echo "You are running OS X Mountain Lion (10.8)"
	;;
*10.9*)
        echo "You are running OS X Mavericks (10.9)"
	;;
*10.10.*)
        echo "You are running OS X Yosemite (10.10)"
        ;;
*10.11.*)
        echo "You are running OS X El Capitan (10.11)"
        ;;
esac
