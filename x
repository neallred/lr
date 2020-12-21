#! /usr/bin/env bash
# x is for execute

function deps() {
  echo ""
  read -p "This will install rust if absent. Continue? (Y or n) " -n 1 -r
  echo ""
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  if command -v cargo >/dev/null 2>&1; then
    :
  else
    echo "installing rust"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    if [ -f $HOME/.cargo/env ]; then
      source $HOME/.cargo/env
    fi
  fi
}

function x() {
  local cmd=$1
  local cmds="dev prod setup"
  local tgt_dir="./target/x86_64-unknown-linux-musl/debug"
  case $cmd in
    dev)
      cargo run --target x86_64-unknown-linux-musl
      ;;
    prod)
      cargo build --release --target x86_64-unknown-linux-musl
      ;;
    setup)
      deps
      ;;
    *)
      echo "Can't \"$1\". Try one of: $cmds"
      ;;
  esac
}

x "$@"
