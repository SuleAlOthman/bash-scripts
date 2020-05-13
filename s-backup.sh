#!/bin/bash

now=$(date +%F-%H-%M-%S) # get time now

folder_bp='website-folder'
backup_file=$folder_bp"-backup-$now.tar.gz" # result : website-folder-10-3-2020-05-25-45.tar.gz

data_bp='database-name' # replace with your database name
data_wext=$data_bp'.sql' # database file name with extesnion
data_user='user' # replace with database user
data_pass='111111' # replace with database password

mysqldump --user=$data_user --password=$data_pass $data_bp > $data_wext # get database

tar -zcvf $backup_file $folder_bp $data_wext # compress web folder with database file

rm -f $data_wext # delete database file after comporessed

echo 'Everything Ok!'
