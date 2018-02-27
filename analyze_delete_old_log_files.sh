analyze_del_old_log_files() {
            
	    clear;
	    #option_picked "SubOption 1-3 Picked - Analyze - Old log files";

	    find_old_log $scriptlogPath/analyze_rm_old_log.log $scriptlogPath/cleanup_rm_old_log.log	    
	    show_analyze_log_content $scriptlogPath/analyze_rm_old_log.log;
	
            show_submenu_analyze;

}
