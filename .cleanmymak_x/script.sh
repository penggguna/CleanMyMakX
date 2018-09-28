#!/bin/bash
#    _______                __  ___       __  ___     __     _  __
#   / ___/ /__ ___ ____    /  |/  /_ __  /  |/  /__ _/ /__  | |/_/
#  / /__/ / -_) _ `/ _ \  / /|_/ / // / / /|_/ / _ `/  '_/ _>  <  
#  \___/_/\__/\_,_/_//_/ /_/  /_/\_, / /_/  /_/\_,_/_/\_\ /_/|_|  
#                               /___/                             

tampilkanText(){
  echo "   _______                __  ___       __  ___     __     _  __ "
  echo "  / ___/ /__ ___ ____    /  |/  /_ __  /  |/  /__ _/ /__  | |/_/ "
  echo ' / /__/ / -_) _ `/ _ \  / /|_/ / // / / /|_/ / _ `/  _/  _>  <   '
  echo " \___/_/\__/\_,_/_//_/ /_/  /_/\_, / /_/  /_/\_,_/_/\_\ /_/|_|   "
  echo "  mdazhari@bk.ru              /___/                              "
}

clear
tampilkanText

echo ''
echo 'Program ini akan melakukan pembersihan file yang tidak berguna'
echo 'Ingin melihat detail kapasitas drive anda? (y/t)'
read -r lihatdetail
if [ "$lihatdetail" = y ]
then
  echo 'Membuka...'
  open /Applications/Utilities/Disk\ Utility.app/
fi
echo 'Lanjutkan untuk melakukan pembersihan? (y/t)'
read -r persetujuan

case $persetujuan in
  'y')  
    echo 'Menuju direktori user...'
    echo 'Dan menghapus cache user'
    cd ~/
    find .cache
    ( set -x; pwd; rm -rf .cache)

    echo "Menuju ke direktori library user..."
    cd ~/Library/
    find Caches/
    echo 'Dan menghapus cache user'
    ( set -x; pwd; rm -rf Caches/)

    echo "Menuju ke direktori library user..."
    cd ~/Library/
    find Cookies/
    echo 'Dan menghapus cookie users'
    ( set -x; pwd; rm -rf Cookies/)

    echo "Menuju ke direktori library user..."
    cd ~/Library/
    find Logs/
    echo 'Dan menghapus log users'
    ( set -x; pwd; rm -rf Logs/)

    echo "Menuju ke direktori library sistem..."
    cd /Library/
    find Caches/
    echo 'Dan menghapus cache sistem'
    ( set -x; pwd; rm -rf Caches/)

    echo "Menuju ke direktori library sistem..."
    cd /Library/
    find Cookies/
    echo 'Dan menghapus cookie sistem'
    ( set -x; pwd; rm -rf Cookies/)

    echo "Menuju ke direktori library sistem..."
    cd /Library/
    find Logs/
    echo 'Dan menghapus cookie sistem'
    ( set -x; pwd; rm -rf Logs/)

    echo "Menuju ke direktori xcode..."
    cd ~/Library/Developer/Xcode
    find DerivedData/
    echo 'Menghapus derived data xcode'
    ( set -x; pwd; rm -rf DerivedData/)
    find DocumentationCache/
    echo 'Dan menghapus documentation cache xcode'
    ( set -x; pwd; rm -rf DocumentationCache/)

    echo 'Menuju ke tempat sampah user'
    cd ~/.Trash
    find .
    echo 'Menghapus tempat sampah user'
    ( set -x; pwd; rm -rf *)

    echo '\n\n'
    tampilkanText
    echo '\n\n PEMBERSIHAN SELESAI'
    open /Applications/Utilities/Disk\ Utility.app/

  ;;
  't')  echo 'Anda tidak mau'
  ;;
  *) /script.sh
  ;;
esac