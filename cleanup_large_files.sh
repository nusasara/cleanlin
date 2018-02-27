#!/bin/bash
source func.sh
source func_cleanup.sh
source show_menus.sh
source show_menus_cleanup.sh

cleanup_del_large_files(){
    opt=$1
    while [ opt != '100' ]
        do
        if [[ $opt = 'q' ]]; then
            exit;
        else
            case $opt in

            1)
            clear;
            option_picked "SubOption 8-2-1 Picked - Cleanup - Large Files";
            delete_or_move_to_trash '8' $opt

            show_submenu_cleanup_del_large_files opt;
            ;;

            2)
            clear;
            option_picked "SubOption 8-2-2 Picked  - Cleanup - Large Folders";
            delete_or_move_to_trash '8' $opt

            show_submenu_cleanup_del_large_files opt;
            ;;

            3)
            clear;
            option_picked "SubOption 8-2-3 Picked  - Cleanup - Large Files and Folders";
            delete_or_move_to_trash '8' $opt

            show_submenu_cleanup_del_large_files opt;
            ;;

            100)
            clear;
            show_submenu_cleanup;
            break ;;


        esac
        fi
    done

}

