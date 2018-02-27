#!/bin/bash

show_submenu_analyze(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}*********************************************${NORMAL}"
    #echo -e "${MENU}**${NUMBER}   1)${MENU} Print OS Type ${NORMAL}"
    echo -e "${MENU}**${NUMBER}   1)${MENU} Temporary files ${NORMAL}"
    echo -e "${MENU}**${NUMBER}   2)${MENU} Old log files ${NORMAL}"
    echo -e "${MENU}**${NUMBER}   3)${MENU} Packages ${NORMAL}"
    echo -e "${MENU}**${NUMBER}   4)${MENU} Old files ${NORMAL}"
    echo -e "${MENU}**${NUMBER}   5)${MENU} Empty files ${NORMAL}"
    echo -e "${MENU}**${NUMBER}   6)${MENU} Duplicate files ${NORMAL}"
    echo -e "${MENU}**${NUMBER}   7)${MENU} Yum cache ${NORMAL}"
    echo -e "${MENU}**${NUMBER}   8)${MENU} Large files ${NORMAL}"
    echo -e "${MENU}**${NUMBER}   9)${MENU} Language packs ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 100)${MENU} Return to menu ${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT} q to exit.. ${NORMAL}"
    read opt
}

show_submenu_analyze_del_temp_files(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${MENU}**${NUMBER}   1)${MENU} Flash, Macromediaobjects ${NORMAL}"
    echo -e "${MENU}**${NUMBER}   2)${MENU} Desired folder ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 100)${MENU} Return to menu ${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT} q to exit.. ${NORMAL}"
    read opt
    eval $1=$opt
}

#ne rabimo kazati submenu za old log files, ker je samo ena izbira

show_submenu_analyze_del_package(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${MENU}**${NUMBER}   1)${MENU} Orphan packages ${NORMAL}"
    echo -e "${MENU}**${NUMBER}   2)${MENU} Old kernels ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 100)${MENU} Return to menu ${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT} q to exit.. ${NORMAL}"
    read opt
    eval $1=$opt
}

show_submenu_analyze_del_old_files(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${MENU}**${NUMBER}   1)${MENU} Not accessed more than 30 days ${NORMAL}"
    echo -e "${MENU}**${NUMBER}   2)${MENU} Not accessed more than 90 days ${NORMAL}"
    echo -e "${MENU}**${NUMBER}   3)${MENU} Not accessed more than 180 days ${NORMAL}"
    echo -e "${MENU}**${NUMBER}   4)${MENU} Not accessed more than 365 days ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 100)${MENU} Return to menu ${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT} q to exit.. ${NORMAL}"
    read opt
    eval $1=$opt
}

#rabimo kazati submenu za empty files, ker je samo ena izbira

#ne rabimo kazati submenu za duplicate files, ker je samo ena izbira

show_submenu_analyze_del_large_files(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${MENU}**${NUMBER}   1)${MENU} Large Files ${NORMAL}"
    echo -e "${MENU}**${NUMBER}   2)${MENU} Large Folders ${NORMAL}"
    echo -e "${MENU}**${NUMBER}   3)${MENU} Large Files and Folders ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 100)${MENU} Return to menu ${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT} q to exit.. ${NORMAL}"
    read opt
    eval $1=$opt
}

show_submenu_analyze_lang(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${MENU}**${NUMBER}   1)${MENU} Show current language ${NORMAL}"
    echo -e "${MENU}**${NUMBER}   2)${MENU} Show all installed languages ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 100)${MENU} Return to menu ${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT} q to exit.. ${NORMAL}"
    read opt
    eval $1=$opt
}

