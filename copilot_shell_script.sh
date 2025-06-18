#!/bin/bash

# The title
echo "============================"
echo "Title:The Assignments upate tool"
echo "Discription:This script file will allow the user to enter an assignment name and check it's status"
echo "Checking your submission..."
echo "============================"

# The path to the submission reminder directorynn
path_to_directory=$(ls -d submission_reminder_* 2>/dev/null | head -1)

# Adding file permisions
chmod +x copilot_shell_script.sh

# The path to the config file
path_to_file="$path_to_directory/config/config.env"

# Prompting the user to enter the assignment name 
read -p "Enter the assignment name:" aissgn_name
echo "Upating assignment name"

# Replace the value with the inut of the assignment 
sed -i "2s/^ASSIGNMENT=.*/ASSIGNMENT=\"$aissgn_name\"/" "$path_to_directory/config/config.env"

# Running the startup file
./$path_to_directory/startup.sh
