#!/bin/bash
source func.sh

undo () {
        log_file=$1;    # $scriptlogPath/cleanup_rm_tmp_home.log
        from=$2;        #
	local log_msg=$3;
        prefix=$scriptlogPath;
        sufix=".log"

        tmp_folder=${log_file#$prefix};
        tmp2_folder=${tmp_folder%$sufix};
        folder=${tmp2_folder#"/"};

        #from moram razbiti na fajl in pot, da potem fajlm dodam na levo stran pri cp, folder pa na desno ...
        ime_fajla=$(echo $from | sed 's:.*/::')
        echo 'ime fajla:' $ime_fajla

        pot_fajla=${from%$ime_fajla}
        echo 'pot_fajla' $pot_fajla

        #if [ ! -d "/tmp/trash/$folder" ]; then
                # Control will enter here if $DIRECTORY doesn't exist.
        #        mkdir /tmp/trash/$folder
        #fi

        #echo "mv $from /tmp/trash/$folder"
        #echo cp -a /tmp/trash/$folder/$ime_fajla $from
        #cp -a /tmp/trash/$folder/$ime_fajla $from

        if [ ! -d "$pot_fajla" ]; then
                mkdir -p "$pot_fajla"
        fi

        echo cp -a /tmp/trash/$folder/$ime_fajla $from
        cp -a /tmp/trash/$folder/$ime_fajla $from

	write_log_file "cp -a /tmp/trash/$folder/$ime_fajla $from" "$log_msg"
}

undo_files () {
        PassedFile=$1;
	local log_msg=$2;

        while read -r line
        do
            	echo "undo Passed file" $PassedFile "; line:"  $line
            	undo "$PassedFile"  "$line" "$log_msg"
        done < "$PassedFile"

}

undo_all () {
        Argument1=$1    #main menu id
        Argument2=$2    #sub menu id

        echo "Arg1: $Argument1; Arg2: $Argument2"
        case $Argument1 in


        6)
        	undo_files "$scriptlogPath/cleanup_rm_duplicate.log"

               	;;

    	8)
        	echo 'se pride'

       		;;

        esac;

}

