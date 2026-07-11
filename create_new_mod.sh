template_name="TemplateMod"

# Checks if argument is given. Get a mod name if not
if [ $# -eq 0 ]; then
    read -p "No arguments supplied. Enter mod name: " mod_name
else
    # Grabs first argument
    mod_name=$1
fi

# Checks if mod name exists already
if [ -d "./${mod_name}" ]; then 
    echo "Mod name already in use."
    return
fi

# Copies template
cp -r "./${template_name}" "./${mod_name}"
# Renames files
#   Finds all files recursively, then replaces the template name with the mod name. The {} ";" is for -exec to have no placeholder and a ; delimiter
find -name "*" -exec rename 's/${template_name}/${mod_name}/' {} ";"
# Replaces name instance in files
sed -i 's/${template_name}/${mod_name}/g' *