#!/bin/bash
source analyze_delete_temp.sh
source analyze_delete_old_log_files.sh
source analyze_delete_package_files.sh
source analyze_delete_old_files.sh
source analyze_delete_empty_files.sh
source analyze_delete_duplicate_files.sh
source analyze_delete_yum_cache.sh
source analyze_delete_large_files.sh
source analyze_delete_lang.sh


find_tmp_flash_macromedia() {
        search_path=$1;
        log_file_path=$2;
        cleanup_file_path=$3;
        lines=$(find $search_path/.macromedia/* $search_path/.adobe/* -type f | wc -l)
        if [ $lines -eq 0 ]; then
                echo "Nothing to delete"
                echo "" > $log_file_path
                echo "" > $cleanup_file_path
        else
                find $search_path/.macromedia/* $search_path/.adobe/* -type f | xargs du -c > $scriptlogPath/analyze_rm_tmp_flash_macromedia.log
                find $search_path/.macromedia/* $search_path/.adobe/* -type f -printf "%p\n" > $scriptlogPath/cleanup_rm_tmp_flash_macromedia.log
        fi
        write_log_file "find $search_path/.macromedia/* $search_path/.adobe/* -type f | xargs du -c" "Analyze - Flash, Macromediaobjects;"
}

find_tmp_all() {
        search_path=$1;
        log_file_path=$2;
        cleanup_file_path=$3;
        lines=$(find $search_path -type f -name "*~" | wc -l)
        if [ $lines -eq 0 ]; then
                echo "Nothing to delete"
                echo "" > $log_file_path
                echo "" > $cleanup_file_path
        else
                find $search_path -type f -name "*~" | xargs du -c > $scriptlogPath/analyze_rm_tmp_all.log
                find $search_path -type f -name "*~" -printf "%p\n" > $scriptlogPath/cleanup_rm_tmp_all.log
        fi
        write_log_file "find $search_path -type f -name "*~"" "Analyze - temporary files;"
}

find_old_log() {
        #search_path=$1;
        log_file_path=$1;
        cleanup_file_path=$2;
        lines=$(find /var/log/*.gz -type f -print | wc -l)
        echo "lines: $lines"
        if [ $lines -eq 0 ]; then
                echo "Nothing to delete"
                echo "" > $log_file_path
                echo "" > $cleanup_file_path
        else
                find /var/log/*.gz -type f -print | xargs du -c > $log_file_path
                find /var/log/*.gz -type f -printf "%p\n" > $cleanup_file_path
        fi
        write_log_file "find /var/log/*.gz -type f -print" "Analyze - old log files;"
}

find_orphan_packages() {
        #search_path=$1;
        log_file_path=$1;
        #cleanup_file_path=$3;
        lines=$(package-cleanup --quiet --leaves --exclude-bin | wc -l)
        echo "lines: $lines"
        if [ $lines -eq 0 ]; then
                echo "Nothing to delete"
                echo "" > $log_file_path
                #echo "" > $cleanup_file_path
        else
                package-cleanup --quiet --leaves --exclude-bin > $log_file_path;  #$scriptlogPath/analyze_rm_package_oprhan.sh;
        fi
        write_log_file "package-cleanup --quiet --leaves --exclude-bin" "Analyze - oprhan packages;"
}

find_old_kernels() {
        log_file_path=$1;
        lines=$(rpm -qa kernel | wc -l)
        echo "lines: $lines"
        if [ $lines -eq 0 ]; then
                echo "Nothing to delete"
                echo "" > $log_file_path
        else
		echo "Current kernel:" > $log_file_path; 
		uname -r >> $log_file_path;
		echo "All installed kernels:" >> $log_file_path;
                rpm -qa kernel >> $log_file_path;  
        fi
        write_log_file "rpm -qa kernel" "Analyze - All installed kernels;"
}


find_old_30() {
        search_path=$1;
        log_file_path=$2;
        cleanup_file_path=$3;
        lines=$(find $search_path -mtime +30 -type f | wc -l)
        if [ $lines -eq 0 ]; then
                echo "Nothing to delete"
                echo "" > $log_file_path
                echo "" > $cleanup_file_path
        else
                find $search_path -mtime +30 -type f | xargs du -c > $log_file_path
                find $search_path -mtime +30 -type f -printf "%p\n" > $cleanup_file_path
        fi
        write_log_file "find $search_path -mtime +30 -type f" "Analyze - old files 30 days;"
}

find_old_90() {
        search_path=$1;
        log_file_path=$2;
        cleanup_file_path=$3;
        lines=$(find $search_path -mtime +90 -type f | wc -l)
        if [ $lines -eq 0 ]; then
                echo "Nothing to delete"
                echo "" > $log_file_path
                echo "" > $cleanup_file_path
        else
                find $search_path -mtime +90 -type f | xargs du -c > $log_file_path
                find $search_path -mtime +90 -type f -printf "%p\n" > $cleanup_file_path
        fi
        write_log_file "find $search_path -mtime +90 -type f" "Analyze - old files 90 days;"
}

find_old_180() {
        search_path=$1;
        log_file_path=$2;
        cleanup_file_path=$3;
        lines=$(find $search_path -mtime +180 -type f | wc -l)
        if [ $lines -eq 0 ]; then
                echo "Nothing to delete"
                echo "" > $log_file_path
                echo "" > $cleanup_file_path
        else
                find $search_path -mtime +180 -type f | xargs du -c > $log_file_path
                find $search_path -mtime +180 -type f -printf "%p\n" > $cleanup_file_path
        fi
        write_log_file "find $search_path -mtime +180 -type f" "Analyze - old files 180 days;"
}

find_old_365() {
        search_path=$1;
        log_file_path=$2;
        cleanup_file_path=$3;
        lines=$(find $search_path -mtime +365 -type f | wc -l)
        if [ $lines -eq 0 ]; then
                echo "Nothing to delete"
                echo "" > $log_file_path
                echo "" > $cleanup_file_path
        else
                find $search_path -mtime +365 -type f | xargs du -c > $log_file_path
                find $search_path -mtime +365 -type f -printf "%p\n" > $cleanup_file_path
        fi
        write_log_file "find $search_path -mtime +365 -type f" "Analyze - old files 365 days;"
}

find_empty_files() {
        search_path=$1;
        log_file_path=$2;
        cleanup_file_path=$3;
        lines=$(find $search_path -type f -size 0b -print | wc -l)
        echo "lines: $lines"
        if [ $lines -eq 0 ]; then
                echo "Nothing to delete"
                echo "" > $log_file_path
                echo "" > $cleanup_file_path
        else
		find $search_path -type f -size 0b -print | xargs du -c > $log_file_path
		find $search_path -type f -size 0b -printf "%p\n" > $cleanup_file_path
        fi
        write_log_file "find $search_path -type f -size 0b -print | xargs du -c" "Analyze - empty files;"
}

find_duplicate_files() {
        search_path=$1;
        log_file_path=$2;
        cleanup_file_path=$3;
	lines=$(find $search_path -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find $search_path -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 --all-repeated=separate| wc -l)
        echo "lines: $lines"
        if [ $lines -eq 0 ]; then
                echo "Nothing to delete"
                echo "" > $log_file_path
                echo "" > $cleanup_file_path
        else
		find $search_path -not -empty -type f -printf "%s\n" | sort -rn | uniq -d |  xargs -I{} -n1 find $search_path -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 --all-repeated=separate | cut -f3-100 -d ' ' | xargs du -c > $log_file_path
                find $search_path -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find $search_path -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 --all-repeated=separate > $scriptlogPath/analyze_rm_duplicate_md5.log
                find $search_path -not -empty -type f -printf "%s\n" | sort -rn | uniq -d |  xargs -I{} -n1 find $search_path -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 --all-repeated=separate | cut -f3-100 -d ' ' > $cleanup_file_path

        fi
        write_log_file "find $search_path -not -empty -type f -printf "%s\n" | sort -rn | uniq -d |  xargs -I{} -n1 find $search_path -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 --all-repeated=separate | cut -f3-100 -d ' ' | xargs du -c" "Analyze - duplicate files;"
}

find_yum_cache() {
        #search_path=$1;
        log_file_path=$1;
        cleanup_file_path=$2;

	lines=$(find  /var/cache/yum/* /var/tmp/yum-* 2>/dev/null -type f -print | wc -l)
        echo "lines: $lines"
        if [ $lines -eq 0 ]; then
                echo "Nothing to delete"
                echo "" > $log_file_path
                echo "" > $cleanup_file_path
        else
                find  /var/cache/yum/* /var/tmp/yum-* 2>/dev/null -type f -print | xargs du -c > $log_file_path
                find  /var/cache/yum/* /var/tmp/yum-* 2>/dev/null -type f -print > $cleanup_file_path
        fi

	#tukaj sem imel:
#            yum clean all
#            ls -al /var/cache/yum
#            du -hs /var/cache/yum
#            ls -al /var/tmp/yum-*
#            du -hs /var/tmp/yum-*

#            ls -al /var/cache/yum > $scriptlogPath/rm_yum_cache.log
#            du -hs /var/cache/yum >> $scriptlogPath/rm_yum_cache.log
#            ls -al /var/tmp/yum-* >> $scriptlogPath/rm_yum_cache.log
#            du -hs /var/tmp/yum-* >> $scriptlogPath/rm_yum_cache.log

#            show_submenu_analyze;
#            ;;

        write_log_file "find  /var/cache/yum/* /var/tmp/yum-* 2>/dev/null -type f -print" "Analyze - Yum cache;"
}

find_large_files() {
        search_path=$1;
        log_file_path=$2;
        cleanup_file_path=$3;
	#echo "find $search_path -type f | wc -l"
        lines=$(find $search_path -type f | wc -l)
        if [ $lines -eq 0 ]; then
                echo "Nothing to delete"
                echo "" > $log_file_path
                echo "" > $cleanup_file_path
        else
		find $search_path -type f -exec du -a {} + | sort -n -r > $log_file_path
		find $search_path -type f -exec du -a {} + | sort -n -r | cut -f2 > $cleanup_file_path
        fi
        write_log_file "find $search_path -type f -exec du -a {} + | sort -n -r" "Analyze - Large Files;"
}

find_large_folders() {
        search_path=$1;
        log_file_path=$2;
        cleanup_file_path=$3;
        lines=$(find $search_path -type d | wc -l)
        if [ $lines -eq 0 ]; then
                echo "Nothing to delete"
                echo "" > $log_file_path
                echo "" > $cleanup_file_path
        else
        	du $search_path | sort -nr > $log_file_path        
		du $search_path | sort -nr | cut -f2 > $cleanup_file_path
        fi
        write_log_file "du $search_path | sort -nr" "Analyze - Large Folders;"
}

find_large_files_folders() {
        search_path=$1;
        log_file_path=$2;
        cleanup_file_path=$3;
        lines=$(du -- $search_path/* | wc -l)
        if [ $lines -eq 0 ]; then
                echo "Nothing to delete"
                echo "" > $log_file_path
                echo "" > $cleanup_file_path
        else
		du -- $search_path/* | sort -k1nr > $log_file_path
		du -- $search_path/* | sort -k1nr | cut -f2 > $cleanup_file_path
        fi
        write_log_file "find $search_path -type f -exec du -a {} + | sort -n -r" "Analyze - Large Files and Folders;"
}



find_curr_lang() {
        log_file_path=$1;
        cleanup_file_path=$2;
        lines=$(locale | wc -l)
        echo "lines: $lines"
        if [ $lines -eq 0 ]; then
                echo "Nothing to delete"
                echo "" > $log_file_path
                #echo "" > $cleanup_file_path
        else
                locale > $log_file_path;
        fi
        write_log_file "locale" "Analyze - Curr language;"
}

find_installed_lang() {
        log_file_path=$1;
        cleanup_file_path=$2;
        lines=$(locale -a | wc -l)
        echo "lines: $lines"
        if [ $lines -eq 0 ]; then
                echo "Nothing to delete"
                echo "" > $log_file_path
                #echo "" > $cleanup_file_path
        else
                locale -a > $log_file_path;
        fi
        write_log_file "locale -a" "Analyze - Installed languages;"
}

