#!/bin/bash
source show_menus.sh
source show_menus_cleanup.sh


cleanup_del_package_files(){
    while [ opt != '100' ]
        do
        if [[ $opt = 'q' ]]; then
            exit;
        else
            case $opt in

            1)
            clear;
            option_picked "SubOption 2-3-1 Picked  - Cleanup - Delete package - orphan";
            echo "Space on disk before cleanup" du -s /*
            package-cleanup --quiet --leaves --exclude-bin | xargs yum remove -y
            echo "Space on disk after cleanup" du -s /*
            show_submenu_cleanup_package;
            ;;

            2)
            clear;
            option_picked "SubOption 2-3-2 Picked  - Cleanup - Delete old package";
            echo "Space on disk before cleanup" du -s /*
            package-cleanup --oldkernels --count=2
            echo "Space on disk after cleanup" du -s /*

            show_submenu_cleanup_package;
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


