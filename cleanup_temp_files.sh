#!/bin/bash
source func.sh
source func_cleanup.sh
source show_menus_cleanup.sh

cleanup_del_temp_files(){
    opt=$1
    while [ opt != '100' ]
        do
        if [[ $opt = 'q' ]]; then
            exit;
        else
            case $opt in

            1)
            clear;
            option_picked "SubOption 1-2-2 Picked  - Cleanup - Delete Temp - Flash, Macromedia";
            delete_or_move_to_trash '1' $opt

            show_submenu_cleanup_temp opt;
            ;;

            2)
            clear;
            option_picked "SubOption 1-2-3 Picked  - Cleanup - Delete Temp - Whole disk";
            delete_or_move_to_trash '1' $opt

            show_submenu_cleanup_temp opt;
            ;;

            100)
            clear;
            show_submenu_cleanup;
            break ;;


            #*)clear;
            #option_picked "Pick an option from the menu";
            #show_submenu_del_old_files;
            #;;

        esac
        fi
    done

}

