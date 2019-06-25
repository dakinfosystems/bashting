#
#
#

#files=`ls -p | grep -v /`
folders=`ls -R | grep ":$" | sed -e 's/:$//'`

readarray -td\s a << "$folders"; unset 'a[-1]'; declare -p a;

echo $a
echo $folders
