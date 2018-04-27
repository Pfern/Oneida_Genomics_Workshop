# Genome annotation with Prokka

---

* [_ONEIDA - Genomics Workshop_](./ONEIDA_Workshop_Program.md)
    * [_INNUCA: a genome assembly pipeline_](./innuca.md)
    * _Genome annotation with Prokka_
        1. [_Annotate genomes_](./prokka.md#annotate-genomes)

---

## Annotate genomes

### Prokka

**_What is [Prokka](https://github.com/tseemann/prokka)?_**  

> Prokka is a software tool to annotate bacterial, archaeal and viral genomes quickly and produce standards-compliant output files

### Annotation

```bash
# Run inside a screen
screen -S prokka

export innuca_dir=~/genomes/streptococcus_agalactiae/innuca
export prokka_dir=~/genomes/streptococcus_agalactiae/prokka

mkdir -p $prokka_dir

ls -d $innuca_dir/*/ | \
    parallel --jobs 8 '
                       sample=$(basename {});
                       prokka --outdir $prokka_dir/$sample/ \
                              --force \
                              --centre ONEIDA \
                              --genus Streptococcus \
                              --species agalactiae \
                              --strain $sample \
                              --cpus 1 \
                              --prefix $sample \
                              --locustag ${sample}p \
                              --addgenes \
                              --usegenus \
                              --rfam \
                              --increment 10 \
                              --mincontiglen 1 \
                              --gcode 1 \
                              --kingdom Bacteria \
                              $innuca_dir/$sample/$sample.contigs.*fasta'

# Detatch the screen
# Press Ctrl + A (release) and then D
```
