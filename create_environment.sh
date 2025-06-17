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

# 4. Adding the files content 
# The reminder file 
cat << 'EOF' > "submission_reminder_"$usr_name"/app/reminder.sh"
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF 
chmod +x submission_reminder_"$usr_name"/app/reminder.sh 

# The functions file 
cat << 'EOF' > "submission_reminder_"$usr_name"/modules/function.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF
chmod +x submission_reminder_"$usr_name"/modules/functions.sh

# The submissions file 
cat << 'EOF' > "submission_reminder_"$usr_name"/assets/submission.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Lee, HTML & CSS, in proress
Mona, Shell Scripting, submitted
Hamid, Linux Basic Commands, not submitted
Ben, Python, in progress
Lina, JavaScript, submitted
Ahmed, C Programming, not submitted
EOF

# The config file
cat << 'EOF' > "submission_reminder_"$usr_name"/config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF 

# The startup file 
cat << 'EOF' > "submission_reminder_"$usr_name"/startup.sh"
#!/bin/bash
./app/reminder.sh
EOF
chmod +x submission_reminder_"$usr_name"/startup.sh
