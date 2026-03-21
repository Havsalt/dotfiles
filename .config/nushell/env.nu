
# Environment variable convertions
$env.ENV_CONVERSIONS.__zoxide_hooked = {
  from_string: { |s| $s | into bool }
  to_string: { |b| $b | into string }
}

# NOTE: This var needs to be updated if files are moved, or config dir is changed
const dotfiles_dir = $nu.default-config-dir | path dirname --num-levels 2

## Load from `env.toml`
print '[*] Loading environment variables'
let env_vars = (
    [$nu.default-config-dir, 'env.toml']
    | path join
    | open
)

# Prepend root path (to `.dotfiles` directory)
let abs_paths = (
    $env_vars.relative
    | transpose path_name, rel_path
    | update rel_path { |p| [$dotfiles_dir, $p.rel_path] | path join }
    | transpose -rd
)
$abs_paths
| transpose 'Environment Name' 'Absolute Path'
| upsert 'Environment Name' {|r| $"(ansi yellow)($r.'Environment Name')(ansi reset)" }
| upsert 'Absolute Path' {|r| $"(ansi cyan)($r.'Absolute Path')(ansi reset)" }
| print
$abs_paths | load-env

# No pre-processing done
$env_vars.exact
| transpose 'Environment Name' 'Value'
| upsert 'Environment Name' {|r| $"(ansi yellow)($r.'Environment Name')(ansi reset)" }
| upsert 'Value' {|r| $"(ansi cyan)($r.'Value')(ansi reset)" }
| print
$env_vars.exact | load-env
print '`-> Done loading environment variables'
