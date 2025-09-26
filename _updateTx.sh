#!/bin/bash

set -e  # Exit on error

# Define fhir_dir and temp_dir
fhir_dir="${HOME}/.fhir"
temp_dir="/tmp/fhir-temp"
echo "==============================================="
echo "FHIR Package Installer for JP Core"
echo "==============================================="
echo "FHIR directory: ${fhir_dir}"
echo "Temp directory: ${temp_dir}"

# Create directories if they don't exist
echo ""
echo "Checking directories..."
if [ ! -d "${fhir_dir}" ]; then
    echo "Creating FHIR directory: ${fhir_dir}"
    mkdir -p "${fhir_dir}"
fi

if [ ! -d "${fhir_dir}/packages" ]; then
    echo "Creating packages directory: ${fhir_dir}/packages"
    mkdir -p "${fhir_dir}/packages"
fi

if [ ! -d "${temp_dir}" ]; then
    echo "Creating temp directory: ${temp_dir}"
    mkdir -p "${temp_dir}"
fi

# Function for downloading package
download_package() {
    echo ""
    echo "-----------------------------------------------"
    echo "Downloading FHIR resource packages..."
    echo "-----------------------------------------------"
    
    dlpkgurl="https://jpfhir.jp/fhir/fhir_dotFHIR_packages.tgz"
    localpkg="${temp_dir}/fhir_dotFHIR_packages.tgz"
    
    # Remove old file if exists
    if [ -f "${localpkg}" ]; then
        echo "Removing old package file..."
        rm -f "${localpkg}"
    fi
    
    echo "Downloading from: ${dlpkgurl}"
    echo "Saving to: ${localpkg}"
    
    if curl -L -f -o "${localpkg}" "${dlpkgurl}"; then
        echo "Download successful!"
        
        echo "Extracting resource packages to ${fhir_dir}..."
        if tar -xzf "${localpkg}" -C "${fhir_dir}"; then
            echo "✓ Resource packages installed successfully."
            rm -f "${localpkg}"
            return 0
        else
            echo "✗ Failed to extract resource packages."
            return 1
        fi
    else
        echo "✗ Failed to download resource packages."
        return 1
    fi
}

# Function for downloading terminology
download_terminology() {
    echo ""
    echo "-----------------------------------------------"
    echo "Downloading JP FHIR terminology package..."
    echo "-----------------------------------------------"
    
    dltermurl="https://jpfhir.jp/fhir/core/terminology/jpfhir-terminology.r4-1.5.0.tgz"
    localterm="${temp_dir}/jpfhir-terminology.r4-1.5.0.tgz"
    term_dir="${fhir_dir}/packages/jpfhir-terminology.r4#1.5.0"
    
    # Remove old file if exists
    if [ -f "${localterm}" ]; then
        echo "Removing old terminology file..."
        rm -f "${localterm}"
    fi
    
    echo "Downloading from: ${dltermurl}"
    echo "Saving to: ${localterm}"
    
    if curl -L -f -o "${localterm}" "${dltermurl}"; then
        echo "Download successful!"
        
        # Check file size to ensure it's not empty
        filesize=$(stat -c%s "${localterm}" 2>/dev/null || stat -f%z "${localterm}" 2>/dev/null || echo "0")
        if [ "$filesize" -lt 1000 ]; then
            echo "✗ Downloaded file is too small (${filesize} bytes). May be corrupted."
            return 1
        fi
        
        if [ ! -d "${term_dir}" ]; then
            echo "Creating terminology directory: ${term_dir}"
            mkdir -p "${term_dir}"
        fi
        
        echo "Extracting terminology package..."
        if tar -xzf "${localterm}" -C "${term_dir}"; then
            echo "✓ Extraction successful."
            
            # Create package.json if it doesn't exist
            if [ ! -f "${term_dir}/package.json" ]; then
                echo "Creating package.json for jpfhir-terminology..."
                cat > "${term_dir}/package.json" << 'EOF'
{
  "name": "jpfhir-terminology.r4",
  "version": "1.5.0",
  "description": "JPFHIR Terminology Package",
  "fhirVersions": ["4.0.1"],
  "dependencies": {
    "hl7.fhir.r4.core": "4.0.1"
  }
}
EOF
            fi
            
            echo "✓ Terminology package installed successfully."
            rm -f "${localterm}"
            return 0
        else
            echo "✗ Failed to extract terminology package."
            return 1
        fi
    else
        echo "✗ Failed to download terminology package."
        return 1
    fi
}

# Main execution
echo ""
echo "==============================================="
echo "Starting package installation..."
echo "==============================================="

# Check if resource packages need to be downloaded
need_resource_download=false
if [ ! -d "${fhir_dir}/packages" ]; then
    echo "Packages directory not found."
    need_resource_download=true
elif [ ! "$(ls -A ${fhir_dir}/packages 2>/dev/null)" ]; then
    echo "Packages directory is empty."
    need_resource_download=true
fi

# Download resource packages if needed
if [ "$need_resource_download" == true ]; then
    if ! download_package; then
        echo "Warning: Could not download resource packages."
    fi
fi

# Always try to download/update terminology
if [ ! -d "${fhir_dir}/packages/jpfhir-terminology.r4#1.5.0" ] || [ ! -f "${fhir_dir}/packages/jpfhir-terminology.r4#1.5.0/package.json" ]; then
    echo "JP FHIR terminology package needs to be installed."
    if ! download_terminology; then
        echo "Error: Failed to install terminology package."
        exit 1
    fi
else
    echo "JP FHIR terminology package already installed."
fi

# Clean up temp directory
echo ""
echo "Cleaning up temporary files..."
if [ -d "${temp_dir}" ]; then
    rm -f "${temp_dir}"/*.tgz 2>/dev/null || true
fi

echo ""
echo "==============================================="
echo "✓ Package installation completed!"
echo "==============================================="
echo ""
echo "Installed packages:"
ls -la "${fhir_dir}/packages/" 2>/dev/null | grep "jpfhir" || echo "No JP FHIR packages found."
