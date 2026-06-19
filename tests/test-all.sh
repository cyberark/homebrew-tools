#!/usr/bin/env bash
set -ueo pipefail

export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin

# Install dependencies
brew tap hashicorp/tap
brew install --verbose --debug hashicorp/tap/terraform

formulae=(
    summon
    summon-conjur
    summon-aws-secrets
    terraform-provider-conjur
    secretless-broker
    conjur-cli
    idsec
)

for formula in ${formulae[@]}; do
    brew install --debug --build-from-source "./${formula}.rb"
    # Installing the formula works without inteverention,
    # but testing fails without copying lib/github-update.rb because during
    # testing the formula is run from an isloated location, not from
    # within the repo.
    # To allow testing to work, we copy in lib/github-update.rb.
done

for formula in ${formulae[@]}; do
    cp lib/github-update.rb /home/linuxbrew/.linuxbrew/opt/${formula}/.brew/
    brew test --debug "${formula}"
done
