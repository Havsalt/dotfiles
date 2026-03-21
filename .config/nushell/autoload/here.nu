module completions {

  def "nu-complete here generate_completions" [] {
    [ "bash" "elvish" "fish" "powershell" "zsh" "nushell" ]
  }

  # Effortlessly grab and copy file locations
  export extern here [
    --folder(-f)              # Get folder component of result
    --search(-w)              # Use `where`/`which` command to search
    --change-directory(-d)    # Set current working directory to result
    --escape-backslash(-e)    # Escape backslashes
    --wrap-quote(-q)          # Wrap result in double quotes
    --resolve-symlink(-r)     # Resolve symlink path
    --no-copy(-n)             # Prevent copy to clipboard
    --no-color(-c)            # Suppress color
    --posix                   # Force posix style path
    --no-posix                # Prevent posix style path
    --select-first            # Select first option if multiresult
    --completion: string@"nu-complete here generate_completions" # Generate completion script for given shell
    --markdown                # Generate markdown help page
    --help(-h)                # Print help (see more with '--help')
    --version(-V)             # Print version
    path_segment_or_program_search?: string # Additional path segment or program name used for searching
  ]

}

export use completions *
