#!/bin/bash

show_analyze_log_content() {
	log_file_path=$1;
	echo "LOG_PATH_FILE: " $log_file_path
	
	while read -r line
	do
        	echo $line;
	done < "$log_file_path" 	
}
