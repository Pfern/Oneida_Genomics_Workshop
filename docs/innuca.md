# INNUCA: a genome assembly pipeline

---

* [_ONEIDA - Genomics Workshop_](./ONEIDA_Workshop_Program.md)
    * _INNUCA: a genome assembly pipeline_
        1. [_Get genomic data_](./innuca.md#get-genomic-data)
            * [_Task 1_](./innuca.md#download-reads)
        2. [_Assembly HTS data_](./innuca.md#assembly-hts-data)        
            * [_Task 2_](./innuca.md#assembly-genomes)
    * [_Genome annotation with Prokka_](./prokka.md)
    * [_Using ABRicate to identify antibiotic resistance genes_](./abricate.md)

---

## Get genomic data

### getSeqENA

**_What is [getSeqENA](https://github.com/B-UMMI/getSeqENA)?_**  

> Download sequences from ENA/SRA databases

getSeqENA receives a list of Run Accession IDs to download.

### Task 1
### Download reads

Using 10 _Streptococcus agalactiae_ samples as an example:

```bash
mkdir -p ~/oneida_workshop/reads/streptococcus_agalactiae

# Get the file with IDs
wget -O ~/oneida_workshop/reads/streptococcus_agalactiae/MPM_GBS_samples.tab https://raw.githubusercontent.com/INNUENDOCON/MicrobialGenomeMetagenomeCourse/master/MPM_GBS_samples.tab

# Produce a clean file by removing the header line (first line) and containing only the first column
sed 1d ~/oneida_workshop/reads/streptococcus_agalactiae/MPM_GBS_samples.tab | cut -f 1 > ~/oneida_workshop/reads/streptococcus_agalactiae/ids.txt

# Download data using getSeqENA
getSeqENA.py --listENAids ~/oneida_workshop/reads/streptococcus_agalactiae/ids.txt \
             --outdir ~/oneida_workshop/reads/streptococcus_agalactiae/ \
             --asperaKey  ~/oneida_tools/aspera_connect/etc/asperaweb_id_dsa.openssh \
             --downloadLibrariesType PAIRED \
             --downloadInstrumentPlatform ILLUMINA
```

## Assembly HTS data

Assembly HTS data using INNUca

### INNUca

**_What is [INNUca](https://github.com/B-UMMI/INNUca)?_**  

> INNUENDO quality control of reads, de novo assembly and contigs quality assessment, and possible contamination detection

### Task 2
### Assembly genomes

```bash
# INNUca
INNUca.py --inputDirectory ~/oneida_workshop/reads/streptococcus_agalactiae/ \
          --speciesExpected "Streptococcus agalactiae" \
          --genomeSizeExpectedMb 2.1 \
          --outdir ~/oneida_workshop/genomes/streptococcus_agalactiae/innuca/ \
          --threads 8 \
          --fastQCproceed \
          --fastQCkeepFiles \
          --trimKeepFiles \
          --saveExcludedContigs
```
Results [here](https://transfer.sh/6v3lY/innuca.tar.gz) (without trimmed fastq files).
