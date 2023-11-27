#!/bin/bash
####
# @author stev.leibelt@freiberg.de
# @since 2020-02-13
####

#function to be able to use local variables and not pollute global variable namespace
function enable_non_free_packages ()
{
    local APT_SOURCE_LIST_PATH="/etc/apt/sources.list"
    local APT_SOURCE_LIST_PATH_BACKUP="/etc/apt/sources.list.original"
    local CURRENT_DATE=$(date)

    if [[ ! -f "${APT_SOURCE_LIST_PATH_BACKUP}" ]]; then
        echo ":: Enabling non-free packages in the repository."
        #we have something to do
        #make a backup
        cp "${APT_SOURCE_LIST_PATH}" "${APT_SOURCE_LIST_PATH_BACKUP}"

        #add " non-free" to each line that ends with " main"
        echo "#non-free was added ${CURRENT_DATE}" > "${APT_SOURCE_LIST_PATH}"
        sed -E 's/\ main$/\ main\ non-free/' "${APT_SOURCE_LIST_PATH_BACKUP}" >> "${APT_SOURCE_LIST_PATH}"

        #fetch non free packages
        apt-get update
    fi
}

enable_non_free_packages
