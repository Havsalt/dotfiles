
const current_file = path self

def touch-completions [] {
    print '[*] Touching completions'
    let folder = $current_file | path dirname

    here --completion nushell
    | save -f ([$folder, 'here.nu'] | path join)
    print '> here'

    zoxide init nushell --cmd cd
    | save -f ([$folder, 'zoxide.nu'] | path join)
    print '> zoxide'
}
