#!/bin/bash

submenu_cleanup_package(){
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


submenu_cleanup_old(){
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

            show_submenu_cleanup_del_old_files;
            ;;

            2)
            clear;
            option_picked "SubOption 4-2-2 Picked  - Cleanup - Not accessed more than 90 days";
            delete_or_move_to_trash '4' $opt

            show_submenu_cleanup_del_old_files;
            ;;

            3)
            clear;
            option_picked "SubOption 4-2-3 Picked  - Cleanup - Not accessed more than 180 days";
            delete_or_move_to_trash '4' $opt

            show_submenu_cleanup_del_old_files;
            ;;

            4)
            clear;
            option_picked "SubOption 4-2-4 Picked  - Cleanup - Not accessed more than 365 days";
            delete_or_move_to_trash '4' $opt

            show_submenu_cleanup_del_old_files;
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

submenu_cleanup_lang(){
    while [ opt != '100' ]
        do
        if [[ $opt = 'q' ]]; then
            exit;
        else
            case $opt in

            1)
            clear;
            option_picked "SubOption 2-9-1 Picked - Clean up -Choose languages to keep";
            echo "Available languages:"
            #locale -a | grep .utf8
            locale -a | grep ^[^.]*$

            echo "Type the languages you want to keep (comma seperated) followed by [ENTER]:"

            read LangToKeep

            LangToKeepNew="$(sed -e 's/,/|/g' <<<$LangToKeep)"
            echo 'popravljen: ' $LangToKeepNew

            echo 'Languages kept:'
            localedef --list-archive | egrep -i "$LangToKeepNew"
            read -rsp $'Press any key to continue...\n' -n1 key
            echo 'Languages removed:'
            localedef --list-archive | egrep -v -i "$LangToKeepNew" | more

            localedef --list-archive | egrep -v -i "$LangToKeepNew" | xargs localedef --delete-from-archive
            \cp -f /usr/lib/locale/locale-archive /usr/lib/locale/locale-archive.tmpl
            build-locale-archive

            show_submenu_cleanup_lang;
            ;;

            2)
            clear;
            option_picked "SubOption 2-9-2 Picked - Clean up - Choose languages to delete";
            echo "Available languages"
            #locale -a | grep .utf8
            locale -a | grep ^[^.]*$

            echo "Type the languages you want to delete (comma seperated) followed by [ENTER]:"

            read LangToKeep

            LangToKeepNew="$(sed -e 's/,/|/g' <<<$LangToKeep)"
            echo 'popravljen: ' $LangToKeepNew

            echo 'Languages kept:'
            localedef --list-archive | egrep -v -i "$LangToKeepNew"
            read -rsp $'Press any key to continue...\n' -n1 key
            echo 'Languages removed:'
            localedef --list-archive | egrep -i "$LangToKeepNew" | more

            localedef --list-archive | egrep -i "$LangToKeepNew" | xargs localedef --delete-from-archive
            \cp -f /usr/lib/locale/locale-archive /usr/lib/locale/locale-archive.tmpl
            build-locale-archive

            show_submenu_cleanup_lang;
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

delete_files () {
        local menu_id=$1;
        local submenu_id=$2;
        PassedFile=$3;
        local log_msg=$4;

        prefix=$scriptlogPath;
        sufix=".log"

        tmp_folder=${PassedFile#$prefix};
        tmp2_folder=${tmp_folder%$sufix};
        folder=${tmp2_folder#"/"};

        echo "TUKAJ"
        read Krneki2

        while read -r line
        do
            echo "1"
            echo "vrstica: $line"
            #read ena
            if [ -d "${line}" ]; then
                echo "$line is a directory being removed";
                move_to_trash_instead_delete $line $folder
                write_log_file "2" $menu_id $submenu_id "mv $line /tmp/trash/$folder"
            else
                if [ -f "${line}" ]; then
                        echo "${line} is a file being removed";
                        move_to_trash_instead_delete $line $folder
                        write_log_file "2" $menu_id $submenu_id "mv $line /tmp/trash/$folder"

                else
                        echo "${line} is not valid";
                        #exit 1
                fi
            fi
        done < "$PassedFile"


}

move_to_trash_instead_delete() {
        from=$1;        #
        local fldr=$2

        #tukaj pri mkdir moram preveriti, če je na koncu / in tudi na začetki fldr otem enega ven ...
        if [ ! -d "/tmp/trash/$fldr" ]; then
                # Control will enter here if $DIRECTORY doesn't exist.
                #mkdir /tmp/trash/$fldr
                mkdir -p /tmp/trash/$fldr
        fi

        #echo "mv $from /tmp/trash/$fldr"
        #mv $from /tmp/trash/$fldr
        echo "mv $from /tmp/trash/$fldr"
        mv $from /tmp/trash/$fldr

}

move_files () {
        local menu_id=$1;
        local submenu_id=$2;
        PassedFile=$3;
        local log_msg=$4;
        local desired_folder=$5;
        if [ ! -d "/tmp/trash/" ]; then
                # Control will enter here if $DIRECTORY doesn't exist.
                mkdir /tmp/trash
        fi


        PassedFile=$1;

        tmp_folder=${PassedFile#$prefix};
        tmp2_folder=${tmp_folder%$sufix};
        folder=${tmp2_folder#"/"};

        while read -r line
        do

            if [ -d "${line}" ] ; then
                echo "$line is a directory being removed";
                move_to_folder $line $folder $desired_folder
            else
                if [ -f "${line}" ]; then
                        echo "${line} is a file being removed";
                        move_to_folder $line $folder $desired_folder
                else
                        echo "${line} is not valid";
                        #exit 1
                fi
            fi
        done < "$PassedFile"

}

delete_or_move_to_trash() {
        Argument1=$1    #main menu id
        Argument2=$2    #sub menu id

        echo "Arg1: $Argument1; Arg2: $Argument2"
        case $Argument1 in

                1)
                        echo "Type 1 for permanent delete or 2 for move to /tmp/trash followed by [ENTER]:"
                        read DeleteOrMove
                        echo "Arg1: $Argument1; Arg2: $Argument2; Delete1OrMove2: $DeleteOrMove"

                        echo "DA VIDIMO, ČE PRIDEM DO SEM"
                        read Krneki

                        if [[ $DeleteOrMove != '1' ]]; then
                                echo "Type in desired folder where you want files to be moved [ENTER]:"
                                read MoveFolder
                        fi

                        case $Argument2 in
                                1)
                                if [[ $DeleteOrMove = '1' ]]; then
                                        delete_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_tmp_flash_macromedia.log" "Delete - Flash, Macromediaobjects;"
                                else
                                        move_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_tmp_flash_macromedia.log" "Move - Flash, Macromediaobjects;" $MoveFolder
                                fi
                                ;;

                                2)
                                if [[ $DeleteOrMove = '1' ]]; then
                                        delete_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_tmp_all.log" "Delete - temporary files;"
                                else
                                        move_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_tmp_all.log" "Move - temporary files;"
                                fi
                                ;;

                        esac
                        exit
                        ;;

                2)
                        echo "Type 1 for permanent delete or 2 for move to /tmp/trash followed by [ENTER]:"
                        read DeleteOrMove
                        echo "Arg1: $Argument1; Arg2: $Argument2; Delete1OrMove2: $DeleteOrMove"

                        if [[ $DeleteOrMove = '1' ]]; then
                                delete_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_old_log.log" "Delete - old log files;"
                        else
                                move_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_old_log.log" "Move - old log files;"
                        fi

                        case $Argument2 in
                                1)
                                if [[ $DeleteOrMove = '1' ]]; then
                                        delete_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_old_30.log" "Delete - old files 30 days;"
                                else
                                        move_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_old_30.log" "Move - old files 30 days;"
                                fi
                                ;;

                                2)
                                if [[ $DeleteOrMove = '1' ]]; then
                                        delete_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_old_90.log" "Delete - old files 90 days;"
                                else
                                        move_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_old_90.log" "Move - old files 90 days;"
                                fi
                                ;;

                                3)
                                if [[ $DeleteOrMove = '1' ]]; then
                                        delete_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_old_180.log" "Delete - old files 180 days;"
                                else
                                        move_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_old_180.log" "Move - old files 180 days;"
                                fi
                                ;;

                                4)
                                if [[ $DeleteOrMove = '1' ]]; then
                                        delete_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_old_365.log" "Delete - old files 365 days;"
                                else
                                        move_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_old_365.log" "Move - old files 365 days;"
                                fi
                                ;;


                        esac
                        ;;

                5)
                        echo "Type 1 for permanent delete or 2 for move to /tmp/trash followed by [ENTER]:"
                        read DeleteOrMove
                        echo "Arg1: $Argument1; Arg2: $Argument2; Delete1OrMove2: $DeleteOrMove"

                        if [[ $DeleteOrMove = '1' ]]; then
                                delete_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_empty.log" "Delete - empty files;"
                        else
                                move_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_empty.log" "Move - empty files;"
                        fi

                        ;;

                6)
                        echo "Type 1 for permanent delete or 2 for move to /tmp/trash followed by [ENTER]:"
                        read DeleteOrMove
                        echo "Arg1: $Argument1; Arg2: $Argument2; Delete1OrMove2: $DeleteOrMove"

                        if [[ $DeleteOrMove = '1' ]]; then
                                delete_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_duplicate.log" "Delete - duplicate files;"
                        else
                                move_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_duplicate.log"rgument1 $Argument2 "Move - duplicate files;"
                        fi

                        ;;

                8)
                        echo "Type 1 for permanent delete or 2 for move to /tmp/trash followed by [ENTER]:"
                        read DeleteOrMove
                        echo "Arg1: $Argument1; Arg2: $Argument2; Delete1OrMove2: $DeleteOrMove"

                        if [[ $DeleteOrMove = '1' ]]; then
                                delete_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_large_files.log" "Delete - large files;"
                        else
                                move_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_large_files.log"rgument1 $Argument2 "Move - large files;"
                        fi

                        ;;

                11)
                        undo_files "$scriptlogPath/cleanup_rm_duplicate.log"


                        ;;
        esac

}
