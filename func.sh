#!/bin/bash

write_log_file() {
        local operation_str=$1;
	local lmessage=$2;

        echo -n "$(date);" >> "/deniso/scripts/log/log_file"

	echo -n $lmessage >> "/deniso/scripts/log/log_file"

	echo "$operation_str" >> "/deniso/scripts/log/log_file"
}

move_to_folder () {
        local from=$1;  #
        local fldr=$2;
        local dest=$3;
	local lmsg=$4;
        prefix=$scriptlogPath;
        sufix=".log"

        if [ ! -d $dest/$fldr ]; then
                # Control will enter here if $DIRECTORY doesn't exist.
                mkdir $dest/$fldr
        fi

        #echo "mv $from /tmp/trash/$fldr"
        mv $from $dest/$fldr

	write_log_file "mv $from $dest/$fldr" "$lmsg"

}

