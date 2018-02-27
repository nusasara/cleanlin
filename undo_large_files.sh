#!/bin/bash
source func.sh
source func_undo.sh
source show_menus.sh
source show_menus_undo.sh

undo_del_large_files(){
    opt=$1
    echo "undo_del_large_files; opt: $opt; "
    while [ opt != '100' ]
        do
        if [[ $opt = 'q' ]]; then
            exit;
        else
            case $opt in

            1)
            clear;
            option_picked "Undo - Large Files";
            undo_files "$scriptlogPath/cleanup_rm_large_files.log" "Undo - large files;"
            show_submenu_undo_del_large_files opt;
            ;;

            2)
            clear;
            option_picked "Undo - Large Folders";
	    undo_files "$scriptlogPath/cleanup_rm_large_folders.log" "Undo - large folders;"
            show_submenu_undo_del_large_files opt;
            ;;

            3)
            clear;
            option_picked "Undo - Large Files and Folders";
	    undo_files "$scriptlogPath/cleanup_rm_large_files_folders.log" "Undo - large files and folders;"
            show_submenu_undo_del_large_files opt;
            ;;

            100)
            clear;
            show_submenu_undo;
            break ;;


        esac
        fi
    done

}

