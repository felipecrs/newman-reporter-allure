#!/bin/bash

set -euxo pipefail

rm -rf allure-results

newman run "test/fixtures/Sample Postman Collection.postman_collection.json" \
    --reporters @felipecrs/allure \
    --reporter-@felipecrs/allure-collection-as-parent-suite

allure generate --clean

exec serve allure-report
