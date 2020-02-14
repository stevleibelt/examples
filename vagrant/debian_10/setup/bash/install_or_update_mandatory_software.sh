#!/bin/bash
####
# @author stev.leibelt@freiberg.de
# @since 2020-02-13
####

#function to be able to use local variables and not pollute global variable namespace
function install_or_update_mandatory_software ()
{
    #only packages that are needed to setup and maintain ansible should be in here
    # all other packages should be managed by ansible
    declare -a PACKAGES=("curl" "wget" "python3-pip")

    apt-get update

    for PACKAGE in "${PACKAGES[@]}";
    do
        echo "[debug]: Checking state of package >>${PACKAGE}<<."
        local NUMBER_OF_INSTALLED_PACKAGE=$(dpkg-query --list | grep -ic ${PACKAGE})

        if [[ ${NUMBER_OF_INSTALLED_PACKAGE} -eq 0 ]];
        then
            echo "[info]: Installing >>${PACKAGE}<<."
            apt-get -y install ${PACKAGE}
        fi
    done;

    #link pip3 to pip because ansible expects /usr/bin/pip
    if [[ -f /usr/bin/pip3 ]];
    then
        local CREATE_SOFTLINK_FROM_PIP3_TO_PIP=0;

        if [[ -L /usr/bin/pip ]];
        then
            local TARGET_OF_PIP=$(readlink /usr/bin/pip)

            if [[ "${TARGET_OF_PIP}" != "pip3" ]];
            then
                echo "[debug]: removing invalid link (should target >>/usr/bin/pip3<< but is targeting >>${TARGET_OF_PIP}<<."
                rm /usr/bin/pip
            fi
        else
            CREATE_SOFTLINK_FROM_PIP3_TO_PIP=1;
        fi

        if [[ ${CREATE_SOFTLINK_FROM_PIP3_TO_PIP} -eq 1 ]];
        then
            echo "[info]: Linking pip3 to pip"
            ln -s /usr/bin/pip3 /usr/bin/pip
        fi
    else
        echo "[error]: >>/usr/bin/pip3<< does not exist or is not a link."
    fi
}

install_or_update_mandatory_software

