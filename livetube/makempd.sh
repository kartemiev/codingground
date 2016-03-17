
#!/bin/bash

#
# all parameters are optional
#
# Usage: makempd.sh [-2 <240p file name>] [-3 <320p file name>] [-4 <480p file name>] [-7 <720p file name>] [-s <subtitles file name>]
#
# Example: makempd.sh -3 /tmp/myphim_output_320p.mp4 -7 /tmp/myphim_output_720p.mp4 -s /tmp/myphim.sub
#
#

function check_file_exists_and_not_empty () {
       RESULT=
       if [ -f $1 ] && [ -s $1 ]; then
        RESULT=$1
       fi
    }

##
## default values

OPTQ240P=
OPTQ360P=
OPTQ480P=
OPTQ720P=
OPTSUB=
MP4BOXPARAM=

while getopts ":2:3:4:7:s:" opt; do
  case $opt in
    2)
      check_file_exists_and_not_empty $OPTARG
      OPTQ240P=$RESULT
      ;;
    3)
      check_file_exists_and_not_empty $OPTARG
      OPTQ320P=$RESULT
      ;;
    4)
      check_file_exists_and_not_empty $OPTARG
      OPTQ480P=$RESULT
      ;;
    7)
      check_file_exists_and_not_empty $OPTARG
      OPTQ720P=$RESULT
      ;;
    s)
      check_file_exists_and_not_empty $OPTARG
      OPTSUB=$RESULT
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

MP4BOXPARAM="MP4Box $OPTQ240P $OPTQ320P $OPTQ480P $OPTQ720P $OPTSUB"
echo $MP4BOXPARAM
