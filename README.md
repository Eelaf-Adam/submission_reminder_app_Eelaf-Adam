<h1 align="center">👋🏽 Hi This is My Individual Summative Project</h1>

## 🔔⏰Submission Reminder Application for Student

### 🔍 App Overview
### Stay on Track with your Deadlines
A simple reminder app that alret students about upcoming assignments deadlines.


## 🗽Project Status: Completed
A complete development of the project has been acheived with the follwing componenet:

1. A create environment script that set up the main submission directory which will contains the follwing files >

    a. reminder.sh: Check the status for each studnet and sends reminders.
  
    b. functions.sh:  It contains helper functions used by the main reminder script. 
  
    c. submissions.txt: Holds sample student submission data for the reminder system.
  
    d. config.env: Stores configuration settings like file paths or environment variables.
  
    e. startup.sh: This file launches the reminder app and runs necessary componenet.

2. A copilot shell script Updates the assignment name in config.env and runs startup.sh to check updated submission status.


## 🛠️App Setup and Installion
Follow these steps to setup the app in your laptop device:

1. Clone the project repository locally using your terminal, preferably "Git Bah".
```sh
git clone https://github.com/Eelaf-Adam/submission_reminder_app_Eelaf-Adam.git
```

2. Navigate to the project directory 
```sh
cd submission_reminder_app_Eelaf-Adam
```

3. Run the setup script 
```sh
./create_environment.sh
```
  - After running the script you will be prompted to enter your user name.
  - It will create the directory with your user name.
  - The script will create all the necessray subdirectories, the files, with the following sctructure:
```sh
submission_reminder_{username}/
├── app/
│   └── reminder.sh
├── modules/
│   └── functions.sh
├── assets/
│   └── submissions.txt
├── config/
│   └── config.env
└── startup.sh
```

4. Run the copilot
```sh
./copilot_shell_script.sh
```
 - You will be promted to enter the name of the assignment you want to check.
 - Then the script will show you the status of the assignment you enter.
 - Lastly it will run the starup script.


## 🔥Demo and 🚀Usage

### Watch the video below, which demonstrates how to use the app.
<a href="https://youtu.be/hytbyQMYN08">
   <img src="https://img.youtube.com/vi/hytbyQMYN08/maxresdefault.jpg"
        alt="Hospital Managemnet Demo"
        width="800">
  
## 🌐Author
- 👩🏽‍💻[**Eelaf Adam**](https://github.com/Eelaf-Adam)


## 📑License
copyright @ 2025 [**Eelaf Adam**](https://github.com/Eelaf-Adam)

