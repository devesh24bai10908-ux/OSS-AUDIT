STUDENT_NAME="Devesh Agarwal"
REG_NUMBER="24BAI10908"
SOFTWARE_CHOICE="Python" 

KERNEL=$(uname -r)                          
DISTRO=$(cat /etc/os-release | grep "^NAME" | cut -d'"' -f2)  
USER_NAME=$(whoami)                         
HOME_DIR=$(echo $HOME)                     
UPTIME=$(uptime -p)                        
CURRENT_DATE=$(date '+%A, %d %B %Y')       
CURRENT_TIME=$(date '+%H:%M:%S')           

echo "=================================="
echo "   OPEN SOURCE AUDIT PROJECT"
echo "=================================="
echo ""
echo "Student Information:"
echo "  Name     : $STUDENT_NAME"
echo "  Reg No   : $REG_NUMBER"
echo "  Software : $SOFTWARE_CHOICE"
echo ""
echo "System Information:"
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  User         : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo ""
echo "Current Status:"
echo "  Uptime       : $UPTIME"
echo "  Date         : $CURRENT_DATE"
echo "  Time         : $CURRENT_TIME"
echo ""
echo "Open Source License:"
echo "  This Linux system runs on GPL v2 and compliant licenses"
echo "=================================="
