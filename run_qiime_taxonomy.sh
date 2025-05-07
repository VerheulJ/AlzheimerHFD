


qiime tools import \
--type 'SampleData[PairedEndSequencesWithQuality]' \
--input-path manifest.tsv \
--output-path demux_paired_rat.qza \
--input-format PairedEndFastqManifestPhred33V2


qiime cutadapt trim-paired \
 --i-demultiplexed-sequences demux_paired_rat.qza \
 --p-anywhere-f CCTACGGGNBGCAWCAG \
 --p-anywhere-r GGACTACNVGGGTSTCTAAT \
 --p-error-rate 0 \
 --o-trimmed-sequences trimmed-seqs.qza \
 --verbose

# Denoising con DADA2
qiime dada2 denoise-paired \
  --i-demultiplexed-seqs trimmed-seqs.qza \
  --p-trim-left-f 0 \
  --p-trim-left-r 0 \
  --p-trunc-len-f 260 \
  --p-trunc-len-r 215 \
  --o-table table_260215.qza \
  --o-representative-sequences rep_seqs_260215.qza \
  --o-denoising-stats DADA2_260215.qza

# Visualizar estadísticas de denoising
qiime metadata tabulate \
  --m-input-file DADA2_260215.qza \
  --o-visualization DADA2_260215.qzv

# Clasificación taxonómica
qiime feature-classifier classify-sklearn \
  --i-classifier silva-138.1-ssu-nr99-341f-806r-classifier.qza \
  --i-reads rep_seqs_260215.qza \
  --o-classification taxonomy_260215.qza

# Visualizar la clasificación taxonómica
qiime metadata tabulate \
  --m-input-file taxonomy_260215.qza \
  --o-visualization taxonomy_260215.qzv

# Gráfico de barras de la taxonomía
qiime taxa barplot \
  --i-table table_260215.qza \
  --i-taxonomy taxonomy_260215.qza \
  --m-metadata-file sample-metadata.tsv \
  --o-visualization taxa-bar-plots_260215.qzv
  
  
  
# 1. Dominio
qiime taxa collapse \
  --i-table table_260215.qza\
  --i-taxonomy taxonomy_260215.qza \
  --p-level 1 \
  --o-collapsed-table dominio-tabla-silva-rata.qza

qiime tools export \
  --input-path dominio-tabla-silva-rata.qza \
  --output-path exported
cd exported
biom convert -i feature-table.biom -o dominio-tabla-silva-rata.tsv --to-tsv
sed 's/\t/,/g' dominio-tabla-silva-rata.tsv > dominio-tabla-silva-rata.csv
cd ..

# 2. Filo
qiime taxa collapse \
  --i-table table_260215.qza\
  --i-taxonomy taxonomy_260215.qza \
  --p-level 2 \
  --o-collapsed-table filo-tabla-silva-rata.qza

qiime tools export \
  --input-path filo-tabla-silva-rata.qza \
  --output-path exported
cd exported
biom convert -i feature-table.biom -o filo-tabla-silva-rata.tsv --to-tsv
sed 's/\t/,/g' filo-tabla-silva-rata.tsv > filo-tabla-silva-rata.csv
cd ..

# 3. Clase
qiime taxa collapse \
  --i-table table_260215.qza\
  --i-taxonomy taxonomy_260215.qza \
  --p-level 3 \
  --o-collapsed-table clase-tabla-silva-rata.qza

qiime tools export \
  --input-path clase-tabla-silva-rata.qza \
  --output-path exported
cd exported
biom convert -i feature-table.biom -o clase-tabla-silva-rata.tsv --to-tsv
sed 's/\t/,/g' clase-tabla-silva-rata.tsv > clase-tabla-silva-rata.csv
cd ..

# 4. Orden
qiime taxa collapse \
  --i-table table_260215.qza\
  --i-taxonomy taxonomy_260215.qza \
  --p-level 4 \
  --o-collapsed-table orden-tabla-silva-rata.qza

qiime tools export \
  --input-path orden-tabla-silva-rata.qza \
  --output-path exported
cd exported
biom convert -i feature-table.biom -o orden-tabla-silva-rata.tsv --to-tsv
sed 's/\t/,/g' orden-tabla-silva-rata.tsv > orden-tabla-silva-rata.csv
cd ..

# 5. Familia
qiime taxa collapse \
  --i-table table_260215.qza\
  --i-taxonomy taxonomy_260215.qza \
  --p-level 5 \
  --o-collapsed-table familia-tabla-silva-rata.qza

qiime tools export \
  --input-path familia-tabla-silva-rata.qza \
  --output-path exported
cd exported
biom convert -i feature-table.biom -o familia-tabla-silva-rata.tsv --to-tsv
sed 's/\t/,/g' familia-tabla-silva-rata.tsv > familia-tabla-silva-rata.csv
cd ..

# 6. Género
qiime taxa collapse \
  --i-table table_260215.qza\
  --i-taxonomy taxonomy_260215.qza \
  --p-level 6 \
  --o-collapsed-table genero-tabla-silva-rata.qza

qiime tools export \
  --input-path genero-tabla-silva-rata.qza \
  --output-path exported
cd exported
biom convert -i feature-table.biom -o genero-tabla-silva-rata.tsv --to-tsv
sed 's/\t/,/g' genero-tabla-silva-rata.tsv > genero-tabla-silva-rata.csv
cd ..

# 7. Especie
qiime taxa collapse \
  --i-table table_260215.qza\
  --i-taxonomy taxonomy_260215.qza \
  --p-level 7 \
  --o-collapsed-table especie-tabla-silva-rata.qza

qiime tools export \
  --input-path especie-tabla-silva-rata.qza \
  --output-path exported
cd exported
biom convert -i feature-table.biom -o especie-tabla-silva-rata.tsv --to-tsv
sed 's/\t/,/g' especie-tabla-silva-rata.tsv > especie-tabla-silva-rata.csv
cd ..
