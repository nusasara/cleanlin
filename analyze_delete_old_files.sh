#!/bin/bash
source show_menus_analyze.sh 
source read_input.sh
source func.sh
source display_analyze_file.sh

analyze_del_old_files(){
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
            #option_picked "SubOption 1-5-1 Picked - Analyze - Not accessed more than 30 days";

	    find_old_30 $location $scriptlogPath/analyze_rm_old_30.log $scriptlogPath/cleanup_rm_old_30.log	    
	    show_analyze_log_content $scriptlogPath/analyze_rm_old_30.log;
	
            show_submenu_analyze_del_old_files opt;
            location=''
            if [ $opt != 'q' ] && [ $opt != '100' ]; then
	    	echo "enka"
		ReadLocation location;
 	    fi
            ;;

            2)
            clear;
            #option_picked "SubOption 1-5-2 Picked - Analyze - Not accessed more than 90 days";

	    find_old_90 $location $scriptlogPath/analyze_rm_old_90.log $scriptlogPath/cleanup_rm_old_90.log
            show_analyze_log_content $scriptlogPath/analyze_rm_old_90.log;

            show_submenu_analyze_del_old_files opt;
            location=''
            if [ $opt != 'q' ] && [ $opt != '100' ]; then
		echo "dvojka"
		ReadLocation location;
            fi
	    ;;

            3)
            clear;
            #option_picked "SubOption 1-5-3 Picked - Analyze - Not accessed more than 180 days";

	    find_old_180 $location $scriptlogPath/analyze_rm_old_180.log $scriptlogPath/cleanup_rm_old_180.log
            show_analyze_log_content $scriptlogPath/analyze_rm_old_180.log;

            show_submenu_analyze_del_old_files opt;
            location=''
	    if [ $opt != 'q' ] && [ $opt != '100' ]; then	
		echo "trojka"
                ReadLocation location;
	    fi
            ;;
             
	    4)
            clear;
            #option_picked "SubOption 1-5-4 Picked - Analyze - Not accessed more than 365 days";

	    find_old_365 $location $scriptlogPath/analyze_rm_old_365.log $scriptlogPath/cleanup_rm_old_365.log
            show_analyze_log_content $scriptlogPath/analyze_rm_old_365.log;

            show_submenu_analyze_del_old_files opt;
            location=''
	    if [ $opt != 'q' ] && [ $opt != '100' ]; then
		echo "stirka"
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

