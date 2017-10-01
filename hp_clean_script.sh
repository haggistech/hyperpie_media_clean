RED='\033[0;31m'
NC='\033[0m' # No Color
GREEN='\033[0;32m'

snapcount=0
boxcount=0
cartcount=0
wheelcount=0

if [ -z $1 ]; then
  clear
  echo
  echo " --= Hyperpie Media Clean =--"
  echo
  echo " SYNOPSIS"
  echo " hp_clean_script.sh flags"
  echo
  echo " DESCRIPTION"
  echo " This script will will check what roms are listed in the system folder you choose"
  echo " it will then remove any mdeia it is not using to free up space"
  echo
  echo " OPTIONS"
  echo " test                 This will run the script in test mode removing no media"
  echo " clean system        e.g ./hp_clean_script clean mastersystem. This would remove unused media in the mastersystem folder"
  echo
  echo " EXAMPLES"
  echo " hp_clean_script.sh clean mastersystem"
  echo
  echo " IMPLEMENTATION"
  echo " version         hp_clean_script.sh (www.hyperpie.org) 0.0.1b"
  echo " author          Mik McLean (Haggis)"
  echo " license         GNU General Public License"
  echo
  exit
fi

if [ $1 = "test" ]; then
  clear
  echo
  echo " Test Run - No Files will be deleted"
  echo
  echo " Results below show what will be deleted when "test" flag is not used"
  echo
  sleep 2
fi

if [ $1 == "clean" ]; then
clear
echo
echo " Checking Media against Roms.....Please Wait....."
echo
fi

DIR=/home/pi/RetroPie/roms/$2/snap
if [ "$(ls -A $DIR)" ]; then
cd $DIR
for file in *; do
#echo $file
x=$(basename "$file")
name=$(echo $x | cut -f 1 -d '.')
if [ -f "../$name"* ]; then
echo -e "${GREEN}$name file exists${NC}"
else
echo "$name file does not exists - SNAP DELETED"
if [ $1 != "test" ]; then
rm -rf "$file"
fi
snapcount=$[$snapcount+1]
fi
done
else
    echo "$2 snaps directory is Empty. Aborting Snaps clean up"
fi

DIR=/home/pi/RetroPie/roms/$2/boxart
if [ "$(ls -A $DIR)" ]; then
cd $DIR
for file in *; do
x=$(basename "$file")
name=$(echo $x | cut -f 1 -d '.')
if [ -f "../$name"* ]; then
echo -e "${GREEN}$name file exists${NC}"
else
echo "$name file does not exists - BoxArt DELETED"
if [ $1 != "test" ]; then
rm -rf "$file"
fi
boxcount=$[$boxcount+1]
fi
done
else
    echo "$2 boxart directory is Empty. Aborting Boxart clean up"
fi

DIR=/home/pi/RetroPie/roms/$2/cartart
if [ "$(ls -A $DIR)" ]; then
cd $DIR
for file in *; do
x=$(basename "$file")
name=$(echo $x | cut -f 1 -d '.')
if [ -f "../$name"* ]; then
echo -e "${GREEN}$name file exists${NC}"
else
echo "$name file does not exists - CartArt DELETED"
if [ $1 != "test" ]; then
rm -rf "$file"
fi
cartcount=$[$cartcount+1]
fi
done
else
    echo "$2 cartart directory is Empty. Aborting Cartart clean up"
fi

DIR=/home/pi/RetroPie/roms/$2/wheel
if [ "$(ls -A $DIR)" ]; then
cd $DIR
for file in *; do
x=$(basename "$file")
name=$(echo $x | cut -f 1 -d '.')
if [ -f "../$name"* ]; then
echo -e "${GREEN}$name file exists${NC}"
else
echo "$name file does not exists - BoxArt DELETED"
if [ $1 != "test" ]; then
rm -rf "$file"
fi
wheelcount=$[$wheelcount+1]
fi
done
else
    echo "$2 wheel directory is Empty. Aborting Wheel Art clean up"
fi


echo
echo
echo " --= $2 =--"
echo " Snaps Deleted: $snapcount"
echo " Boxart Deleted: $boxcount"
echo " Wheel Art Deleted: $wheelcount"
echo " Cart Art Deleted: $cartcount"
echo
echo
