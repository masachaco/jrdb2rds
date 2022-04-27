#!/bin/bash

sh scripts/get_doc.sh

sh scripts/trim_spec.sh

sh scripts/doc_to_csv.sh

sh scripts/create_model.sh