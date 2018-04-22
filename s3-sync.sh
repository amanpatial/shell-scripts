
#---------------------------------------------------------------
# Purpose: Sync content files from one S3 bucket to other
# Author: Aman Patial
# Version: 0.1
# Dependency: AWS S3 CLI
#---------------------------------------------------------------

#------ Input parameters ----------
#$0: script name
#$1: source name
#$2: destination name
#$3: aws cli profile name
#----------------------------------

date
#Source and destination values
SOURCE="s3://"$1
DESTINATION="s3://"$2
AWS_PROFILE="$3"
DATE=`date +%Y-%m-%d`
echo $DATE

echo "Source Path:" $SOURCE
echo "Destination Path:" $DESTINATION
echo "AWS Profile Name:" $AWS_PROFILE

OUTPUT_PATH="/tmp/s3_$SOURCE_$DESTINATION_$DATE.out"

echo "Start syncing content files from" $SOURCE "to" $DESTINATION "..."
set -x
aws s3 sync $SOURCE $DESTINATION --profile $AWS_PROFILE --delete > $OUTPUT_PATH
set +x
echo "Content synched successfully!"
date
