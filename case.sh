ENV="$1"
  
#Pass the variable in string 
case "$ENV" in 
    #case 1 
    "dev") tar -zcvf myproj.$ENV.tar.gz --exclude="project1/config/prod" --exclude="project1/config/stg" project1/ ;; 
      
    #case 2 
    "stg") tar -zcvf myproj.$ENV.tar.gz --exclude="project1/config/prod" --exclude="project1/config/dev" project1/ ;; 
      
    #case 3 
    "prod") tar -zcvf myproj.$ENV.tar.gz --exclude="project1/config/dev" --exclude="project1/config/stg" project1/ ;; 
esac 
