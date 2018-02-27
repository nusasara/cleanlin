#!/bin/bash
source func_undo.sh

undo_del_empty_files() {
            
	    clear;
            #option_picked "Undo - Empty files";
	    undo_files "$scriptlogPath/cleanup_rm_empty.log" "Undo - empty files;"
            show_submenu_undo;

}
