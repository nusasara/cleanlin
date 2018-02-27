#!/bin/bash
source func_cleanup.sh

cleanup_del_old_log_files() {
            
	    clear;
            #option_picked "SubOption 2-2 Picked - Cleanup - Old log files";
            delete_or_move_to_trash '2' '0'
            show_submenu_cleanup;

}
