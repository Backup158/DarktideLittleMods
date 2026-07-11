template_name="TemplateMod"

# Checks if argument is given. Get a mod name if not
if [ $# -eq 0 ]; then
    read -p "No arguments supplied. Enter mod name: " mod_name
else
    # Grabs first argument
    mod_name=$1
fi

# Checks if mod name exists already. Stop if so
if [ -d "./${mod_name}" ]; then 
    echo "Mod name already in use."
    exit 1
fi

# Copies template
cp -r "./${template_name}" "./${mod_name}"

cd "${mod_name}"

# Renames files
#   Finds all files recursively, then replaces the template name with the mod name. The {} ";" is for -exec to have no placeholder and a ; delimiter
find * -execdir rename "s/${template_name}/${mod_name}/g" "{}" \+
echo "Renamed mod file names"

# Replaces name instance in mod files
find -name "${mod_name}*\.*" -execdir sed -i "s/${template_name}/${mod_name}/g" "{}" \+
echo "Replaced contents of mod files"