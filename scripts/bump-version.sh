#!/bin/bash

type="${1:-patch}"

fastlane run increment_build_number
fastlane run increment_version_number bump_type:"$type"
fastlane run version_bump_podspec bump_type:"$type" path:"NVActivityIndicatorView.podspec"

