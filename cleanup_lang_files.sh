#!/bin/bash

cleanup_del_lang_files(){
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

