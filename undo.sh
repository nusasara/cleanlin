#!/bin/bash
source func_undo.sh
source undo_duplicate_files.sh
source undo_empty_files.sh
source undo_lang_files.sh
source undo_large_files.sh
source undo_old_files.sh
source undo_old_log_files.sh
source undo_temp_files.sh


submenu_undo(){
    while [ opt != '100' ]
        do
        if [[ $opt = 'q' ]]; then
            exit;
        else
            case $opt in

            1)
            clear;
            #option_picked "SubOption 3-1 Picked - Undo - Temporary files";
            show_submenu_undo_temp subopt;
	    undo_del_temp_files $subopt;
            ;;

            2)
            clear;
            #option_picked "SubOption 3-2 Picked - Undo - Old log files";
	    undo_del_old_log_files;
            show_submenu_undo;
            ;;

            4)
            # - Undo - Old files
            clear;
            show_submenu_undo_del_old_files subopt;
	    undo_del_old_files $subopt;
            ;;

            5)
            # - Undo - Empty files
            clear;
            undo_del_empty_files;
            show_submenu_undo;
            ;;

            6)
            # - Undo - Duplicate files
            clear;
	    undo_del_duplicate_files;
            show_submenu_undo;
            ;;

            8)
            clear;
            show_submenu_undo_del_large_files subopt;
            undo_del_large_files $subopt;
            ;;

            9)
	    # JA, NE ???
            # - Undo - Language packs
            #clear;
            #show_submenu_undo_lang;
            #submenu_undo_lang;
            ;;


            100)
            clear;
            #show_menu;
            break ;;

        esac
        fi
    done

}

