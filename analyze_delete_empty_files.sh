analyze_del_empty_files() {
            
	    clear;
	    #option_picked "SubOption 1-5 Picked - Analyze - Empty files";

	    local location=''
            ReadLocation location;

	    find_empty_files $location $scriptlogPath/analyze_rm_empty.log $scriptlogPath/cleanup_rm_empty.log	    
	    show_analyze_log_content $scriptlogPath/analyze_rm_empty.log;
	
            show_submenu_analyze;

}
