# INNUCA: a genome assembly pipeline

---

* [_ONEIDA - Genomics Workshop_](./ONEIDA_Workshop_Program.md)
    * _INNUCA: a genome assembly pipeline_
        1. [_Get genomic data_](./innuca.md#get-genomic-data)
    * [_Genome annotation with Prokka_](./prokka.md)

---

## Get genomic data

### getSeqENA

**_What is [getSeqENA](https://github.com/B-UMMI/getSeqENA)?_**  

> Download sequences from ENA/SRA databases

getSeqENA receives a list of Run Accession IDs to download.

### Download reads

Using 10 _Streptococcus agalactiae_ samples as an example:

```bash
mkdir ~/reads

# Get the file with IDs
wget -O ~/reads/streptococcus_agalactiae_example/MPM_GBS_samples.tab https://raw.githubusercontent.com/INNUENDOCON/MicrobialGenomeMetagenomeCourse/master/MPM_GBS_samples.tab

# Produce a clean file by removing the header line (first line) and containing only the first column
sed 1d ~/reads/streptococcus_agalactiae/MPM_GBS_samples.tab | cut -f 1 > ~/reads/streptococcus_agalactiae/ids.txt

# Download data using getSeqENA
getSeqENA.py --listENAids ~/reads/streptococcus_agalactiae/ids.txt \
             --outdir ~/reads/streptococcus_agalactiae/ \
             --asperaKey  ~/NGStools/aspera/connect/etc/asperaweb_id_dsa.openssh \
             --downloadLibrariesType PAIRED \
             --downloadInstrumentPlatform ILLUMINA \
             --SRAopt
```

## Assembly HTS data

Assembly HTS data using INNUca

### INNUca

**_What is [INNUca](https://github.com/B-UMMI/INNUca)?_**  

> INNUENDO quality control of reads, de novo assembly and contigs quality assessment, and possible contamination detection

### Assembly genomes

```bash
# Run inside a screen
screen -S innuca

# INNUca
INNUca.py --inputDirectory ~/reads/streptococcus_agalactiae/ \
          --speciesExpected "Streptococcus agalactiae" \
          --genomeSizeExpectedMb 2.1 \
          --outdir ~/genomes/streptococcus_agalactiae/innuca/ \
          --threads 8 \
          --fastQCproceed \
          --fastQCkeepFiles \
          --trimKeepFiles \
          --saveExcludedContigs

# Detatch the screen
# Press Ctrl + A (release) and then D
```
