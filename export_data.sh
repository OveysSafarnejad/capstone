#!/bin/bash

# MySQL database credentials
DB_USER="root"
DB_PASSWORD="default"
DB_NAME="sales"

# Output file for the exported data
OUTPUT_FILE="exported_data.sql"

# Run mysqldump to export the data
mysqldump -u"$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" > "$OUTPUT_FILE"

# Check if the mysqldump command was successful
if [ $? -eq 0 ]; then
  echo "Data export successful. File: $OUTPUT_FILE"
else
  echo "Error exporting data."
fi
