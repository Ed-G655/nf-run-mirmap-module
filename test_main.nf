#!/usr/bin/env nextflow

/*Pipeline de prueba para  nextflow */

/* Activar modo DSL2*/
nextflow.enable.dsl=2

/* Define the default parameters
 */
params.mirna_fa = false
params.utr_fa   = false
params.mirmap_script = "$baseDir/mirmap_script.py"
params.results  = "$baseDir/test/data/results"

mirna_ch = Channel.fromPath(params.mirna_fa )
utr_ch = Channel.fromPath(params.utr_fa )

log.info """\
test_modules
================================
mirna_fa   : $params.mirna_fa
utr_fa    : $params.utr_fa
results  : $params.results
"""

/*
 * Import modules
 */
include {RUN_MIRMAP} from './module.nf'

/*
 * main pipeline logic
 */

workflow  {
  runmirmap_ch = RUN_MIRMAP(mirna_ch, utr_ch,
    params.mirmap_script)
}
