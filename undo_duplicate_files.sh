#!/bin/bash
source func_undo.sh

undo_del_duplicate_files() {
            
	    clear;
            #option_picked "Undo - Duplicate files";
            undo_files "$scriptlogPath/cleanup_rm_duplicate.log" "Undo - duplicate files;"
	    show_submenu_undo;

}
