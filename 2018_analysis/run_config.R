# Libraries
source("../common_config.R")
library(fs)
library(dplyr)


# input
# raw_fastq.dir="/data/hts_2018_data/hts2018_pilot_rawdata"
metadata.file=here("info/2018_pilot_metadata.tsv")


# output

trimmed.dir=file.path(outdir_2018, "trimmed_fastqs")
total_samples_starout.dir=file.path(outdir_2018, "total_samples_starout")
mosdepth.dir=file.path(outdir_2018, "mosdepth")
seq.dir = file.path(outdir_2018, "seq_out"); dir.create(seq.dir, recursive = TRUE)
# export final_counts=$data_base/star_counts
igv_tarball = file.path(outdir_2018, "visualize_oligos.tgz")
qc.dir = file.path(outdir_2018, "qc"); dir.create(qc.dir, recursive = TRUE)
qc.raw.dir = file.path(qc.dir, "raw_read_qc"); dir.create(qc.raw.dir, recursive = TRUE)
qc.trim.dir = file.path(qc.dir, "trimmed_read_qc"); dir.create(qc.trim.dir, recursive = TRUE)

# genome




gtf.file %>%
  path_file %>%
  path_ext_remove %>%
  paste0("__with_mito_rrna.gtf") %>%
  file.path(seq.dir, .) ->
  gtf_with_mito_rrna.file

file_S2_path = file.path(fig.dir, "File_S2.gtf")

rrna_oligos.file = file.path(fig.dir, "rrna_oligos.tsv")
rrna_oligos.fastq = file.path(seq.dir, "rrna_oligos.fastq")
rrna_oligos.fastq = file.path(seq.dir, "rrna_oligos.fastq")


rrna_oligo_starout.dir=file.path(outdir_2018, "rrna_oligo_starout")

oligo_bam.file = file.path(rrna_oligo_starout.dir, "rrna_oligos_Aligned.sortedByCoord.out.bam")

# Setup Bash variables

# Input
# Sys.setenv(RAW_FASTQS = raw_fastq.dir)

# Output
Sys.setenv(CUROUT = outdir_2018)

Sys.setenv(TRIMMED = trimmed.dir)
Sys.setenv(GENOME_DIR = genome.dir)
Sys.setenv(TOTAL_SAMPLES_STAROUT = total_samples_starout.dir)
Sys.setenv(MOSDEPTH_OUT = mosdepth.dir)
Sys.setenv(QC_DIR = qc.dir)
Sys.setenv(QC_RAW_DIR = qc.raw.dir)
Sys.setenv(QC_TRIM_DIR = qc.trim.dir)

Sys.setenv(FA_URL = fa_url)
Sys.setenv(GTF_URL = gtf_url)



Sys.setenv(GTF_WITH_MITO_RRNA = gtf_with_mito_rrna.file)
Sys.setenv(FA_WITH_MITO_RRNA = fa_for_mito_rrna.file)
Sys.setenv(RRNA_OLIGOS_FASTQ = rrna_oligos.fastq)
Sys.setenv(RRNA_OLIGO_STAROUT = rrna_oligo_starout.dir)
#--------------------------------
Sys.setenv(ENRICH_COMPARE_STAROUT = starout_2018_dir)

count_suffix = "_ReadsPerGene.out.tab"
bam_suffix = "_Aligned.sortedByCoord.out.bam"


