ENV="$1"
project="$2"  
#Pass the variable in string 
case "$ENV" in 
    #case 1 
    "dev") tar -zcvf myproj.$ENV.tar.gz --exclude="$project/config/prod" --exclude="$project/config/stg" $project/ ;; 
      
    #case 2 
    "stg") tar -zcvf myproj.$ENV.tar.gz --exclude="$project/config/prod" --exclude="$project/config/dev" $project/ ;; 
      
    #case 3 
    "prod") tar -zcvf myproj.$ENV.tar.gz --exclude="$project/config/dev" --exclude="$project/config/stg" $project/ ;; 
esac 
