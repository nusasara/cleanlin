#!/bin/bash
source func_cleanup.sh
source cleanup_old_log_files.sh
source cleanup_temp_files.sh
source cleanup_old_files.sh
source cleanup_empty_files.sh
source cleanup_duplicate_files.sh
source cleanup_large_files.sh
source cleanup_yum_cache_files.sh
source cleanup_lang_files.sh
source cleanup_packege_files.sh

submenu_cleanup(){
    while [ opt != '100' ]
        do
        if [[ $opt = 'q' ]]; then
            exit;
        else
            case $opt in

            #1)
            #clear;
            ##option_picked "SubOption 2-1 Picked - Cleanup - OS Type";
            #cat /etc*/*release | grep PRETTY_NAME
            #show_submenu_cleanup;
            #;;

            1)
            clear;
            #option_picked "SubOption 2-1 Picked - Cleanup - Temporary files";
	    show_submenu_cleanup_temp subopt;
	    cleanup_del_temp_files $subopt;
            ;;

            2)
	    clear;
	    #option_picked "SubOption 2-2 Picked - Cleanup - Old log files"
            cleanup_del_old_log_files;
	    ;;

            3)
            clear;
            #option_picked "SubOption 2-3 Picked - Cleanup - Packages";
            show_submenu_cleanup_package opt;
	    cleanup_del_package_files return $opt;
            ;;

            4)
            # - Cleanup - Old files
            clear;
            show_submenu_cleanup_del_old_files subopt;
            #submenu_cleanup_old;
	    cleanup_del_old_files $opt;
            ;;

            5)
            # - Cleanup - Empty files
            clear;
	    cleanup_del_empty_files;

            ;;

            6)
            # - Cleanup - Duplicate files
            clear;
	    cleanup_del_duplicate_files;
            ;;

            7)
            # - Cleanup - Yum cache
            clear;
            cleanup_del_yum_cache_files;

            ;;

            8)
            # - Cleanup - Large files
            clear;
            show_submenu_cleanup_del_large_files subopt;
            cleanup_del_large_files $opt;
            ;;

	    9)
            # - Cleanup - Language packs
            clear;
            show_submenu_cleanup_lang;
            cleanup_del_lang_files;
            ;;

            11)
            # - Undo - Duplicate files TEST
            clear;

            delete_or_move_to_trash $opt
            show_submenu_cleanup;
            ;;

            100)
            clear;
            #show_menu;
            break ;;

        esac
        fi
    done

}

