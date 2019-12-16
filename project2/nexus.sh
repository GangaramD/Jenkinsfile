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
echo "wget --user=$user --password=$password http://$nexusrepourl/repository/$Repo_name/$groupid/$artifactid/$version/$filename.msi"	

export filename=$filename
echo "$filename"
