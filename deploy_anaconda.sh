#!/bin/bash

# Step 1: Download Anaconda installer
ANACONDA_INSTALLER_URL="https://repo.anaconda.com/archive/Anaconda3-2023.03-1-Linux-x86_64.sh"
ANACONDA_INSTALLER_FILENAME="Anaconda.sh"
wget "$ANACONDA_INSTALLER_URL" -O "$ANACONDA_INSTALLER_FILENAME"

# Step 2: Install Anaconda
bash "$ANACONDA_INSTALLER_FILENAME"
rm "$ANACONDA_INSTALLER_FILENAME"

# Step 3: Initialize Anaconda
source ~/.bashrc

# Step 4: Create a new conda environment (Optional)
conda create --name myenv
conda activate myenv

# Step 5: Install JupyterLab
conda install jupyterlab

# Step 6: Generate JupyterLab password
jupyter notebook password

# Step 7: Generate JupyterLab configuration file
jupyter lab --generate-config

# Step 8: Configure JupyterLab
JUPYTER_CONFIG_FILE=~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.ip = '0.0.0.0'" >> "$JUPYTER_CONFIG_FILE"
echo "c.NotebookApp.allow_origin = '*'" >> "$JUPYTER_CONFIG_FILE"
echo "c.NotebookApp.open_browser = False" >> "$JUPYTER_CONFIG_FILE"
echo "c.NotebookApp.password = '<password hash>'" >> "$JUPYTER_CONFIG_FILE"

# Step 9: Start JupyterLab
jupyter lab
