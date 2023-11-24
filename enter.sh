#!/bin/bash
perform_upload() {
    echo "Uploading with id=$1 and password=$2"
    curl "http://10.254.7.4:801/eportal/portal/login?call_back=dr1004&login_method=1&user_account=${1}&user_password=${2}"
}

id=$(gdialog --title "Enter ID" --inputbox "Enter ID:" 10 30 2>&1)
password=$(gdialog --title "Enter Password" --inputbox "Enter Password:" 10 30 "" --insecure 2>&1)
gdialog --title "Confirmation" --yesno "You entered:\nID: $id\nPassword: $password\n\nIs this correct?" 10 40
response=$?

if [ $response -eq 0 ]; then
    perform_upload "$id" "$password"
    gdialog --title "Upload Successful" --msgbox "Upload successful!" 10 30
else
    gdialog --title "Upload Canceled" --msgbox "Upload canceled." 10 30
fi
