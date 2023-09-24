#!/bin/bash -e

module load {{ site.example.module }}
{{ site.example.shell }} {{ site.example.script }} 
echo "Done!"