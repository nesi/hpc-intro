#!/bin/bash -e

module purge
module load {{ site.example.module }}
{{ site.example.shell }} {{ site.example.script }} 
echo "Done!"