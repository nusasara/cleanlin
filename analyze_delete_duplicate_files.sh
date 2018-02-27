analyze_del_duplicate_files() {
            
	    clear;
	    #option_picked "SubOption 1-6 Picked - Analyze - Duplicate files";

	    local location=''
            ReadLocation location;

	    find_duplicate_files $location $scriptlogPath/analyze_rm_duplicate.log $scriptlogPath/cleanup_rm_duplicate.log	    
	    show_analyze_log_content $scriptlogPath/analyze_rm_duplicate.log;
	    show_analyze_log_content $scriptlogPath/analyze_rm_duplicate_md5.log;
	
            show_submenu_analyze;

}
