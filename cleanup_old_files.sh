#!/bin/bash
source func.sh
source func_cleanup.sh
source show_menus.sh
source show_menus_cleanup.sh

cleanup_del_old_files(){
    opt=$1
    while [ opt != '100' ]
        do
        if [[ $opt = 'q' ]]; then
            exit;
        else
            case $opt in

            1)
            clear;
            option_picked "SubOption 4-2-1 Picked - Cleanup - Not accessed more than 30 days";
            delete_or_move_to_trash '4' $opt

            show_submenu_cleanup_del_old_files opt;
            ;;

            2)
            clear;
            option_picked "SubOption 4-2-2 Picked  - Cleanup - Not accessed more than 90 days";
            delete_or_move_to_trash '4' $opt

            show_submenu_cleanup_del_old_files opt;
            ;;

            3)
            clear;
            option_picked "SubOption 4-2-3 Picked  - Cleanup - Not accessed more than 180 days";
            delete_or_move_to_trash '4' $opt

            show_submenu_cleanup_del_old_files opt;
            ;;

            4)
            clear;
            option_picked "SubOption 4-2-4 Picked  - Cleanup - Not accessed more than 365 days";
            delete_or_move_to_trash '4' $opt

            show_submenu_cleanup_del_old_files opt;
            ;;

            100)
            clear;
            show_submenu_cleanup;
            break ;;


        esac
        fi
    done

}

