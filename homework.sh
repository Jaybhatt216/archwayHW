#/bin/bash




#part 1
 OutFileName="all.csv"                     
i=0                                       
for filename in ./*.csv; do 
 if [ "$filename"  != "$OutFileName" ] ;      
 then 
   if [[ $i -eq 0 ]] ; then 
      head -1  "$filename" >   "$OutFileName"
   fi
   tail -n +2  "$filename" >>  "$OutFileName" 
   i=$(( $i + 1 ))                            
done

#part 2

sed "s/$/;"client_id"/" all.csv

for file in ./*.csv; do
    sed -i "s/$/,$file/" "$file"
done

#part 3
#gzip command

gzip all.csv


#part 4
S3KEY="my aws key"
S3SECRET="my aws secret"

function putS3
{
  path=$1
  file=$2
  aws_path=$3
  bucket='my-aws-bucket'
  date=$(date +"%a, %d %b %Y %T %z")
  acl="x-amz-acl:public-read"
  content_type='csv'
  string="PUT\n\n$content_type\n$date\n$acl\n/$bucket$aws_path$file"
  signature=$(echo -en "${string}" | openssl sha1 -hmac "${S3SECRET}" -binary | base64)
  curl -X PUT -T "$path/$file" \
    -H "Host: $bucket.s3.amazonaws.com" \
    -H "Date: $date" \
    -H "Content-Type: $content_type" \
    -H "$acl" \
    -H "Authorization: AWS ${S3KEY}:$signature" \
    "https://$bucket.s3.amazonaws.com$aws_path$file"
}

for file in "$path"/*; do
  putS3 "$path" "${file##*/}" "/path/on/s3/to/files/"
done




#part 5 
#crontab -e
5 * * * * /path of script
