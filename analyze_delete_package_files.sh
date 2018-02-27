#!/bin/bash
source show_menus_analyze.sh
source read_input.sh
source func.sh
source display_analyze_file.sh

analyze_del_package_files() {
    opt=$2;
    while [ opt != '100' ]
        do
        if [[ $opt = 'q' ]]; then
            exit;
        else
            case $opt in

            1)
            clear;
            option_picked "SubOption 1-4-1 Picked  - Analyze - Delete package - orphan";
            
	    find_orphan_packages $scriptlogPath/analyze_rm_package_oprhan.log;
            show_analyze_log_content $scriptlogPath/analyze_rm_package_oprhan.log;

	    show_submenu_analyze_del_package opt;
            ;;

            2)
            clear;
            option_picked "SubOption 1-4-2 Picked  - Analyze - Delete package - ";
            #show_submenu_analyze;
            #show_submenu_analyze;
	    find_old_kernels $scriptlogPath/analyze_rm_package_old_kernels.log;
	    show_analyze_log_content $scriptlogPath/analyze_rm_package_old_kernels.log;

            show_submenu_analyze_del_package opt;
            ;;

            100)
            clear;
            show_submenu_analyze;
            break ;;


            #*)clear;
            #option_picked "Pick an option from the menu";
            #show_submenu_del_old_files;
            #;;

        esac
        fi
    done

}

