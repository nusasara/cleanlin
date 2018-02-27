#!/bin/bash
source func.sh
source func_undo.sh

undo_del_temp_files(){
    opt=$1
    while [ opt != '100' ]
        do
        if [[ $opt = 'q' ]]; then
            exit;
        else
            case $opt in

            1)
            clear;
            option_picked "Undo - Delete Temp - Flash, Macromedia";
	    undo_files "$scriptlogPath/cleanup_rm_tmp_flash_macromedia.log" "Undo Flash Macromedia objects"

            show_submenu_undo_temp opt;
            ;;

            2)
            clear;
            option_picked "Undo - Delete Temp - Desired folder";
	    undo_files "$scriptlogPath/cleanup_rm_tmp_all.log" "Undo temporary files"

            show_submenu_undo_temp opt;
            ;;

            100)
            clear;
            show_submenu_undo;
            break ;;

        esac
        fi
    done

}

