#modify previous script to log memory into a file (memory_log.txt)
#!/bin/bash
# Shell Script for Monitoring Memory Usage
# Usage: ./memory_monitor.sh

LOG_FILE="memory_log.txt"

# Function to log memory usage to a file with a timestamp
log_memory_usage() {
    echo "Logging memory usage to $LOG_FILE"
    echo "$(date) - Memory Usage:" >> "$LOG_FILE"
    free -h >> "$LOG_FILE"
    echo "" >> "$LOG_FILE"
    sleep 10
}

# Function to display memory usage
display_memory_usage() {
    echo "Current Memory Usage:"
    free -h
    log_memory_usage  # Log the current memory usage to the file
    echo ""
}

# Function to display memory usage in real-time
monitor_memory_usage() {
    echo "Monitoring memory usage in real-time. Press [CTRL+C] to stop."
    # Use top command to show memory usage updates every 10 seconds, limit to 10 iterations
    top -d 2 -n 10 -o %MEM | tee -a "$LOG_FILE"  # Log real-time memory usage to the file
    
}

# Displaying options to the user
while true; do
    clear  # Clear the screen for better readability
    echo "Dynamic Memory Monitor"
    echo "1. Display current memory usage"
    echo "2. Monitor memory usage in real-time"
    echo "3. Exit"
    echo ""
    
    # Prompt user for selection
    read -p "Select an option (1-3): " option
    
    case $option in
        1) # Display current memory usage
            display_memory_usage
            ;;
        2) # Monitor memory usage in real-time
            monitor_memory_usage
            ;;
        3) # Exit the script
            echo "Exiting the memory monitor. Goodbye!"
            exit 0
            ;;
        *) # Invalid option
            echo "Invalid option. Please select 1-3."
            ;;
    esac
    echo "" # Print a newline for better readability
done
