#!/bin/bash
source show_menus_analyze.sh 
source read_input.sh
source func.sh
source display_analyze_file.sh

analyze_del_large_files(){
    location=$2;
    opt=$3;
    while [ opt != '100' ]
        do
        if [[ $opt = 'q' ]]; then
            exit;
        else
            case $opt in

            1)
            clear;
            #option_picked "SubOption 1-8-1 Picked - Analyze - Large Files";

	    #find_old_30
	    find_large_files $location $scriptlogPath/analyze_rm_large_files.log $scriptlogPath/cleanup_rm_large_files.log	    
	    show_analyze_log_content $scriptlogPath/analyze_rm_large_files.log;
	
            show_submenu_analyze_del_large_files opt;
            location=''
            if [ $opt != 'q' ] && [ $opt != '100' ]; then
	    	echo "enka"
		ReadLocation location;
 	    fi
            ;;

            2)
            clear;
            #option_picked "SubOption 1-8-2 Picked - Analyze - Large Folders";

	    find_large_folders $location $scriptlogPath/analyze_rm_large_folders.log $scriptlogPath/cleanup_rm_large_folders.log
            show_analyze_log_content $scriptlogPath/analyze_rm_large_folders.log;

            show_submenu_analyze_del_large_files opt;
            location=''
            if [ $opt != 'q' ] && [ $opt != '100' ]; then
		echo "dvojka"
		ReadLocation location;
            fi
	    ;;

            3)
            clear;
            #option_picked "SubOption 1-8-3 Picked - Analyze - Large Files and Folders";

	    find_large_files_folders $location $scriptlogPath/analyze_rm_large_files_folders.log $scriptlogPath/cleanup_rm_large_files_folders.log
            show_analyze_log_content $scriptlogPath/analyze_rm_large_files_folders.log;

            show_submenu_analyze_del_large_files opt;
            location=''
	    if [ $opt != 'q' ] && [ $opt != '100' ]; then	
		echo "trojka"
                ReadLocation location;
	    fi
            ;;
             

            100)
	    echo "100tka"
            clear;
            show_submenu_analyze;
            break ;;

        esac
        fi
    done
}

