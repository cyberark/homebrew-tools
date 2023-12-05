#!/usr/bin/env bash
set -ueo pipefail

export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin

formulae=(
    summon
    summon-conjur
    summon-aws-secrets
    terraform-provider-conjur
    secretless-broker
    conjur-cli
)

for formula in ${formulae[@]}; do
    brew install --debug --build-from-source "./${formula}.rb"
    # Installing the formula works without inteverention,
    # but testing fails without copying github-update.rb because during
    # testing the formula is run from an isloated location, not from
    # within the repo.
    # To allow testing to work, we copy in github-update.rb.
done

for formula in ${formulae[@]}; do
    cp github-update.rb /home/linuxbrew/.linuxbrew/opt/${formula}/.brew/
    brew test --debug "${formula}"
done
