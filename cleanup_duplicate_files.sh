#!/bin/bash
source func_cleanup.sh

cleanup_del_duplicate_files() {
            
	    clear;
            #option_picked "SubOption 2-6 Picked - Cleanup - Duplicate files";
            delete_or_move_to_trash '6' '0'
            show_submenu_cleanup;

}
