#!/bin/bash
# Advanced Shell Script for Directory Management
# Usage: ./directory_management.sh
# Function to display usage information
usage() {
echo "Usage: $0"
exit 1
}
# Function to create a directory
create_directory() {
read -p "Enter the name of the new directory: " dir_name
if [ -d "$dir_name" ]; then
echo "Error: Directory '$dir_name' already exists."
else
mkdir "$dir_name"
if [ $? -eq 0 ]; then
echo "Directory '$dir_name' created successfully."
else
echo "Error: Could not create directory '$dir_name'."
fi
fi
}
# Function to list existing directories
list_directories() {
echo "Listing directories:"
ls -d */ 2>/dev/null || echo "No directories found."
}
# Function to delete a directory
delete_directory() {
read -p "Enter the name of the directory to delete: " dir_name
if [ ! -d "$dir_name" ]; then
echo "Error: Directory '$dir_name' does not exist."
else
read -p "Are you sure you want to delete '$dir_name'? (y/n): " confirm
if [[ "$confirm" =~ ^[Yy]$ ]]; then
rmdir "$dir_name" 2>/dev/null
if [ $? -eq 0 ]; then
echo "Directory '$dir_name' deleted successfully."
else
echo "Error: Directory '$dir_name' is not empty. Use 'rm -r' to
remove it."
fi
else
echo "Deletion of '$dir_name' canceled."
fi
fi
}
