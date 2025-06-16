#!/bin/bash

# The title
echo "============================"
echo "Title:The create environment script"
echo "Discription:This script will create the submission rmeinder app directory"
echo "setting up environment..."
echo "============================"

# Prompting the user to enter their name
while true; do
read -p "Enter Your name here:" usr_name 

if  [[ -z "$usr_name" ]]; then 
	echo "Erorr: Username cannot be empty"
elif [[ ${#usr_name} -lt 3 ]]; then 
	echo "Erorr: Minimum character allowed is 3"
elif [[ ${#usr_name} -gt 20 ]]; then
	echo "Erorr: Maximum charcter allowed is 20"
elif [[ ! "$usr_name" =~ ^[a-zA-Z_]+$ ]]; then
	echo " Username must be in alphabet or underscore format only"
else 
	echo "Great! directory created succesfuly with the user input"
	break
fi
done

#Creating the directory, subdirectories and files
# 1. Creating the parent directory 
mkdir -p submission_reminder_"$usr_name"

# 2. Creating subdirectroies 
mkdir -p submission_reminder_"$usr_name"/app
mkdir -p submission_reminder_"$usr_name"/modules
mkdir -p submission_reminder_"$usr_name"/assets
mkdir -p submission_reminder_"$usr_name"/config

# 3. Creating the files 
touch submission_reminder_"$usr_name"/app/reminder.sh
touch submission_reminder_"$usr_name"/modules/functions.sh
touch submission_reminder_"$usr_name"/assets/submissions.txt
touch submission_reminder_"$usr_name"/config/config.env
touch submission_reminder_"$usr_name"/startup.sh

