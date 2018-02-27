#!/bin/bash
#source func_analyze.sh

read_file() {
        vhod=$1;
        sporocilo=$2;

        #preberemo število vrstic
        var=$(wc -l $vhod)
        st_vrstic=${var%% *}

        #potem pa se sprehodimo cez vse in sestejemo velikosti datotek
        human=$(cat $input | xargs -d \\n du -h 2>/dev/null | awk '{total+=$1} END{print total}')
        
	#oblika izpisa
	fmt="%-50s%-12s%-12s\n"
        printf "$fmt" "$sporocilo" "$st_vrstic" "$human"

	printf "$fmt" "$sporocilo" "$st_vrstic" "$human" >> $logPath/report.log
}


submenu_report(){

        logPath=$1

	fmt_report="%-50s%-12s%-12s\n"
        printf "$fmt_report" ACTION NUM_FILES SIZE_MB > $logPath/report.log
	printf "$fmt" ACTION NUM_FILES SIZE_MB

        #grem cez vse cleanup .... log fajle in ce obstaja in ni prazen preštejem vrstice in potem za vsako pogledam koliko je velika in prištejem in izišem:
        # Temporary files - Flash, Macromediaobjects: XXX file;  XXX.XXX,XX MB

        input="$logPath/cleanup_rm_tmp_flash_macromedia.log"
        msg="Temporary files - Flash, Macromediaobjects:"
        if [ -f $input ]; then
                if [[ $(wc -l <"$input") -gt 0 ]];then
                        read_file "$input" "$msg"
                fi
        fi
	
        input="$logPath/cleanup_rm_tmp_all.log"
        msg="Temporary files - Desired folder:"
        if [ -f $input ]; then
                if [[ $(wc -l <"$input") -gt 0 ]];then
                        read_file "$input" "$msg"
                fi
        fi

        input="$logPath/cleanup_rm_old_log.log"
        msg="Old log files:"
        if [ -f $input ]; then
                if [[ $(wc -l <"$input") -gt 0 ]];then
                        read_file "$input" "$msg"
                fi
        fi

        input="$logPath/cleanup_rm_old_30.log"
        msg="Older than 30 days:"
        if [ -f $input ]; then
                if [[ $(wc -l <"$input") -gt 0 ]];then
                        read_file "$input" "$msg"
                fi
        fi

        input="$logPath/cleanup_rm_old_90.log"
        msg="Older than 90 days:"
        if [ -f $input ]; then
                if [[ $(wc -l <"$input") -gt 0 ]];then
                        read_file "$input" "$msg"
                fi
        fi

        input="$logPath/cleanup_rm_old_180.log"
        msg="Older than 180 days:"
        if [ -f $input ]; then
                if [[ $(wc -l <"$input") -gt 0 ]];then
                        read_file "$input" "$msg"
                fi
        fi

        input="$logPath/cleanup_rm_old_365.log"
        msg="Older than 365 days:"
        if [ -f $input ]; then
                if [[ $(wc -l <"$input") -gt 0 ]];then
                        read_file "$input" "$msg"
                fi
        fi

        input="$logPath/cleanup_rm_empty.log"
        msg="Empty files:"
        if [ -f $input ]; then
                if [[ $(wc -l <"$input") -gt 0 ]];then
                        read_file "$input" "$msg"
                fi
        fi

        input="$logPath/cleanup_rm_duplicate.log"
        msg="Duplicate files:"
        if [ -f $input ]; then
                if [[ $(wc -l <"$input") -gt 0 ]];then
                        read_file "$input" "$msg"
                fi
        fi

        input="$logPath/cleanup_rm_yum_cache.log"
        msg="Yum cache:"
        if [ -f $input ]; then
                if [[ $(wc -l <"$input") -gt 0 ]];then
                        read_file "$input" "$msg"
                fi
        fi

        input="$logPath/cleanup_rm_large_files.log"
        msg="Large files:"
        if [ -f $input ]; then
                if [[ $(wc -l <"$input") -gt 0 ]];then
                        read_file "$input" "$msg"
                fi
        fi

        input="$logPath/cleanup_rm_large_folders.log"
        msg="Large folders:"
        if [ -f $input ]; then
                if [[ $(wc -l <"$input") -gt 0 ]];then
                        read_file "$input" "$msg"
                fi
        fi

        input="$logPath/cleanup_rm_large_files_folders.log"
        msg="Large files and folders:"
        if [ -f $input ]; then
                if [[ $(wc -l <"$input") -gt 0 ]];then
                        read_file "$input" "$msg"
                fi
        fi


}

