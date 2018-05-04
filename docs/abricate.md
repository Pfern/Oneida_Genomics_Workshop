# Using ABRicate to identify antibiotic resistance genes

---

* [_ONEIDA - Genomics Workshop_](./ONEIDA_Workshop_Program.md)
    * [_INNUCA: a genome assembly pipeline_](./innuca.md)
    * [_Genome annotation with Prokka_](./prokka.md)
    * _Using ABRicate to identify antibiotic resistance genes_
        1. [_Find ARGs_](./abricate.md#find-args)
            * [_Task 4_](./abricate.md#annotate-antibiotic-resistance-genes)
        2. [_Run different DBs_](./abricate.md#run-different-dbs)

---

## Find ARGs

### Abricate

**_What is [ABRicate](https://github.com/tseemann/abricate)?_**  

> Mass screening of contigs for antimicrobial resistance or virulence genes. It comes bundled with seven databases: Resfinder, CARD, ARG-ANNOT, NCBI BARRGD, NCBI, EcOH, PlasmidFinder and VFDB.

### Task 4
### Annotate antibiotic resistance genes

Typing with Abricate using Resfinder DB

```bash
# Create folder to store Abricate outputs
export prokka_dir=~/oneida_workshop/genomes/streptococcus_agalactiae/prokka
export abricate_dir=~/oneida_workshop/typing/streptococcus_agalactiae/abricate

mkdir -p $abricate_dir

# Run Abricate for each sample
for sample in $(ls -d $prokka_dir/*/); do
  sample=$(basename $sample)
  mkdir -p $abricate_dir/$sample
  abricate --db resfinder $prokka_dir/$sample/$sample.fna > $abricate_dir/$sample/$sample.abricate_out.tab
done

# Summarize all Abricate results into a single file
abricate --summary $abricate_dir/*/*.abricate_out.tab > $abricate_dir/abricate_summary.resfinder.tab
```
Results [here](https://transfer.sh/KiOn3/abricate.tar.gz).

## Run different DBs

Example on how to run Abricate with different DBs

```bash
prokka_dir=~/oneida_workshop/genomes/streptococcus_agalactiae/prokka
abricate_dir=~/oneida_workshop/typing/streptococcus_agalactiae/abricate

mkdir -p $abricate_dir

for abricate_db in resfinder card vfdb; do
  
  for sample in $(ls -d $prokka_dir/*/); do
    sample=$(basename $sample)
    mkdir -p $abricate_dir/$sample
    abricate --db $abricate_db $prokka_dir/$sample/$sample.fna > $abricate_dir/$sample/$sample.abricate_out.$abricate_db.tab
  done
  
  abricate --summary $abricate_dir/*/*.abricate_out.$abricate_db.tab > $abricate_dir/abricate_summary.$abricate_db.tab
done
```
