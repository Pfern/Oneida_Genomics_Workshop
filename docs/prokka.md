# Genome annotation with Prokka

---

* [_ONEIDA - Genomics Workshop_](./ONEIDA_Workshop_Program.md)
    * [_INNUCA: a genome assembly pipeline_](./innuca.md)
    * _Genome annotation with Prokka_
        1. [_Annotate genomes_](./prokka.md#annotate-genomes)
            * [_Task 3_](./prokka.md#annotation)
        2. [_Annotations visualization_](./prokka.md#annotations-visualization)
    * [_Using ABRicate to identify antibiotic resistance genes_](./abricate.md)

---

## Annotate genomes

### Prokka

**_What is [Prokka](https://github.com/tseemann/prokka)?_**  

> Prokka is a software tool to annotate bacterial, archaeal and viral genomes quickly and produce standards-compliant output files

### Task 3
### Annotation

```bash
export innuca_dir=~/oneida_workshop/genomes/streptococcus_agalactiae/innuca
export prokka_dir=~/oneida_workshop/genomes/streptococcus_agalactiae/prokka

mkdir -p $prokka_dir

for sample in $(ls -d $innuca_dir/*/); do
  sample=$(basename $sample)
  prokka --outdir $prokka_dir/$sample/ \
         --force \
         --centre ONEIDA \
         --genus Streptococcus \
         --species agalactiae \
         --strain $sample \
         --cpus 8 \
         --prefix $sample \
         --locustag ${sample}p \
         --addgenes \
         --usegenus \
         --rfam \
         --increment 10 \
         --mincontiglen 1 \
         --gcode 11 \
         --kingdom Bacteria \
         $(ls $innuca_dir/$sample/$sample.*fasta | grep --invert-match 'excluded_contigs')
done
```
Results [here](https://transfer.sh/Te3al/prokka.tar.gz).

## Annotations visualization

### Artemis

**_What is [Artemis](http://www.sanger.ac.uk/science/tools/artemis)?_**  

> Artemis is a free genome browser and annotation tool that allows visualisation of sequence features, next generation data and the results of analyses within the context of the sequence, and also its six-frame translation.
