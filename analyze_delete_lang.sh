#!/bin/bash
source show_menus_analyze.sh
source read_input.sh
source func.sh
source display_analyze_file.sh

analyze_del_lang(){
    opt=$2;

    while [ opt != '100' ]
        do
        if [[ $opt = 'q' ]]; then
            exit;
        else
            case $opt in

            1)
            clear;
            option_picked "SubOption 1-9-1 Picked  - Analyze - Show current language";
            
	    find_curr_lang $scriptlogPath/analyze_curr_lang.log $scriptlogPath/cleanup_curr_lang.log
	    show_analyze_log_content $scriptlogPath/analyze_curr_lang.log;            

	    show_submenu_analyze_lang opt;

            ;;

            2)
            clear;
            option_picked "SubOption 1-9-2 Picked  - Analyze - Show all installed languages";
            find_installed_lang $scriptlogPath/analyze_installed_lang.log $scriptlogPath/cleanup_installed_lang.log
	    show_analyze_log_content $scriptlogPath/analyze_installed_lang.log;           
 
	    show_submenu_analyze_lang opt;
            ;;

            100)
            clear;
            show_submenu_analyze;
            break ;;


        esac
        fi
    done
}

