#!/bin/bash
ENV=$1
echo "The environement is $ENV"
if [ $ENV=dev ]
then
	#tar --exclude='./project1/config/stg' --exclude='./project1/config/prod' -zcvf myproj.$ENV.tar.gz project1/
	tar -zcvf myproj.$ENV.tar.gz --exclude="project1/config/prod" --exclude="project1/config/stg" project1/
        #tar -pczvf myproj.$ENV.tar.gz project1/ --exclude ./project1/config/prod
elif [ $ENV=stg ]
then
	#tar --exclude='./project1/config/dev' --exclude='./project1/config/prod' -zcvf myproj.$ENV.tar.gz project1/
	tar -zcvf myproj.$ENV.tar.gz --exclude="project1/config/prod" --exclude="project1/config/dev" project1/
else
	#tar --exclude='./project1/config/dev' --exclude='./project1/config/stg' -zcvf myproj.$ENV.tar.gz project1/
	tar -zcvf myproj.$ENV.tar.gz --exclude="project1/config/dev" --exclude="project1/config/stg" project1/
fi
