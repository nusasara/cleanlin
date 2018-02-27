#!/bin/bash
source func_analyze.sh

submenu_analyze(){
    while [ opt != '100' ]
        do
        if [[ $opt = 'q' ]]; then
            exit;
        else
            case $opt in

            #1)
            #clear;
            #option_picked "SubOption 1-1 Picked - Analyze - Print OS Type";
            #cat /etc*/*release | grep PRETTY_NAME
            #show_submenu_analyze;
            #;;

            1)
            clear;
            option_picked "SubOption 1-1 Picked - Analyze - Temporary files";
            show_submenu_analyze_del_temp_files subopt;
	    if [[ $subopt = "100" ]]; then
                break;
            fi
 	    analyze_del_temp_files return $subopt;
            ;;

            2)
            clear;
            #option_picked "SubOption 1-2 Picked - Analyze - Old log files";

            analyze_del_old_log_files return $opt;

            #show_submenu_analyze;
            ;;

            3)
            clear;
            #option_picked "SubOption 1-3 Picked - Analyze - Packages";
            show_submenu_analyze_del_package opt;

            analyze_del_package_files return $opt;
            ;;

            4)
            # - Analyze - Old files
            clear;
	    echo "vhod v 4"
            show_submenu_analyze_del_old_files subopt;
            if [[ $subopt = "100" ]]; then
		break;
	    fi
	    locat=''
            ReadLocation locat;
            analyze_del_old_files return $locat $subopt;
            ;;

            5)
            clear;
            #option_picked "SubOption 1-2 Picked - Analyze - Empty files";

            analyze_del_empty_files return $opt;
            ;;


            6)

            clear;
            #option_picked "SubOption 1-6 Picked - Analyze - Duplicat files";

            analyze_del_duplicate_files return $opt;
            ;;

	    7)
            clear;
            #option_picked "SubOption 1-7 Picked - Analyze - Yum cache";

            analyze_del_yum_cache return $opt;
	    ;;
	
            8)
            #  - Analyze - Large files
	    clear;
            echo "vhod v 8"
            show_submenu_analyze_del_large_files subopt;
            if [[ $subopt = "100" ]]; then
                break;
            fi
            locat=''
            ReadLocation locat;
            analyze_del_large_files return $locat $subopt;
            ;;


            9)
            #  - Analyze - Language packs
            clear;
            option_picked "SubOption 9 Picked - Analyze - Language files";

            show_submenu_analyze_lang opt;
		

	    analyze_del_lang return $opt;

            ;;

            100)
            clear;
            #show_menu;
            break ;;

        esac
        fi
    done

}

