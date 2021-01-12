#!/usr/bin/env bash
declare -a options

# This is a GitHub Action... Act like it :)
options+=(--format github)

# Custom path for yamllint configuration input
if [[ -n "${INPUT_CONFIG}" ]]; then
  if [[ -f "${INPUT_CONFIG}" ]]; then
    echo "::error ::Custom yamllint configuration file not found: ${INPUT_CONFIG}"
    exit 1
  fi
  options+=(--config-file "${INPUT_CONFIG}")
fi

[[ "${INPUT_STRICT,,}" = "true" ]] \
  && options+=(--strict)

[[ "${INPUT_WARNINGS,,}" = "false" ]] \
  && options+=(--no-warnings)

# Output version
yamllint --version

# Lint!
exec yamllint "${options[@]}" "${INPUT_PATH:-.}"
