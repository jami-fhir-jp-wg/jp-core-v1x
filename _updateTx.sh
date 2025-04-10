#!/bin/bash

# Define fhir_dir and temp_dir
fhir_dir="${HOME}/.fhir"
temp_dir="./temp"
echo "${fhir_dir}"

# Create fhir_dir if it doesn't exist
if [ ! -d "${fhir_dir}" ]; then
    mkdir -p "${fhir_dir}"
fi

# Create temp_dir if it doesn't exist
if [ ! -d "${temp_dir}" ]; then
    mkdir -p "${temp_dir}"
fi

# Check if packages directory exists
if [ ! -d "${fhir_dir}/packages" ]; then
    goto_download_package=true
else
    read -p "clear packages? (resource and terminology) (Y/N) " clear
    if [ "$clear" == "Y" ] || [ "$clear" == "y" ]; then
        rm -rf "${fhir_dir}/packages"
    fi
fi

# Function for downloading package
download_package() {
    read -p "download packages of resource? (Y/N) " dpkg
    if [ "$dpkg" == "Y" ] || [ "$dpkg" == "y" ]; then
        dlpkgurl="https://jpfhir.jp/fhir/fhir_dotFHIR_packages.tgz"
        localpkg="./temp/fhir_dotFHIR_packages.tgz"
        curl -o "${localpkg}" "${dlpkgurl}"
        tar -xvzf "${localpkg}" -C "${fhir_dir}"
    fi
}

# Function for downloading terminology
download_terminology() {
    read -p "download packages of terminology? (Y/N) " dterm
    if [ "$dterm" == "Y" ] || [ "$dterm" == "y" ]; then
        dltermurl="https://jpfhir.jp/fhir/core/terminology/jpfhir-terminology.r4-1.3.0.tgz"
        localterm="./temp/jpfhir-terminology.r4-1.3.0.tgz"
        term_dir="${fhir_dir}/packages/jpfhir-terminology.r4#1.3.0"
        curl -o "${localterm}" "${dltermurl}"
        
        if [ ! -d "${term_dir}" ]; then
            mkdir -p "${term_dir}"
        fi

        tar -xvzf "${localterm}" -C "${term_dir}"
    fi
}

# Call function to download package
[ "$goto_download_package" == true ] && download_package

# Call function to download terminology
download_terminology

# End of script
read -p "Press enter to continue"
