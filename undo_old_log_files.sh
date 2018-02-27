#!/bin/bash
source func_undo.sh

undo_del_old_log_files() {
            
	    clear;
            option_picked "Undo - Old log files";
	    undo_files "$scriptlogPath/cleanup_rm_old_log.log" "Undo - old log files;"
            show_submenu_undo;

}
