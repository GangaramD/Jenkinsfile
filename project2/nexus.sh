#!/bin/bash
set -e
user=$nexususer
password=$pass
repo_url="$nexusrepo"    #nexus repo url
Repo_name="Cropin"
sourcerepofolder="$sourcerepofolder"
name=$Appname
version=$Appversion
date=`echo $version | awk -F . '{print $2}'`
#artifactid=$2
filename="$name-$version"
groupid=$sourcerepofolder/$date/products/webservices
artifactid=$name

echo "Script to donwload artifacts from the nexus repo"
wget --user=$user --password=$password http://$nexusrepourl/repository/$Repo_name/$groupid/$artifactid/$version/$filename.msi	

export filename=$filename
echo "$filename"

cp $filename.msi /c/WebSites/dev2/CropInMVC/
echo "Create a backup of old artifact"
old_date=$(date +%Y-%m-%d)
tar -cvf $old_date-CropInMVC.tar -C /c/WebSites/dev2/CropInMVC/ .
cp -r $old_date-CropInMVC.tar /c/backup/

