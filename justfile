help:
  @echo 'Please run `just install` to install this package.'

install target="@local":
  ./scripts/package.sh "{{target}}"
