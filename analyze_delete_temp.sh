#!/bin/bash
source func.sh

analyze_del_temp_files(){
    opt=$2;
    while [ opt != '100' ]
        do
        if [[ $opt = 'q' ]]; then
            exit;
        else
            case $opt in

            1)
            clear;
            option_picked "SubOption 1-2-1 Picked  - Analyze - Delete Temp - Flash, Macromedia";
	    local location=''
            ReadLocation location;

            find_tmp_flash_macromedia $location $scriptlogPath/analyze_rm_tmp_flash_macromedia.log $scriptlogPath/cleanup_rm_tmp_flash_macromedia.log
            show_analyze_log_content $scriptlogPath/analyze_rm_tmp_flash_macromedia.log;

            show_submenu_analyze_del_temp_files opt;
            ;;

            2)
            clear;
            option_picked "SubOption 1-2-2 Picked  - Analyze - Delete Temp - Desired folder";
	    local location=''
            ReadLocation location;

            find_tmp_all $location $scriptlogPath/analyze_rm_tmp_all.log $scriptlogPath/cleanup_rm_tmp_all.log
            show_analyze_log_content $scriptlogPath/analyze_rm_tmp_all.log;

            show_submenu_analyze_del_temp_files opt;

            ;;

            100)
            clear;
            show_submenu_analyze;
            break ;;

        esac
        fi
    done

}
