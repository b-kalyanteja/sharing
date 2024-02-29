# the parent image  used here is tomcat - version 8 as mentioned in assignment
FROM tomcat:8

#  not adding any labels 

# To make sure that the default directory is empty, This step cleans the existing content
RUN rm -rf /usr/local/tomcat/webapps/*

# Ccopying the project (.war file) to the directory
COPY ROOT.war /usr/local/tomcat/webapps/

# not providing  a CMD [] command , since its samll .war file, It's renamed it to ROOT.War for default access