#!/bin/bash
source func.sh

delete_files () {
        local menu_id=$1;
        local submenu_id=$2;
        PassedFile=$3;
        local lmsg=$4;

        prefix=$scriptlogPath;
        sufix=".log"

        tmp_folder=${PassedFile#$prefix};
        tmp2_folder=${tmp_folder%$sufix};
        folder=${tmp2_folder#"/"};

        #hile read -r line;
	while read line
        do
            echo "1"
            echo "vrstica: $line"
            if [ -d "${line}" ]; then
                echo "$line is a directory being removed";
                move_to_trash_instead_delete $line $folder
                write_log_file "mv $line /tmp/trash/$folder" "$lmsg"
            else
                if [ -f "${line}" ]; then
                        echo "${line} is a file being removed";
                        move_to_trash_instead_delete $line $folder
		
			echo "pred pisanjem v log fajl:" $lmsg
                        write_log_file "mv $line /tmp/trash/$folder" "$lmsg"

                else
                        echo "${line} is not valid";
                        #exit 1
                fi
            fi
        done < $PassedFile


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
        if [ ! -d "$desired_folder" ]; then
                # Control will enter here if $DIRECTORY doesn't exist.
                mkdir -p $desired_folder
        fi

	prefix=$scriptlogPath;
        sufix=".log"

        tmp_folder=${PassedFile#$prefix};
        tmp2_folder=${tmp_folder%$sufix};
        folder=${tmp2_folder#"/"};

        #while read -r line
	while read line
        do
	    echo "$line"
            if [ -d "${line}" ] ; then
                echo "$line is a directory being removed";
                move_to_folder $line $folder $desired_folder "$log_msg"
            else
                if [ -f "${line}" ]; then
                        echo "${line} is a file being removed";
                        move_to_folder $line $folder $desired_folder "$log_msg"
                else
                        echo "${line} is not valid";
                        #exit 1
                fi
            fi
        done < $PassedFile

}

delete_or_move_to_trash() {
        Argument1=$1    #main menu id
        Argument2=$2    #sub menu id

        case $Argument1 in

                1)
                        echo "Type 1 for permanent delete or 2 for move to /tmp/trash followed by [ENTER]:"
                        read DeleteOrMove


                        if [[ $DeleteOrMove != '1' ]]; then
                                echo "Type in desired folder where you want files to be moved [ENTER]:"
                                read MoveFolder
                        fi

                        case $Argument2 in
                                1)
                                if [[ $DeleteOrMove = '1' ]]; then
                                        delete_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_tmp_flash_macromedia.log" "Delete Flash Macromedia objects;"
                                else
                                        move_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_tmp_flash_macromedia.log" "Move Flash Macromedia objects;" $MoveFolder
                                fi
                                ;;

                                2)
                                if [[ $DeleteOrMove = '1' ]]; then
                                        delete_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_tmp_all.log" "Delete temporary files;"
                                else
                                        move_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_tmp_all.log" "Move temporary files;" $MoveFolder
                                fi
                                ;;

                        esac
                        #exit
                        ;;

                2)
                        echo "Type 1 for permanent delete or 2 for move to /tmp/trash followed by [ENTER]:"
                        read DeleteOrMove

                        if [[ $DeleteOrMove = '1' ]]; then
				echo delete_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_old_log.log" "Delete - old log files;"
                                delete_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_old_log.log" "Delete - old log files;"
                        else
                                move_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_old_log.log" "Move - old log files;"  $MoveFolder
                        fi

                        ;;

                4)
                        echo "Type 1 for permanent delete or 2 for move to /tmp/trash followed by [ENTER]:"
                        read DeleteOrMove

                        case $Argument2 in
                                1)
                                if [[ $DeleteOrMove = '1' ]]; then
                                        delete_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_old_30.log" "Delete - old files 30 days;"
                                else
                                        move_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_old_30.log" "Move - old files 30 days;" $MoveFolder
                                fi
                                ;;

                                2)
                                if [[ $DeleteOrMove = '1' ]]; then
                                        delete_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_old_90.log" "Delete - old files 90 days;"
                                else
                                        move_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_old_90.log" "Move - old files 90 days;" $MoveFolder
                                fi
                                ;;

                                3)
                                if [[ $DeleteOrMove = '1' ]]; then
                                        delete_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_old_180.log" "Delete - old files 180 days;"
                                else
                                        move_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_old_180.log" "Move - old files 180 days;" $MoveFolder
                                fi
                                ;;

                                4)
                                if [[ $DeleteOrMove = '1' ]]; then
                                        delete_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_old_365.log" "Delete - old files 365 days;"
                                else
                                        move_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_old_365.log" "Move - old files 365 days;" $MoveFolder
                                fi
                                ;;


                        esac
                        ;;

                5)
                        echo "Type 1 for permanent delete or 2 for move to /tmp/trash followed by [ENTER]:"
                        read DeleteOrMove

                        if [[ $DeleteOrMove = '1' ]]; then
                                delete_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_empty.log" "Delete - empty files;"
                        else
                                move_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_empty.log" "Move - empty files;" $MoveFolder
                        fi

                        ;;

                6)
                        echo "Type 1 for permanent delete or 2 for move to /tmp/trash followed by [ENTER]:"
                        read DeleteOrMove

                        if [[ $DeleteOrMove = '1' ]]; then
                                delete_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_duplicate.log" "Delete - duplicate files;"
                        else
                                move_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_duplicate.log" "Move - duplicate files;" $MoveFolder
                        fi

                        ;;

		7)
                        echo "Type 1 for permanent delete or 2 for move to /tmp/trash followed by [ENTER]:"
                        read DeleteOrMove

                        if [[ $DeleteOrMove = '1' ]]; then
                                delete_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_yum_cache.log" "Delete - yum cache files;"
                        else
                                move_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_yum_cache.log" "Move - yum cache files;" $MoveFolder
                        fi

                        ;;
			

                8)
                        echo "Type 1 for permanent delete or 2 for move to /tmp/trash followed by [ENTER]:"
                        read DeleteOrMove

			case $Argument2 in
                                1)
	                        if [[ $DeleteOrMove = '1' ]]; then
        	                        delete_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_large_files.log" "Delete - large files;"
                	        else
                        	        move_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_large_files.log" "Move - large files;" $MoveFolder
                        	fi
				;;

				2)
                                if [[ $DeleteOrMove = '1' ]]; then
                                        delete_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_large_folders.log" "Delete - large folders;"
                                else
                                        move_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_large_folders.log" "Move - large folders;" $MoveFolder
                                fi
                                ;;

				3)
                                if [[ $DeleteOrMove = '1' ]]; then
                                        delete_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_large_files_folders.log" "Delete - large files and folders;"
                                else
                                        move_files $Argument1 $Argument2 "$scriptlogPath/cleanup_rm_large_files_folders.log" "Move - large files and folders;" $MoveFolder
                                fi
                                ;;

                        esac
                        ;;

                11)
                        undo_files "$scriptlogPath/cleanup_rm_duplicate.log"


                        ;;
        esac

}
