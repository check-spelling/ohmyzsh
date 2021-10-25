if (( $+commands[rbw] )); then
  ver="$(rbw --version)"
  ver_file="$ZSH_CACHE_DIR/rbw_version"
  comp_file="$ZSH_CACHE_DIR/completions/_rbw"

  mkdir -p "${comp_file:h}"
  (( ${fpath[(Ie)${comp_file:h}]} )) || fpath=("${comp_file:h}" $fpath)

  if [[ ! -f "$comp_file" || ! -f "$ver_file" || "$ver" != "$(< "$ver_file")" ]]; then
    rbw gen-completions zsh >| "$comp_file"
    echo "$ver" >| "$ver_file"
  fi

  declare -A _comps
  autoload -Uz _rbw
  _comps[rbw]=_rbw

  unset ver ver_file comp_file
fi
