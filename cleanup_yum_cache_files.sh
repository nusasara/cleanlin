#!/bin/bash
source func_cleanup.sh

cleanup_del_yum_cache_files() {
            
	    clear;
            #option_picked "SubOption 2-7 Picked - Cleanup - Yum cache files";
            delete_or_move_to_trash '7' '0'
            show_submenu_cleanup;

}
