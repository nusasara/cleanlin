analyze_del_yum_cache() {
            
	    clear;
	    #option_picked "SubOption 1-7 Picked - Analyze - Yum cache";

	    find_yum_cache $scriptlogPath/analyze_rm_yum_cache.log $scriptlogPath/cleanup_rm_yum_cache.log	    
	    show_analyze_log_content $scriptlogPath/analyze_rm_yum_cache.log;
	
            show_submenu_analyze;

}
