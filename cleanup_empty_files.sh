#!/bin/bash
source func_cleanup.sh

cleanup_del_empty_files() {
            
	    clear;
            #option_picked "SubOption 2-5 Picked - Cleanup - Empty files";
            delete_or_move_to_trash '5' '0'
            show_submenu_cleanup;

}
