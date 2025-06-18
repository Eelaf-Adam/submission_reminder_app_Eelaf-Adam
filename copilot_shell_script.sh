#!/bin/bash

# The title
echo "============================"
echo "Title:The Assignments upate tool"
echo "Discription:This script file will allow the user to enter an assignment name and check it's status"
echo "Checking your submission..."
echo "============================"

# The path to the submission reminder directorynn
path_to_directory=$(ls -d submission_reminder_* 2>/dev/null | head -1)
directories=()
count_dir=0
count=0

#checking for all diretcories that start with submission_reminder_ and storing them in an array
if [ -z "$path_to_directory" ]; then
    echo "No submission reminder directory found. Run the create_environment.sh script to create one."
    exit 1
fi  
# Loop through all directories that start with submission_reminder_
while IFS= read -r dir; do
    if [[ -d "$dir" && "$dir" == submission_reminder_* ]]; then
        directories+=("$dir")
    fi
done <<< "$(ls -d submission_reminder_*)"


#checking if directories is 1

if [ ${#directories[@]} -eq 1 ]; then
    path_to_directory="${directories[0]}"
    echo "Single submission reminder directory found: $path_to_directory"

elif [ ${#directories[@]} -gt 1 ]; then
    echo "Multiple submission reminder directories found: select one"

    for dir in "${directories[@]}"; do
    #echo the directory name and number
    count_dir=$((count_dir + 1))
        echo "[$count_dir] $dir"
    done

    #asking the user to select a directory
    read -p "Select a directory number: " dir_number
    if [[ "$dir_number" =~ ^[0-9]+$ ]] && [ "$dir_number" -ge 1 ] && [ "$dir_number" -le ${#directories[@]} ]; then
        path_to_directory="${directories[$((dir_number - 1))]}"
        echo "You selected: $path_to_directory"
    else
        echo "Invalid selection. Exiting."
        exit 1
    fi
fi
 

# Adding file permisions
chmod +x copilot_shell_script.sh

# The path to the config file
path_to_file="$path_to_directory/config/config.env"

# Prompting the user to enter the assignment name 
read -p "Enter the assignment name:" aissgn_name

#printing checking processing
echo "Checking if the assignment name exists..."

#checking if the assignment name is not in row2 of the submisions.txt file
while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$aissgn_name" ]]; then
            ((count++))
            
        fi
done < <(tail -n +2 "$path_to_directory/assets/submissions.txt") # Skip the header

if [ "$count" -eq 0 ]; then
        echo "The assignment name is not in the submissions file. Please enter a valid assignment name."
        exit 1
fi

echo "Upating assignment name"

# Replace the value with the inut of the assignment 
sed -i "2s/^ASSIGNMENT=.*/ASSIGNMENT=\"$aissgn_name\"/" "$path_to_directory/config/config.env"

echo -e "\n\n"

# Running the startup file
echo "Running the startup file..."
echo "==========================================="
echo -e "\n"
./$path_to_directory/startup.sh

