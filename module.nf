#!/usr/bin/env nextflow

/*Modulos de prueba para  nextflow */


process RUN_MIRMAP {

	echo
	publishDir "./test/results", mode: "copy"
    input:
    path mirna_ch
		path utr_ch
		path mirmap_script

    output:
		path "${mirna_ch.baseName}.mirmapout"

    """
		echo "[DEBUG] Running miRmap on $mirna_ch"
		python3 mirmap_script.py $mirna_ch $utr_ch ${mirna_ch.baseName}.mirmapout
    """
}
