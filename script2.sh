PACKAGE="python3"

echo "=================================="
echo "   FOSS PACKAGE INSPECTOR"
echo "=================================="
echo ""
echo "Checking for package: $PACKAGE"
echo ""

if rpm -q $PACKAGE &>/dev/null; then
    echo "✓ $PACKAGE is INSTALLED on this system"
    echo ""
    echo "Package Details:"
    rpm -qi $PACKAGE | grep -E 'Version|License|Summary|Release'
    
elif dpkg -l | grep -q "^ii  $PACKAGE"; then
    echo "✓ $PACKAGE is INSTALLED on this system"
    echo ""
    echo "Package Details:"
    dpkg -l | grep "^ii  $PACKAGE"
else
    echo "✗ $PACKAGE is NOT INSTALLED on this system"
    echo ""
    echo "To install it, try:"
    echo "  - On Red Hat/Fedora: sudo yum install $PACKAGE"
    echo "  - On Debian/Ubuntu:  sudo apt install $PACKAGE"
fi

echo ""
echo "=================================="
echo "Philosophy Notes by Package:"
echo "=================================="
echo ""

case $PACKAGE in
    python3|python)
        echo "Python: A language shaped entirely by community consensus."
        echo "Guido van Rossum's gift to the world demonstrates that open"
        echo "development produces tools that are both powerful and human."
        ;;
    httpd|apache2)
        echo "Apache: The web server that built the open internet."
        echo "Powers ~30% of all websites globally through transparent,"
        echo "collaborative development and GPL-compatible licensing."
        ;;
    mysql|mariadb)
        echo "MySQL: Open source at the heart of millions of applications."
        echo "A dual-license story showing how open source can create"
        echo "both community freedom and commercial viability."
        ;;
    git)
        echo "Git: The tool Linus Torvalds built when proprietary version"
        echo "control failed him. Now the backbone of all modern development."
        ;;
    firefox)
        echo "Firefox: A nonprofit fighting for an open web."
        echo "Proves that open source can compete with commercial"
        echo "alternatives while respecting user freedom."
        ;;
    *)
        echo "This package is part of the vast ecosystem of open source"
        echo "software that powers the modern digital world."
        ;;
esac

echo ""
echo "=================================="
