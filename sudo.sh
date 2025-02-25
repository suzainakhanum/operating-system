
echo "Enter a date (YYYY-MM-DD): "
read date1
specified_date="2025-02-24"
if [ "$date1" == "$specified_date" ]; then
    echo "Shutting down now..."
    sudo shutdown now
else
    echo "Error: Dates do not match."
fi



