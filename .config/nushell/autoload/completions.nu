
const _COMPLETION_LOADER_PATH = path self

def touch-completions [] {
    print '[*] Touching completions'
    let folder = $_COMPLETION_LOADER_PATH | path dirname

    here --completion nushell
    | save -f ([$folder, 'here.nu'] | path join)
    print '> here'

    zoxide init nushell --cmd cd
    | save -f ([$folder, 'zoxide.nu'] | path join)
    print '> zoxide'
}
