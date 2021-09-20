mirna_fa="test/data/sample1.mirna.fa"
utr_fa="test/data/sample1.utr.fa"


echo -e "======\n Testing NF execution \n======" \
&& rm -rf $output_directory \
&& nextflow run test_main.nf \
	--mirna_fa $mirna_fa \
  --utr_fa $utr_fa \
	-resume \
&& echo -e "======\n Basic module TEST SUCCESSFUL \n======"
