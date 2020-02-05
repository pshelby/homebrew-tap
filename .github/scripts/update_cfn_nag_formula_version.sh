#!/usr/bin/env sh

#
# update_homebrew_formula_version.sh
# Patrick Shelby, 1/2020
#
# Update cfn_nag Homebrew formula with most recent gem versions and SHA256 values.
# To be run in the stelligent/homebrew-tap GitHub Action workflow.
#

BASE_URL=https://github.com/$ORG

CFN_NAG_URL=$BASE_URL/cfn_nag
CFN_NAG_VERSION=$(git -C cfn_nag tag -l --sort=creatordate | tail -1 | cut -c2-)
CFN_NAG_SHA256=$(curl -L -s $CFN_NAG_URL/tarball/v$CFN_NAG_VERSION | shasum -a 256 | cut -d' ' -f1)

# Update metadata specific to cfn_nag
sed -i "s#^\(  url\) .*#\1 \"$CFN_NAG_URL/tarball/v$CFN_NAG_VERSION\"#" Formula/cfn-nag.rb
sed -i "s/^\(  version\) .*/\1 \"$CFN_NAG_VERSION\"/" Formula/cfn-nag.rb
sed -i "s/^\(  sha256\) .*/\1 \"$CFN_NAG_SHA256\"/" Formula/cfn-nag.rb

# Set cfn_nag version as a GitHub Workflow output
echo "::set-output name=cfn_nag_version::v${CFN_NAG_VERSION}"
