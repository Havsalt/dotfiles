
# Dynamically run each `main` function for each file in the install folder
$nu.default-config-dir
| path join 'install'
| ls $in
| nu
