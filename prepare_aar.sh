#!/bin/bash

# Prompt the user for input in the format groupId:artifactId:version
read -p "Enter the Maven coordinates (groupId:artifactId:version): " maven_coords
read -p "Enter the AAR file path: " aar_path

# Extract groupId, artifactId, and versionName using IFS (Internal Field Separator)
IFS=':' read -r group_id artifact_id version_name <<< "$maven_coords"

# GitHub repository information
repo_name="aar-repo"
repo_url="https://github.com/ihsibo/$repo_name.git"
branch="main"

# Get the directory of the AAR file
aar_dir=$(dirname "$aar_path")

# Define the POM content with placeholders
pom_content="<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<project xmlns=\"http://maven.apache.org/POM/4.0.0\"
         xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"
         xsi:schemaLocation=\"http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd\">
    <modelVersion>4.0.0</modelVersion>
    <groupId>$group_id</groupId>
    <artifactId>$artifact_id</artifactId>
    <version>$version_name</version>
    <packaging>aar</packaging>
</project>"

# Write the POM content to a new POM file in the same directory as the AAR file
pom_file="$aar_dir/${artifact_id}-${version_name}.pom"
echo "$pom_content" > "$pom_file"

# Convert group ID to folder path (replace dots with slashes)
group_path=$(echo "$group_id" | tr '.' '/')

# Create the directory structure: group_id/artifact_id/version_name
target_dir="$aar_dir/$group_path/$artifact_id/$version_name"
mkdir -p "$target_dir"

# Copy the AAR and POM file to the target directory
cp "$aar_path" "$target_dir/${artifact_id}-${version_name}.aar"
cp "$pom_file" "$target_dir/${artifact_id}-${version_name}.pom"

rm $pom_file

# Confirm to the user
#echo "AAR and POM files have been copied to: $target_dir"

